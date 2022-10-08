defmodule MinimalTodo do
  def start do
    # ask user for filename
    filename = IO.gets("Name of the file to load: ") |> String.trim()

    read(filename)
    |> parse
    |> get_command

    # ask user for command
    # read todos, add todos, delete todos, load file, save file
  end

  def get_command() do
  end

  def read(filename) do
    case File.read(filename) do
      {:ok, body} ->
        body

      {:error, reason} ->
        IO.puts(~s(Could not open file: "#{:file.format_error(reason)}"))
        start()
    end
  end

  def parse(body) do
    [header | items] = String.split(body, ~r{(\r\n|\r|\n)}, [])
    titles = String.split(header, ",")
    parse_lines(items, titles)
  end

  def parse_lines(lines, titles) do
    Enum.reduce(lines, %{}, fn line, map ->
      fields = String.split(line, ",")

      task = Enum.zip(titles, fields) |> Enum.into(%{})
      Map.merge(map, %{hd(fields) => task})
    end)
  end

  def show_todos(data, next? \\ true) do
    items = Map.keys(data)
    IO.puts("You have the following todos: \n")
    Enum.each(items, fn item -> IO.puts(item) end)
    IO.puts("\n")
  end
end
