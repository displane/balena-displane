#!/bin/bash
set -euo pipefail
git clone https://github.com/displane/client-oss.git
balena push displane-x86_64
balena push displane-armv7hf
balena push displane-aarch64
rm -rf client-oss