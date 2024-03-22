#!/bin/bash

source .rye/env
source .venv/bin/activate

# jupyter lab --no-browser --ip "*" --ServerApp.port=8888 --allow-root --NotebookApp.token=''
jupyter server --no-browser --ip "*" --allow-root --NotebookApp.token=''
