#!/usr/bin/env bash

set -e

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )


echo "Resetting state"
cp $SCRIPT_DIR/dep/unmodified-index.d.ts $SCRIPT_DIR/dep/index.d.ts
rm -rf $SCRIPT_DIR/main/index.js $SCRIPT_DIR/main/tsconfig.tsbuildinfo

echo ""
echo ""

echo "First, we compile main with an unmodified index.d.ts in dep"
cd $SCRIPT_DIR/main
npx tsc --build

echo ""
echo ""

echo "We modify dep's index.d.ts with an incompatible version"
cp $SCRIPT_DIR/dep/modified-index.d.ts $SCRIPT_DIR/dep/index.d.ts

echo ""
echo ""

echo "Try to recompile main"
npx tsc --build

echo ""
echo ""

echo "Compilation should have failed!"