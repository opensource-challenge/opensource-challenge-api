FROM elixir:1.5

EXPOSE 8080

RUN useradd -md /usr/src/app -u 1001 phoenix-app
RUN chown 1001:1001 /usr/src/app
USER 1001

RUN mix local.hex --force && \
    mix local.rebar --force

WORKDIR /usr/src/app
ENV MIX_ENV prod
ENV HOME /usr/src/app

COPY mix.* /usr/src/app/
# Guardian requires the config files to compile..
COPY config/* /usr/src/app/config/
RUN mix deps.get --only prod && \
    mix deps.compile --only prod

COPY . /usr/src/app/
RUN mix compile && \
    mix compile.protocols

USER root

RUN find /usr/src/app -type d -exec chmod 755 {} \; && \
    find /usr/src/app -type f -exec chmod 644 {} \;

USER 1001

CMD mix ecto.migrate && elixir -pa _build/prod/consolidated -S mix phoenix.server
