# AI-Facilitated Neuromodulation-Induced Behavioral Analysis

A computational analysis pipeline for evaluating the **movement selectivity** of **Temporal Interference Stimulation (TIS)** compared to conventional **biphasic electrical stimulation** in peripheral nerve/motor neuromodulation. This repository accompanies the study published in the *Journal of NeuroEngineering and Rehabilitation*:

> **Reference:** [10.1186/s12984-025-01825-3](https://link.springer.com/article/10.1186/s12984-025-01825-3)

---

## Overview

Temporal Interference Stimulation (TIS) is an emerging electrical neurostimulation technique that delivers two high-frequency carrier signals with a slight frequency offset, producing a low-frequency interference envelope that can selectively activate neural targets. This project quantifies **how selectively** TIS versus conventional biphasic stimulation drives distinct movement patterns across multiple electrode configurations in animal subjects.

The pipeline processes raw kinematic tracking data through behavioral segmentation, selectivity scoring, clustering, and statistical comparison to characterize the spatial precision of each stimulation modality.

---

## Repository Structure

| File | Description |
|------|-------------|
| `Josh-movement.ipynb` | Preprocessing of DeepLabCut (DLC) tracking data — loading, cleaning, normalizing limb/foot coordinates (hip, knee, ankle, heel, toes) across multiple experimental batches |
| `Josh-KPMS.ipynb` | KeyPoint-MoSeq (KPMS) behavioral syllable analysis — extracts movement syllable usage across electrode configurations and computes the **selectivity index** per electrode pair |
| `Josh-selectivity-analysis.ipynb` | Statistical comparison of TIS vs. biphasic selectivity scores — bootstrap resampling, Mann-Whitney U test, Welch's t-test, Cohen's d effect size, and linear mixed models (LMM) |
| `Josh-cluster-batch12.ipynb` | Dimensionality reduction (UMAP) and density-based clustering (HDBSCAN) of kinematic displacement features to assess configuration-level movement separability |
| `Josh-file-extract.ipynb` | Batch file ingestion and preprocessing pipeline — loads and standardizes DLC CSV output across all experimental batches into a unified DataFrame |
| `AMI Metrics.csv` | Adjusted Mutual Information (AMI) scores from HDBSCAN clustering, used to evaluate how well movement clusters align with stimulation configurations |
| `KPMS SE LMM test.csv` | Long-format dataset of selectivity scores per animal, configuration, and stimulation type, used as input to the linear mixed models |

---

## Analysis Pipeline

```
Raw DLC Tracking CSVs
        │
        ▼
1. Preprocessing (Josh-movement.ipynb, Josh-file-extract.ipynb)
   - Load multi-batch DLC output (hip, knee, ankle, heel, toes: x/y coordinates)
   - Handle missing values via linear interpolation
   - Normalize coordinates with MinMaxScaler
   - Compute frame-wise Euclidean displacement features
        │
        ▼
2. Clustering Analysis (Josh-cluster-batch12.ipynb)
   - Reduce kinematic features with UMAP (3D, Bayesian-optimized hyperparameters)
   - Cluster with HDBSCAN to identify movement groups
   - Evaluate with Silhouette Score, Adjusted Rand Index (ARI), and AMI
        │
        ▼
3. Behavioral Segmentation (Josh-KPMS.ipynb)
   - Apply KeyPoint-MoSeq to segment movement into discrete behavioral syllables
   - Count syllable usage per stimulation trial and electrode configuration
        │
        ▼
4. Selectivity Index Computation (Josh-KPMS.ipynb)
   - Convert syllable counts to probability distributions across trials
   - Compute Shannon entropy (base-2) over syllable distributions
   - Selectivity Index = 1 − entropy (higher = more selective activation)
        │
        ▼
5. Statistical Analysis (Josh-selectivity-analysis.ipynb)
   - Bootstrap resampling (n = 1,000 iterations) for robust inference
   - Mann-Whitney U test and Welch's t-test (TIS vs. Biphasic)
   - Cohen's d effect size
   - Linear Mixed Models (LMM) controlling for animal ID and configuration
```

---

## Selectivity Index

The selectivity index is computed from the Shannon entropy of behavioral syllable probability distributions across stimulation trials for a given electrode configuration:

```
P(syllable_i | trial_j) = count(syllable_i, trial_j) / Σ count(syllable_k, trial_j)

H = −Σ P(syllable_i) · log₂(P(syllable_i))

Selectivity = 1 − H
```

A **selectivity index of 1** indicates a single syllable is exclusively used across all trials (maximally selective); a value approaching **0** indicates uniform distribution across syllables (no selectivity). Scores were compared across electrode pairs (e.g., E3_34 & E14_46, E3_34 & E27_58, E14_46 & E27_58) and stimulation types.

---

## Key Methods

- **DeepLabCut (DLC):** Markerless pose estimation for tracking 10 lower-limb keypoints (hip, knee, ankle, heel, instep, toes 1–5) at video frame resolution
- **KeyPoint-MoSeq (KPMS):** Unsupervised behavioral segmentation into discrete movement syllables from keypoint trajectories
- **UMAP:** Nonlinear dimensionality reduction for visualizing high-dimensional movement feature spaces
- **HDBSCAN:** Density-based hierarchical clustering for identifying configuration-specific movement clusters without requiring a pre-specified cluster count
- **Bootstrap LMM:** Linear mixed models with random effects for animal ID to account for repeated measures across configurations

---

## Dependencies

```
pandas
numpy
scipy
scikit-learn
matplotlib
seaborn
statsmodels
umap-learn
hdbscan
plotly
openpyxl
numba
skopt (scikit-optimize)
```

---

## Citation

If you use this code or data, please cite:

> *Olorocisimo J.P., et. al.* Temporal interference stimulation of peripheral nerves induces functionally diverse limb movements revealed by automated pose estimation and unsupervised behavioral analysis. *Journal of NeuroEngineering and Rehabilitation*, 2025. https://doi.org/10.1186/s12984-025-01825-3
