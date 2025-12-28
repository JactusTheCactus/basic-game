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
while read -r s
	do
		b=${s%.bas}
		b=${b#src/}
		./qb64/qb64 -x $s -o ../bin/$b &> logs/build/$b.log \
			&& rm logs/build/$b.log
done < <(find src -name \*.bas)
rm -rf qb64
if flag local
	then ./bin/app || :
fi
find . -empty -delete