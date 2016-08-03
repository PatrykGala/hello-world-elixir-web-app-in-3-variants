defmodule HelloWorld.Server do
  def start_link(port) do
    routes = [
      {"/[:name]", HelloWorld.Handler, []}
    ]

    dispatch = :cowboy_router.compile([{:_, routes}])

    opts = [port: port]
    env = [dispatch: dispatch]

    :cowboy.start_http(:http, 100, opts, [env: env])
  end
end
