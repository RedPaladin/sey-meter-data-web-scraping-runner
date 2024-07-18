FROM mcr.microsoft.com/dotnet/runtime-deps:6.0-jammy

ENV GH_RUNNER_URL=changeme
ENV GH_RUNNER_TOKEN=changeme

RUN apt-get update \
    && apt-get install -y wget gnupg curl \
    && wget https://dl-ssl.google.com/linux/linux_signing_key.pub -O /tmp/google.pub \
    && gpg --no-default-keyring --keyring /etc/apt/keyrings/google-chrome.gpg --import /tmp/google.pub \
    && echo 'deb [arch=amd64 signed-by=/etc/apt/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main' | tee /etc/apt/sources.list.d/google-chrome.list \
    && apt-get update \
    && apt-get install -y google-chrome-stable \
    && rm -rf /var/lib/apt/lists/*

RUN adduser --disabled-password --gecos '' runner

USER runner

ADD run-action-runner.sh /home/runner/

CMD ~/run-action-runner.sh