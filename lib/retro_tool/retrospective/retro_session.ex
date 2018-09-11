defmodule RetroTool.Retrospective.RetroSession do
  use Ecto.Schema
  import Ecto.Changeset


  schema "retro_sessions" do
    field :name, :string
    has_many :messages, RetroTool.Retrospective.Message

    timestamps()
  end

  @doc false

end
