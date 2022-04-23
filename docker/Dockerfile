FROM continuumio/anaconda3:latest

# 必要なパッケージを入れる.
RUN apt-get update && apt-get install -y --no-install-recommends \
    fonts-ipaexfont \
    ca-certificates \
    gnupg \
    apt-transport-https

# Debianの設定
RUN apt-get -y install locales && \
    localedef -f UTF-8 -i ja_JP ja_JP.UTF-8
ENV LANG ja_JP.UTF-8
ENV LANGUAGE ja_JP:ja
ENV LC_ALL ja_JP.UTF-8
ENV TZ JST-9
ENV TERM xterm

# condaでインストール
COPY docker/base.txt /tmp/base.txt
RUN conda update -n base -c defaults conda -y \
  && conda config --append channels conda-forge \
  && conda install -n base --file /tmp/base.txt -y \
  && conda clean -a -y \
  && rm /tmp/base.txt

# gooogle-cloud-sdkのインストール
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list \
  && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg add - \
  && apt-get update -y && apt-get install -y google-cloud-sdk google-cloud-sdk-app-engine-python \
  && apt-get autoremove -y \
  && apt-get clean

WORKDIR /work
COPY docker/init.sh /usr/bin
CMD ["/bin/bash", "/usr/bin/init.sh"]