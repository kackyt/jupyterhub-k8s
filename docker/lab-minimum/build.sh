#!/bin/bash

set -e

curl -LsSf https://astral.sh/uv/install.sh | sh
curl -sSf https://rye.astral.sh/get | RYE_NO_AUTO_INSTALL=1 RYE_INSTALL_OPTION="--yes" bash

. "$HOME/.rye/env"

rye sync --no-dev

. ".venv/bin/activate"

jupyter lab build --dev-build=False --minimize=False

{
echo "source $HOME/.cargo/env"
echo "source $HOME/.rye/env"
echo "source .venv/bin/activate"
} >> $HOME/.bash_profile
