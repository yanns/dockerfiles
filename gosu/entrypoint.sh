#!/bin/bash

# Add local user
# Either use the LOCAL_USER_ID if passed in at runtime or
# fallback

USER_ID=${LOCAL_USER_ID:-9001}

echo "Starting with UID : $USER_ID"
useradd --shell /bin/bash -u $USER_ID -o -c "" -m user --create-home
export HOME=/home/user

ls -la /home/user
/usr/local/bin/gosu user bash -c "mkdir -p /home/user/.themes && ln -s /usr/share/themes/Ambiance '/home/user/.themes/Adwaita'"
/usr/local/bin/gosu user bash -c "mkdir -p /home/user/.icons && ln -s /usr/share/icons/ubuntu-mono-dark '/home/user/.icons/Adwaita'"
exec /usr/local/bin/gosu user "$@"
