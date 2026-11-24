#!/bin/bash

export CUDA_VISIBLE_DEVICES=0
export VLLM_NIXL_SIDE_CHANNEL_PORT=5600
export UCX_NET_DEVICES=all

MODEL="Qwen/Qwen3-0.6B"

vllm serve $MODEL \
    --host 0.0.0.0 \
    --port 8100 \
    --kv-transfer-config '{
        "kv_connector": "NixlConnector",
        "kv_role": "kv_producer"
    }'