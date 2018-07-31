defmodule RetroToolWeb.RetroSessionController do
  use RetroToolWeb, :controller

  alias RetroTool.Retrospective
  alias RetroTool.Retrospective.RetroSession

  def index(conn, _params) do
    retro_sessions = Retrospective.list_retro_sessions()
    render(conn, "index.html", retro_sessions: retro_sessions)
  end

  def new(conn, _params) do
    changeset = Retrospective.change_retro_session(%RetroSession{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"retro_session" => retro_session_params}) do
    case Retrospective.create_retro_session(retro_session_params) do
      {:ok, retro_session} ->
        conn
        |> put_flash(:info, "Retro session created successfully.")
        |> redirect(to: retro_session_path(conn, :show, retro_session))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    retro_session = Retrospective.get_retro_session!(id)
    render(conn, "show.html", retro_session: retro_session)
  end

  def edit(conn, %{"id" => id}) do
    retro_session = Retrospective.get_retro_session!(id)
    changeset = Retrospective.change_retro_session(retro_session)
    render(conn, "edit.html", retro_session: retro_session, changeset: changeset)
  end

  def update(conn, %{"id" => id, "retro_session" => retro_session_params}) do
    retro_session = Retrospective.get_retro_session!(id)

    case Retrospective.update_retro_session(retro_session, retro_session_params) do
      {:ok, retro_session} ->
        conn
        |> put_flash(:info, "Retro session updated successfully.")
        |> redirect(to: retro_session_path(conn, :show, retro_session))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", retro_session: retro_session, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    retro_session = Retrospective.get_retro_session!(id)
    {:ok, _retro_session} = Retrospective.delete_retro_session(retro_session)

    conn
    |> put_flash(:info, "Retro session deleted successfully.")
    |> redirect(to: retro_session_path(conn, :index))
  end
end
