defmodule FileInspector do
  def ask() do
    action = IO.gets("What is your action? <words, characters, lines> ") |> String.trim()
    filename = IO.gets("What is the filename? ") |> String.trim()

    case action do
      "words"       -> counter(filename, ~r{(\\n|[^\w'])+})
      "characters"  -> counter(filename, "")
      "lines"       -> counter(filename, ~r{(\r\n|\n|\r)})
      _             -> "No action found"
    end
  end

  def counter(filename, regexPattern) do
    count =
      File.read!(filename)
      |> String.split(regexPattern)
      |> Enum.filter(fn x -> x != "" end)

    count |> Enum.count() |> IO.puts()
  end
end
