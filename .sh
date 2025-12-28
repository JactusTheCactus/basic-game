#!/usr/bin/env bash
set -euo pipefail
rm -rf apps bin logs qb64 2> /dev/null || :
mkdir -p apps bin logs logs/build
curl \
	https://github.com/QB64Official/qb64/releases/download/v2.1/qb64_dev_2022-09-08-07-14-00_47f5044_lnx.tar.gz \
	-L \
	-o apps/qb64.tar.gz
# tar -xf apps/qb64.tar.gz &> logs/qb64.log
ln -sf "$HOME/Apps/qb64/qb64" qb64
while read -r s
	do
		b=${s%.bas}
		b=${b#src/}
		log=logs/build/$b.log
		./qb64 -x $s -o "$HOME/Projects/basic-game/bin/$b" &> $log || cat $log && sleep 5
		# ./bin/$b || :
done < <(find src -name \*.bas)
find . -empty -o -name "qb64" -delete