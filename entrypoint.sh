#!/bin/sh

# yum install -y createrepo

# Change DESTDIR path to RPMS directory of your repo
DESTDIR="/rpm-repo"

for ARCH in x86_64
do
    pushd ${DESTDIR}/${ARCH} >/dev/null 2>&1
        createrepo .
    popd >/dev/null 2>&1
done
