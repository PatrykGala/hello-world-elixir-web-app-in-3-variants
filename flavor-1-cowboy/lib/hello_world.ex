defmodule HelloWorld do
  import Supervisor.Spec

  def start(_type, _args) do
    port = Application.get_env(:hello_world, :port)
    children = [
      worker(HelloWorld.Server, [port])
    ]
    opts = [strategy: :one_for_one, name: HelloWorld.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
