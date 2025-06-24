ARG BASE_IMAGE=ubuntu:22.04 

FROM ${BASE_IMAGE}

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    texlive-fonts-recommended \
    texlive-latex-extra \
    texlive-fonts-extra \
    dvipng \
    texlive-latex-recommended \
    texlive-base \
    texlive-pictures \
    texlive-lang-cyrillic \
    texlive-science \
    cm-super \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY ./CV ./CV

RUN echo '#!/bin/bash' > /usr/local/bin/build.sh && \
    echo 'cd /app/CV' >> /usr/local/bin/build.sh && \
    echo 'pdflatex -interaction=nonstopmode main.tex' >> /usr/local/bin/build.sh && \
    echo 'pdflatex -interaction=nonstopmode main.tex' >> /usr/local/bin/build.sh && \
    echo 'mv main.pdf ../resume.pdf' >> /usr/local/bin/build.sh

RUN chmod +x /usr/local/bin/build.sh

ENTRYPOINT ["/usr/local/bin/build.sh"]