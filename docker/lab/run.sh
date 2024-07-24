#!/bin/bash

# jupyter lab --no-browser --ip "*" --ServerApp.port=8888 --allow-root --NotebookApp.token=''
jupyter server --no-browser --ip "*" --allow-root --ServerApp.token=''
