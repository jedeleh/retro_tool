defmodule RetroTool.Retrospective.RetroSession do
  use Ecto.Schema
  import Ecto.Changeset


  schema "retro_sessions" do
    field :name, :string
    has_many :messages, RetroTool.Retrospective.Message

    timestamps()
  end


  def changeset(retro_session, attrs) do
    retro_session
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
