#!/usr/bin/env bash

# Remove the following option, added by WordPress Toolkit to the wp-config.php file during "Scan for the WordPress websites" operation:
# define('WP_AUTO_UPDATE_CORE', 'minor');// This setting is required to make sure that WordPress updates can be properly managed in WordPress Toolkit. Remove this line if this WordPress website is not managed by WordPress Toolkit anymore.

set -e

BASE_PATH="${1}"

if [[ -z "${BASE_PATH}" ]]
then
  echo "Please specify a folder to search for wp-config.php"
  exit 1
fi

find "${BASE_PATH}" -type f -name "wp-config.php" -print0 | xargs -0 sed -i "s|define('WP_AUTO_UPDATE_CORE', 'minor');// This setting is required to make sure that WordPress updates can be properly managed in WordPress Toolkit. Remove this line if this WordPress website is not managed by WordPress Toolkit anymore.||g"
