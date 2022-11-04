#!/bin/bash
#
# Original script Copyright (c) Johannes Feichtner <johannes@web-wack.at>
#
# Script to build acme-esxi VIB using VIB Author

LOCALDIR=$(dirname "$(readlink -f "$0")")
cd "${LOCALDIR}/.." || exit

docker rmi -f acme-esxi 2> /dev/null
rm -rf artifacts
docker build -t vibauthor -f build/Dockerfile.vibauthor .
docker run -it -v $(pwd):/acme-esxi --rm --name vibauthor vibauthor /bin/bash /acme-esxi/build/create_vib.sh
