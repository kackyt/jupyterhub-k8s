#!/bin/bash

set -e

curl -LsSf https://astral.sh/uv/install.sh | sh
curl -sSf https://rye.astral.sh/get | RYE_TOOLCHAIN_VERSION="3.12" RYE_INSTALL_OPTION="--yes" bash

. "$HOME/.cargo/env"
. "$HOME/.rye/env"

rye config --set-bool behavior.use-uv=true
HTTP_TIMEOUT=86400 rye sync --no-dev --no-lock

. ".venv/bin/activate"

# rye config --set-bool behavior.use-uv=false
# rye add xformers
# rye config --set-bool behavior.use-uv=true
# rye lock
# rye config --set-bool behavior.use-uv=false
# rye sync --no-lock

jupyter lab build --dev-build=False --minimize=False

{
echo "source $HOME/.cargo/env"
echo "source $HOME/.rye/env"
echo "source .venv/bin/activate"
} >> $HOME/.bash_profile
