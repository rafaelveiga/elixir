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

  def get_command(data) do
    command =
      IO.gets(
        "What is your command? (R)ead todos, (A)dd a todo, (D)elete a todo, (L)oad a .csv, (S)ave a .csv\n"
      )
      |> String.trim()
      |> String.downcase()

    case command do
      "r" -> show_todos(data)
      "d" -> delete_todo(data)
      "q" -> "Quit"
      _ -> get_command(data)
    end
  end

  def delete_todo(data) do
    todo_do_delete = IO.gets("Which todo would you like to delete? \n") |> String.trim()

    if Map.has_key?(data, todo_do_delete) do
      new_data = Map.drop(data, [todo_do_delete])
      IO.puts(~s("Todo "#{todo_do_delete}" has been deleted."))
      get_command(new_data)
    else
      IO.puts("Todo not found\n")
      show_todos(data, false)
      delete_todo(data)
    end
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

    if next? do
      get_command(data)
    end
  end
end
