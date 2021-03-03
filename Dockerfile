FROM continuumio/miniconda3

RUN apt update && apt install -y procps make gcc && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN conda config --add channels conda-forge && \
    conda config --add channels bioconda && \
    conda config --add channels default

RUN conda install -c bioconda virsorter=2

Run virsorter setup -d db -j 4
## virsorter version 2.1