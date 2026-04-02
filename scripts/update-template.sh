#!/usr/bin/env bash

git fetch template
git subtree pull --prefix=framework/ template framework-only --squash -m "chore: update framework"
