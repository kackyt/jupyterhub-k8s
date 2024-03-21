#!/bin/bash

set -e

curl -sSf https://rye-up.com/get | RYE_NO_AUTO_INSTALL=1 RYE_INSTALL_OPTION="--yes" bash

. $HOME/.rye/env

rye config --set-bool behavior.use-uv=true
rye sync --no-dev

. .venv/bin/activate

jupyter lab build --dev-build=False --minimize=False

echo "source $HOME/.rye/env" >> $HOME/.bash_profile
echo "source .venv/bin/activate" >> $HOME/.bash_profile
