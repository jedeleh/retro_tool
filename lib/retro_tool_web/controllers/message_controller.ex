defmodule RetroToolWeb.MessageController do
  use RetroToolWeb, :controller

  alias RetroTool.Retrospective
  alias RetroTool.Retrospective.Message

  def index(conn, _params) do
    messages = Retrospective.list_messages()
    render(conn, "index.html", messages: messages)
  end

  def new(conn, _params) do
    changeset = Retrospective.change_message(%Message{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"message" => message_params}) do
    case Retrospective.create_message(message_params) do
      {:ok, message} ->
        conn
        |> put_flash(:info, "Message created successfully.")
        |> redirect(to: message_path(conn, :show, message))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    message = Retrospective.get_message!(id)
    render(conn, "show.html", message: message)
  end

  def edit(conn, %{"id" => id}) do
    message = Retrospective.get_message!(id)
    changeset = Retrospective.change_message(message)
    render(conn, "edit.html", message: message, changeset: changeset)
  end

  def update(conn, %{"id" => id, "message" => message_params}) do
    message = Retrospective.get_message!(id)

    case Retrospective.update_message(message, message_params) do
      {:ok, message} ->
        conn
        |> put_flash(:info, "Message updated successfully.")
        |> redirect(to: message_path(conn, :show, message))
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", message: message, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    message = Retrospective.get_message!(id)
    {:ok, _message} = Retrospective.delete_message(message)

    conn
    |> put_flash(:info, "Message deleted successfully.")
    |> redirect(to: message_path(conn, :index))
  end
end
