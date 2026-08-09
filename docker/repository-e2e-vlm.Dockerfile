ARG BASE_IMAGE
FROM ${BASE_IMAGE}

WORKDIR /opt/Automodel

# The native hf_transformer_vlm CI lane installs this opt-in extra at runtime.
# Populate both the venv and uv cache while the image build has package egress so
# the unchanged launcher can repeat the install in the offline GPU sandbox.
RUN . /opt/venv/env.sh && uv pip install ".[vlm-media]"

ENV UV_OFFLINE=1
