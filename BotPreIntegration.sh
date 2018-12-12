#!/bin/sh

#  BotPreIntegration.sh
#  SExtensions
#
#  Created by Ray on 2018/12/12.
#  Copyright © 2018 Ray. All rights reserved.

# Makes sure the encoding is correct.
export LANG=en_US.UTF-8

# Adds bin directory to the path so Ruby can find its binaries.
export PATH=/usr/local/bin:$PATH

# Goes to repo directory.
cd ${XCS_PRIMARY_REPO_DIR}
pwd

# Installs gems to tmp directory where can be written without root access.
bundle install --path /tmp/gems --verbose

# Installs pods.
# bundle exec pod install --repo-update

# Adds sh ${XCS_PRIMARY_REPO_DIR}/BotPreIntegration.sh to Bot Triggers Pre-Integration Scripts.
