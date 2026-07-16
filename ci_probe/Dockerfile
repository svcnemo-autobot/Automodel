# Probe image: 26.04 automodel base + TE 2.14.1 rebuilt against the base's torch/CUDA.
# Purpose: isolate whether the TE 2.11->2.14 bump alone drives the GLM perf regression.
FROM nvcr.io/nvidia/nemo-automodel:26.04
ENV MAX_JOBS=8
# Reinstall TE at 2.14.1 with the pytorch extra so the framework extension compiles
# against the base image's own torch (2.11) and CUDA (13) — no torch/CUDA change.
RUN pip uninstall -y transformer_engine transformer_engine_torch transformer_engine_cu12 transformer_engine_cu13 2>/dev/null; \
    pip install --no-build-isolation "transformer_engine[pytorch]==2.14.1"
RUN python -c "import transformer_engine as te; print('TE', te.__version__); import transformer_engine.pytorch; print('TE.pytorch import OK'); import torch; print('torch', torch.__version__, 'cuda', torch.version.cuda)"
