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

Repo.delete_all(Activity)
Repo.delete_all(Resource)

for i <- 1..5 do
  hours = Random
  # from = Date.from({2015,01,01})# |> Date.shift(hours: hours)
  # from_string = from |> DateFormat.format({"ISO"})
  # IO.puts from_string
  Repo.insert!(
    %Resource{
      name: "res " <> Integer.to_string(i),
      description: "Res " <> Integer.to_string(i)
      # available_from: from,
      # available_to: from
    }
  )
end

for i <- 1..10 do
  Repo.insert!(
    %Activity{
      name: "act " <> Integer.to_string(i),
      description: "Act " <> Integer.to_string(i)
      # start_at:
      # end_at:
    }
  )
end
