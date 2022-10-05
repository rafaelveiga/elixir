defmodule ToDo do
  def start do
    {}
  end

  def add_task(item, list) do
    {tuple_size(list), Tuple.append(list, item)}
  end

  def mark_task_as_complete(index, list) do
    Tuple.delete_at(list, index)
  end
end

list = ToDo.start()
{firstTask, list} = ToDo.add_task("first task", list)
{secondTask, list} = ToDo.add_task("second task", list);
{thirdTask, list} = ToDo.add_task("third task", list);

list = ToDo.mark_task_as_complete(secondTask, list)

IO.inspect(list)
