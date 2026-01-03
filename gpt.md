Thoughts?
# `./.sh`
```sh
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
flag local && "./bin/$1" || :
find . -empty -delete
```
# `./qb64.sh`
```sh
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
```
