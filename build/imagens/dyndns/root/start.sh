#!/bin/bash

set -e


if [[ ! -z "$USER" ]] && [[ ! -z "$PASS" ]] && [[ ! -z "$HOST" ]] ; then
  export CRON_STRINGS="*/10 * * * * noipy -u "$USER" -p "$PASS" -n "$HOST" --provider noip"
  rm -rf /var/spool/cron/crontabs && mkdir -m 0644 -p /var/spool/cron/crontabs
  [ "$(ls -A /etc/cron.d)" ] && cp -f /etc/cron.d/* /var/spool/cron/crontabs/ || true
  echo -e "$CRON_STRINGS\n" > /var/spool/cron/crontabs/CRON_STRINGS
  chmod -R 0644 /var/spool/cron/crontabs

else
  echo "Insufficient parameters specified."
  echo "User: $USER"
  echo "Pass: $PASS"
  echo "Host: $HOST"
fi

exec "$@"