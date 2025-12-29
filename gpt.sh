#!/usr/bin/env bash
set -euo pipefail
echo Thoughts?
while read -r f
	do printf '# `%s`\n```sh\n%s\n```\n' "$f" "$(cat $f)"
done < <(find . -maxdepth 1 -name \*.sh ! -name gpt.sh)