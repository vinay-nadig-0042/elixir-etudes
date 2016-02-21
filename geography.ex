defmodule Geography do
  def make_geo_list(file_name) do
    {_, device} = File.open(file_name, [:read, :utf8])
    make_geo_list_helper(device)
  end

  def make_geo_list_helper(device) do
    make_geo_list_helper(device, [], IO.read(device, :line))
  end

  def make_geo_list_helper(_, acc, :eof) do
    acc
  end

  def make_geo_list_helper(device, acc, line) do
    line = String.strip line
    if length(String.split(line, ",")) == 4 do
      [country_name, language] = String.split(line, ",")
      country = %Country{name: country_name, language: language}
      acc = [country | acc]
    else
      [city_name, pop, lat, lang] = String.split(line, ",")
      city = %City{name: city_name, pop: pop, lat: lat, lang: lang}
      acc = [city | acc]
    end
    make_geo_list_helper(device, acc, IO.read(device, :line))
  end
end