FROM ubuntu
RUN apt-get update && apt-get install -y \
        emacs
        && rm -rf /var/lib/apt/lists/*
ADD .emacs.d /root/.emacs.d
RUN emacs -batch -l ~/.emacs.d/init.el
