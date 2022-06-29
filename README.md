# Sequence

A simple elixir server that increments the integer every time when client calls the server. Education-purpose project from the book _Programming Elixir_ by Dave Thomas.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `sequence` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:sequence, "~> 0.1.0"}
  ]
end
```

## Usage
```bash
$ iex -S mix

# Start link with server
iex(1)> Sequence.Server.start_link 100
{:ok, #PID<0.151.0>}

# increment number from 100 -> 101
iex(2)> Sequence.Server.next_number   
100

# increment number from 101 -> 102
iex(3)> Sequence.Server.next_number
101

# add number 50
iex(4)> Sequence.Server.increment_number 50
:ok

iex(5)> Sequence.Server.next_number        
152

iex(6)> Sequence.Server.next_number
153
```

## Debugging options
With `:trace` option,
```bash
iex(2)> GenServer.start_link(Sequence.Server, 100, [debug: [:trace]])
{:ok, #PID<0.186.0>}

iex(3)> GenServer.call(pid, :next_number)
*DBG* <0.186.0> got call next_number from <0.183.0>
*DBG* <0.186.0> sent 100 to <0.183.0>, new state 101
100     
```

With `:statistics` option
```elixir
iex(5)> {:ok, pid} = GenServer.start_link(Sequence.Server, 100, [debug: [:statistics]])
{:ok, #PID<0.190.0>}

iex(6)> GenServer.call(pid, :next_number)                                              
100     

iex(7)> GenServer.call(pid, :next_number)                                              
101     

iex(8)> :sys.statistics pid, :get
{:ok,   
 [
   start_time: {{2022, 6, 28}, {9, 40, 38}},
   current_time: {{2022, 6, 28}, {9, 41, 2}},
   reductions: 99,
   messages_in: 2,
   messages_out: 2
 ]}
```

