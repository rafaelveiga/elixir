defmodule Greeter do
  def greet() do
    user_input = String.trim(IO.gets("What is your name?\n"))

    case user_input do
      "Rafael"  -> "Nice Name!"
      _         -> "Hello #{user_input}!"
      end
  end
end
