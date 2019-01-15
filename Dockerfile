FROM ubuntu
RUN apt-get update && apt-get install -y \
        apt-transport-https \
        gnupg2 \
        curl \
        software-properties-common \
        git \
        make \
        texinfo \
        locales \
        install-info \
        && rm -rf /var/lib/apt/lists/*
RUN add-apt-repository ppa:kelleyk/emacs && apt-get update && apt-get install -y \
       emacs26-nox \
       && rm -rf /var/lib/apt/lists/*
RUN locale-gen en_US.UTF-8
RUN mkdir -p ~/.emacs.d/lisp
RUN git config --global core.autocrlf true
RUN git clone https://github.com/haskell/haskell-mode.git
WORKDIR haskell-mode
# CMD emacs -f toggle-debug-on-error haskell-font-lock.el
CMD emacs -batch --eval="(progn (setq debug-on-error t) (byte-compile-file \"haskell-font-lock.el\"))"
# CMD make
