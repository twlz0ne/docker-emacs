FROM ubuntu
RUN apt-get update && apt-get install -y \
        emacs-nox \
        apt-transport-https \
        gnupg2 \
        curl \
        && rm -rf /var/lib/apt/lists/*
ADD .emacs.d /root/.emacs.d
RUN emacs -batch -l ~/.emacs.d/init.el
RUN curl https://raw.githubusercontent.com/flutter/flutter/master/examples/platform_channel/lib/main.dart > main.dart
