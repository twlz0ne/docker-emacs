FROM ubuntu
RUN apt-get update && apt-get install -y \
        apt-transport-https \
        gnupg2 \
        curl \
        software-properties-common \
        && rm -rf /var/lib/apt/lists/*
RUN add-apt-repository ppa:kelleyk/emacs \
        && apt-get update && apt-get install -y \
        emacs26-nox \
        && rm -rf /var/lib/apt/lists/*
ADD .emacs.d /root/.emacs.d
RUN emacs -batch -l ~/.emacs.d/init.el
ADD main.dart main.dart
CMD emacs main.dart