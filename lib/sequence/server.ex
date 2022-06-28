defmodule Sequence.Server do
  # By using `use`, we can use the callbacks provided by GenServer
  # without explicitly declaring it. It's just like an inheritance.
  use GenServer

  # `init()` is a constructor of the behaviour
  def init(initial_number) do
    {:ok, initial_number}
  end

  # `handle_call()` will be called when client calls the server
  # Usage: `GenServer.call(pid, :next_number)`
  def handle_call(:next_number, _from, current_number) do
    {:reply, current_number, current_number + 1}
  end

  # should be called when `GenServer.cast()` is called
  def handle_cast({:increment_number, delta}, current_number) do
    {:no_reply, current_number + delta}
  end

  # This will format the `data` part of the `sys.get_status` result
  def format_status(_reason, [_pdict, state]) do
    [data: [{'State', "My current state is '#{inspect(state)}', and I'm happy"}]]
  end
end
