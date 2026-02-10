#!/usr/bin/env bash
set -Eeu

readonly MY_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

docker build --tag=cyber-dojo-languages/csharp "${MY_DIR}"