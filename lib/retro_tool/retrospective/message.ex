defmodule RetroTool.Retrospective.Message do
  use Ecto.Schema
  import Ecto.Changeset


  schema "messages" do
    field :content, :string
    field :message_type, :string
    belongs_to :retro_session, RetroTool.Retrospective.RetroSession

    timestamps()
  end

  @doc false
  def changeset(message, attrs) do
    message
    |> cast(attrs, [:content, :message_type])
    |> validate_required([:content, :message_type])
  end
end
