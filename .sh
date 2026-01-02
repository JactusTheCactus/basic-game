#!/usr/bin/env bash
set -euo pipefail
flag() {
	for f in "$@"
		do [[ -e ".flags/$f" ]] || return 1
	done
}
rm -rf bin logs 2> /dev/null || :
mkdir -p bin logs logs/build
if ! [[ -f src/firacode.ttf ]]
	then
		curl -fL \
			https://font.download/dl/font/fira-code-2.zip \
			--output src/firacode.zip
		unzip \
			-oj \
			src/firacode.zip \
			FiraCode-Regular.ttf \
			-d src
		mv \
			src/FiraCode-Regular.ttf \
			src/firacode.ttf
		rm -r src/firacode.zip
fi
while read -r s
	do
		b="${s#src/}"
		b="${b%.bas}"
		./qb64.sh \
			-x "$s" \
			-o "$PWD/bin/$b" \
			&> "logs/build/$b.log" \
			&& rm "logs/build/$b.log"
done < <(find src -name \*.bas)
rsync -a --exclude=*.bas src/ bin
flag local && ./bin/app || :
find . -empty -delete