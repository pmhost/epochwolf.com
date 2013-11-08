#!/bin/bash
set -e 

say "Starting auto deploy"
rake build
say "Build complete, deploying"
rake deploy
say "Deploy complete"