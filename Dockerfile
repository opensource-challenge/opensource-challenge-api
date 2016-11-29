FROM elixir:1.3

EXPOSE 8080

RUN useradd -md /usr/src/app -u 1001 phoenix-app
USER 1001

RUN mix local.hex --force && \
    mix local.rebar --force

WORKDIR /usr/src/app
ENV MIX_ENV prod
ENV HOME /usr/src/app

COPY mix.* /usr/src/app/
# Guardian requires the config files to compile..
COPY config/* /usr/src/app/config/
RUN mix deps.get --only prod
RUN mix deps.compile --only prod

COPY . /usr/src/app/
RUN mix compile
RUN mix compile.protocols

CMD mix ecto.migrate && elixir -pa _build/prod/consolidated -S mix phoenix.server
