#!/bin/bash

source .rye/env
source .venv/bin/activate

jupyter lab --no-browser --ip "*" --port 9000 --allow-root --NotebookApp.token=''
