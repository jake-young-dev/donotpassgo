#!/bin/bash

set -eo pipefail

version=$(go version);
if [[ ! -n "$version" ]]; then
    echo "[FATAL] golang is not installed";
    exit 1;
fi

go install golang.org/x/vuln/cmd/govulncheck@latest
go install github.com/securego/gosec/v2/cmd/gosec@latest

if [[ "$TEST_LIBRARY" == "ginkgo" ]]; then
    go install github.com/onsi/ginkgo/v2/ginkgo@$TEST_VERSION
fi