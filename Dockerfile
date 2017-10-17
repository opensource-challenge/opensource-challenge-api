FROM elixir:1.5

EXPOSE 8080

RUN useradd -md /usr/src/app -u 1001 phoenix-app
RUN chown 1001:root /usr/src/app
USER 1001

WORKDIR /usr/src/app
ENV MIX_ENV prod
ENV HOME /usr/src/app

RUN mix local.hex --force && \
    mix local.rebar --force

COPY mix.* /usr/src/app/
# Guardian requires the config files to compile..
COPY config/* /usr/src/app/config/
RUN mix deps.get --only prod && \
    mix deps.compile --only prod

COPY . /usr/src/app/
RUN mix compile && \
    mix compile.protocols

USER root

RUN find /usr/src/app -type d -exec chmod 774 {} \; && \
    find /usr/src/app -type f -exec chmod 664 {} \;

USER 1001

CMD mix ecto.migrate && elixir -pa _build/prod/consolidated -S mix phoenix.server
