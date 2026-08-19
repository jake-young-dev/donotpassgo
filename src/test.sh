#!/bin/bash

set -eo pipefail

if [[ "$TEST_LIBRARY" == "none" ]]; then
    echo "[INFO] test-library input not set, skipping unit tests.";
    exit 0;
fi

echo "[INFO] running unit tests";
if [[ "$TEST_LIBRARY" == "standard" ]]; then
    if go test ./...; then
        echo "[INFO] unit tests passed!";
        exit 0;
    else
        if [[ "$TEST_FAIL" == "yes" ]]; then
            echo "[FATAL] unit tests failed!";
            exit 1;
        else
            echo "[INFO] unit tests failed!";
        fi
    fi
fi

if [[ "$TEST_LIBRARY" == "ginkgo" ]]; then
    if ginkgo ./...; then
        echo "[INFO] unit tests passed!";
        exit 0;
    else
        if [[ "$TEST_FAIL" == "yes" ]]; then
            echo "[FATAL] unit tests failed!";
            exit 1;
        else
            echo "[INFO] unit tests failed!";
        fi
    fi
fi