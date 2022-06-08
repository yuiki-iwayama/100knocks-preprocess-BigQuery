FROM jupyter/scipy-notebook:latest
USER root

RUN apt-get update && apt-get install -y --no-install-recommends \
    fonts-ipaexfont \
    ca-certificates \
    dirmngr \
    gnupg \
    apt-transport-https \
    curl

#Ubuntuの設定
ENV LANG ja_JP.UTF-8
ENV TZ Asia/Tokyo
RUN locale-gen $LANG && \
  echo "export LANG={$LANG}" >> ~/.bashrc && \
  ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# gooogle-cloud-sdkのインストール
RUN echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
  curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg  add - && \
  apt-get update -y && apt-get install -y google-cloud-sdk google-cloud-sdk-app-engine-python && \
  apt-get autoremove -y  && \
  apt-get clean && rm -rf /var/lib/apt/lists/*

USER jovyan
WORKDIR /home/jovyan
COPY docker/requirements.txt .
# pipでインストール
RUN pip install --upgrade pip && \
  pip install --no-cache-dir -r requirements.txt && \
  rm requirements.txt

COPY docker/init.sh /usr/bin
CMD ["/bin/bash", "/usr/bin/init.sh"]