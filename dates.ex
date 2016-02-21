defmodule Dates do
  def date_parts(string) do
    [_, year, month, date] = Regex.run ~r/([0-9]{4})-([0-9]{2})-([0-9]{2})/, string
    [{year, _}, {month, _}, {date, _}] = [Integer.parse(year), Integer.parse(month), Integer.parse(date)]
    [year, month, date]
  end

  def month_total(1, _, total) do
    total
  end

  def month_total(month, [head | tail], total) do
    month_total(month - 1, tail, total + head)
  end

  defp is_leap_year(year) do
    (rem(year,4) == 0 and rem(year,100) != 0)
    or (rem(year, 400) == 0)
  end

  def julian(string) do
    [year, month, date] = date_parts(string)
    days_per_month = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    if is_leap_year(year) and month >= 2, do: month_total(month, days_per_month, 0) + 1 + date, else: month_total(month, days_per_month, 0) + date
  end
end