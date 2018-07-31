defmodule RetroTool.Repo.Migrations.CreateMessages do
  use Ecto.Migration

  def change do
    create table(:retro_sessions) do
      add :name, :string

      timestamps()
    end

    create table(:messages) do
      add :content, :string
      add :message_type, :string
      add :retro_session_id, references(:retro_sessions)

      timestamps()
    end

  end
end
