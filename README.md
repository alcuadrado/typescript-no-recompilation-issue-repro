# Manually updating a dependency's .d.ts file doesn't trigger a recompilation when using --build

This repository reproduces an issue with typescript's incremental build system when using `--build`.

If you succesfully compile a project, and then manually modify one of its dependencies' `.d.ts` files, the next time you run `tsc --build` in your project it won't be recompiled.

## How to reproduce it

Just run `bash reproduce.sh`
