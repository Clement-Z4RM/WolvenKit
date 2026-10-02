#!/bin/sh -l

ls
cd "${GITHUB_WORKSPACE}"
ls
echo "./App/WolvenKit.CLI $ARGUMENTS" | sh
