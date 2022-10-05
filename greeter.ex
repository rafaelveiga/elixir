defmodule Greeter do
  def greet() do
    user_input = IO.gets("What is your name?\n") |> String.trim()

    case user_input do
      "Rafael"  -> "Nice Name!"
      _         -> "Hello #{user_input}!"
      end
  end
end
