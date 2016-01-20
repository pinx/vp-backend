# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Backend.Repo.insert!(%SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Backend.Activity
alias Backend.Resource
alias Backend.Repo

use Timex

defmodule Rand do
  def getRandomHours(min, max) do
    min + Random.random(max - min)
  end
  def getRandomDate do
    hours = Random.random(100)
    dt = Date.from({2015,01,01})
      |> Date.shift(hours: hours)
    dt
  end
end

Repo.delete_all(Activity)
Repo.delete_all(Resource)

for i <- 1..5 do
  from_dt = Date.from({2015,01,01})
    |> Date.shift(hours: Rand.getRandomHours(0, 10))
  to_dt = from_dt
    |> Date.shift(hours: Rand.getRandomHours(10,16))
  # from_dt = Date.from({2015,01,01})
  #   |> Date.shift(hours: hours)
  #   |> DateFormat.format("{ISO}")
  # dt |> IO.puts
  #Date.from({2015,01,01}) |> Date.shift(hours: hours) |> IO.puts
  # from = Date.from({2015,01,01})# |> Date.shift(hours: hours)
  # from_string = from |> DateFormat.format({"ISO"})
  # IO.puts from_string
  Repo.insert!(
    %Resource{
      name: "res " <> Integer.to_string(i),
      description: "Res " <> Integer.to_string(i),
      available_from: from_dt |> DateConvert.to_erlang_datetime |> Ecto.DateTime.from_erl,
      available_to: to_dt |> DateConvert.to_erlang_datetime |> Ecto.DateTime.from_erl
    }
  )
end

for i <- 1..2000 do
  from_dt = Date.from({2015,01,01})
    |> Date.shift(hours: Rand.getRandomHours(0, 10))
  to_dt = from_dt
    |> Date.shift(hours: Rand.getRandomHours(2,8))
  Repo.insert!(
    %Activity{
      name: "act " <> Integer.to_string(i),
      description: "Act " <> Integer.to_string(i),
      start_at: from_dt |> DateConvert.to_erlang_datetime |> Ecto.DateTime.from_erl,
      end_at: to_dt |> DateConvert.to_erlang_datetime |> Ecto.DateTime.from_erl
    }
  )
end
