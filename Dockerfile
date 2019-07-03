FROM fedora:latest

USER root

RUN dnf install -y curl golang vim git which findutils clang clang-devel clang-tools-extra

RUN dnf install -y unzip python3-virtualenv

RUN curl -O -L http://github.com/bazelbuild/bazel/releases/download/0.20.0/bazel-0.20.0-installer-linux-x86_64.sh && chmod 777 bazel-0.20.0-installer-linux-x86_64.sh && ./bazel-0.20.0-installer-linux-x86_64.sh

RUN curl -O -L https://github.com/bazelbuild/buildtools/releases/download/0.20.0/buildifier && chmod 777 buildifier

RUN ln -s /buildifier /usr/local/bin/buildifier && ln -s /usr/bin/clang-format /usr/bin/clang-format-7

#RUN git clone http://github.com/bdecoste/envoy -b common_secret && cd envoy && git remote add upstream http://github.com/envoyproxy/envoy && git fetch upstream && git reset --hard upstream/master

#RUN cd envoy && git config user.name "William DeCoste" && git config user.email "bdecoste@gmail.com"

#RUN cd envoy && ./support/bootstrap

#RUN export CLANG_FORMAT=/usr/bin/clang-format && export BUILDIFIER_BIN=/buildifier
