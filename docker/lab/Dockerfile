FROM python:3.12-slim-bookworm

ENV USER app

WORKDIR /root

COPY ./build_root.sh /root

RUN bash ./build_root.sh

ENV HOME /home/${USER}
ENV RYE_HOME ${HOME}/.rye

COPY . $HOME
RUN chown -R ${USER}:${USER} $HOME

USER ${USER}

WORKDIR $HOME

RUN bash ./build.sh
SHELL ["bash", "-l", "-c"]
ENTRYPOINT [ "bash", "-l", "-c" ]
EXPOSE 8888
CMD ["bash -l run.sh"]
