#!/bin/sh
LD_LIBRARY_PATH=/opt/kalkancrypt:/opt/kalkancrypt/lib/engines
export LD_LIBRARY_PATH
ulimit -n 108192
#exec elixir --erl "-detached" --name pulsar_yergazy@127.0.0.1 --cookie office -S mix do compile, phx.server
exec iex --name pulsar_ruslan@127.0.0.1 --cookie office -S mix do compile, phx.server
