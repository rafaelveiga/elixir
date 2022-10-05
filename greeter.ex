defmodule Greeter do
  def greet() do
    user_input = IO.gets("What is your name?\n")

    case String.trim(user_input) do
      "Rafael"  -> "Nice Name!"
      _         -> "Hello #{String.trim(user_input)}!"
      end
  end
end
