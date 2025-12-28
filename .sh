#!/usr/bin/env bash
set -euo pipefail
flag() {
	for f in "$@"
		do [[ -e ".flags/$f" ]] || return 1
	done
}
rm -rf bin logs 2> /dev/null || :
mkdir -p bin logs logs/build
curl -L \
	https://github.com/QB64Official/qb64/releases/download/v2.1/qb64_dev_2022-09-08-07-14-00_47f5044_lnx.tar.gz \
	--output - | tar -xz --transform='s|^[^/]*|qb64|'
find qb64 -type f ! \( \
	-name qb64 -o \
	-path \*/internal/c/\* -o \
	-wholename \*/internal/support/vwatch/vwatch_stub.bm \
\) -delete
while read -r s
	do
		b=${s%.bas}
		b=${b#src/}
		./qb64/qb64 -x $s -o ../bin/$b
done < <(find src -name \*.bas)
if flag local
	then ./bin/game || :
fi
find . -empty -delete