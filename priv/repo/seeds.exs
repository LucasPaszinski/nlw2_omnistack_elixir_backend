# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Backend.Repo.insert!(%Backend.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Backend.Accounts.User
alias Backend.ClassInfo.Class
alias Backend.ClassInfo.Connection
alias Backend.ClassInfo.Schedule
alias Backend.Repo

user =
  %User{}
  |> User.changeset(%{
    name: "LucasPaszinski",
    avatar: "http://github.com/LucasPaszinski.png",
    whatsapp: 1_111_111_111,
    bio: "Hello World, Phoenix API"
  })
  |> Repo.insert!()

class =
  %Class{}
  |> Class.changeset(%{
    subject: "Teste",
    cost: 120
  })
  |> Ecto.Changeset.put_assoc(:user, user)
  |> Repo.insert!()

%Connection{}
|> Connection.changeset(%{})
|> Ecto.Changeset.put_assoc(:user, user)
|> Repo.insert!()

%Schedule{}
|> Schedule.changeset(%{
  from: 480,
  to: 540,
  week_day: 2
})
|> Ecto.Changeset.put_assoc(:class, class)
|> Repo.insert!()
