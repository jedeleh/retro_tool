# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     RetroTool.Repo.insert!(%RetroTool.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias RetroTool.Retrospective.RetroSession, as: Retro
alias RetroTool.Retrospective.Message
alias RetroTool.Repo

{:ok, retro_record} = Retro.changeset(
  %Retro{},
  %{
    name: "First Session"
  }
)
|> Repo.insert()


Enum.each((1..10), fn(n) ->
  message_type = rem(n, 3)
  |> case do
    0 -> "Smiley"
    1 -> "Confused"
    2 -> "Frowney"
  end

  Message.changeset(
    %Message{},
    %{
      content: "#{n} content",
      message_type: message_type
    }
  )
  |> Repo.insert!()
end)


