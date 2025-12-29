#!/usr/bin/env bash
set -euo pipefail
mkdir -p config
if ! [[ -d qb64 ]]
	then
		curl -fL \
			https://github.com/QB64Official/qb64/releases/download/v2.1/qb64_dev_2022-09-08-07-14-00_47f5044_lnx.tar.gz \
			--output - | tar -xz --transform='s|^[^/]*|qb64|'
		[[ -f config/qb64.ini ]] && cp config/qb64.ini qb64/internal/config.ini
fi
./qb64/qb64 "$@" && cp qb64/internal/config.ini config/qb64.ini