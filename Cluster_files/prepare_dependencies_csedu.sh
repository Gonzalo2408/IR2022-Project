#! /usr/bin/env bash
set -e

# set variable to path where this script is
SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
cd "$SCRIPT_DIR" || exit 1

# load the environment variables from the `.env` file
source ../.env 2> /dev/null || source .env

# install the `virtualenv` command
python3 -m pip install --upgrade pip
python3 -m pip install --user virtualenv

# set up a virtual environment located at
# /scratch/$USER/virtual_environments/project_name
# and make a symlink to the virtual environment
# at the root directory of this project called "venv"
echo "### SETTING UP VIRTUAL ENVIRONMENT ON CN99 ###"
./setup_virtual_environment.sh

# make sure that there's also a virtual environment
# on the GPU nodes
echo "### SETTING UP VIRTUAL ENVIRONMENT ON CN47 ###"
ssh cn47 "
  source .profile
  cd $PWD;
  ./setup_virtual_environment.sh
"

echo "### SETTING UP VIRTUAL ENVIRONMENT ON CN48 ###"
ssh cn48 "
  source .profile
  cd $PWD;
  ./setup_virtual_environment.sh
"
