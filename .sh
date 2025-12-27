#!/usr/bin/env bash
set -euo pipefail
rm -rf bin logs qb64 2> /dev/null || :
mkdir -p bin logs logs/build
ln -sf "$HOME/Apps/qb64/qb64" qb64
while read -r s
	do
		b=${s%.bas}
		b=${b#src/}
		log=logs/build/$b.log
		./qb64 -x $s -o "$HOME/Projects/basic-game/bin/$b" &> $log || cat $log && sleep 5
		./bin/$b || :
done < <(find src -name \*.bas)
find . -empty -delete