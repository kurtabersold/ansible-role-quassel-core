#!/bin/bash

# Quassel Core TLS Certificate Renewal Script

echo "$(TZ="America/Los_Angeles" date --iso-8601=seconds) Running $0" >> ${LOG}

# TODO validation?
cat ${CERTPATH}/privkey.pem ${CERTPATH}/fullchain.pem > /var/lib/quassel/quasselCert.pem
# /bin/chown quasselcore:quassel /var/lib/quassel/quasselCert.pem
# /bin/chmod 0660 /var/lib/quassel/quasselCert.pem
/bin/systemctl restart quasselcore.service  #>> ${LOG} 2>&1
# /usr/bin/pkill -HUP quasselcore # When the new version comes out

