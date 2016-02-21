defmodule College do
  def make_room_list(file_name) do
    {_, device} = File.open(file_name, [:read, :utf8])
    make_room_list(device, HashDict.new)
  end

  def make_room_list(device, hash) do
    make_room_list(device, hash, String.strip IO.read(device, :line))
  end

  def make_room_list(_, hash, :eof) do
    hash
  end

  def make_room_list(device, hash, line) do
    [_ | [course_name | [room_number]]] = String.split line, ","
    val = HashDict.get(hash, room_number)
    if val = nil do
      hash = HashDict.put_new(hash, String.strip(room_number), [course_name])
    else
      hash = HashDict.update(hash, String.strip(room_number), [course_name], fn(val) -> [course_name | val] end)
    end
    make_room_list(device, hash, IO.read(device, :line))
  end
end