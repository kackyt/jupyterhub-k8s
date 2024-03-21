FROM python:3.12-slim-bookworm

ENV USER app

RUN apt-get update && \
    apt-get install -y --no-install-recommends curl nodejs npm && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -m -s /bin/bash -u 1000 app

ENV HOME /home/${USER}
ENV RYE_HOME ${HOME}/.rye

COPY . $HOME
RUN chown -R ${USER}:${USER} $HOME

USER ${USER}

WORKDIR $HOME

RUN bash ./build.sh
ENTRYPOINT [ "bash", "-c" ]
EXPOSE 8888
CMD ["./run.sh"]
