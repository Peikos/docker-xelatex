FROM debian:latest
MAINTAINER Brian van der Bijl <peikos@peikos.net>

LABEL version="1.1.0"

ENV DEBIAN_FRONTEND noninteractive

# Install all TeX and LaTeX dependences
RUN apt-get update && \
  apt-get install --yes --no-install-recommends \
  make \
  git \
  ca-certificates \
  lmodern \
  texlive-latex-base \
  texlive-fonts-recommended \
  texlive-generic-recommended \
  texlive-lang-english \
  texlive-lang-european \
  texlive-latex-extra \
  texlive-bibtex-extra \
  texlive-pstricks \
  biber \
  fontconfig \
  texlive-xetex && \
  apt-get autoclean && apt-get --purge --yes autoremove && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Export the output data
WORKDIR /data
VOLUME ["/data"]

