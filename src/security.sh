#!/bin/bash

set -eo pipefail

if [[ "$STATIC_FLAG" == "no" && "$VULN_CHECK" == "no" ]]; then
    echo "[INFO] no security flags set, skipping!";
    exit 0;
fi

toolchain=$(go mod edit -json go.mod | jq -r ".Toolchain // empty");
version=$(go env -json | jq -r ".GOVERSION // empty");

if [[ -n "$toolchain" ]]; then
    echo "[DEBUG] overwriting version with toolchain";
    version=$toolchain;
fi

if [[ "$STATIC_FLAG" == "yes" ]]; then
    if GOTOOLCHAIN=$version gosec ./...; then
        echo "[INFO] gosec passed!";
    else
        if [[ "$STATIC_FAIL" == "yes" ]]; then
            echo "[FATAL] gosec failed!";
            exit 1;
        else
            echo "[INFO] gosec failed!";
        fi
    fi
fi

if [ "$VULN_CHECK" == "yes" ]; then
    if GOTOOLCHAIN=$version govulncheck ./...; then
        echo "[INFO] govulncheck passed!";
    else
        if [ "$VULN_FAIL" == "yes" ]; then
            echo "[FATAL] govulncheck failed!"
            exit 1;
        else
            echo "[INFO] govulncheck failed!"
        fi
    fi
fi