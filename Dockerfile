FROM nvidia/cuda:11.7.0-devel-ubuntu22.04

WORKDIR /app
ADD . /app

RUN set -xe \
    && apt-get update -y \
    && apt-get install -y python3-pip git wget libgl1 libglib2.0-0
RUN pip install -r requirements.txt
RUN jupyter serverextension enable --py jupyter_http_over_ws

CMD ["/bin/bash", "launch.sh"]
