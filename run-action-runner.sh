#! /bin/bash

cd ~

curl -o actions-runner-linux-x64-2.317.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.317.0/actions-runner-linux-x64-2.317.0.tar.gz

tar xzf ./actions-runner-linux-x64-2.317.0.tar.gz

echo "URL: ${GH_RUNNER_URL}"
echo "TOKEN: ${GH_RUNNER_TOKEN}"

./config.sh --url ${GH_RUNNER_URL} --token ${GH_RUNNER_TOKEN} --name self-hosted --unattended --replace

./run.sh