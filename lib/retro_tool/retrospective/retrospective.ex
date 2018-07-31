defmodule RetroTool.Retrospective do
  @moduledoc """
  The Retrospective context.
  """

  import Ecto.Query, warn: false
  alias RetroTool.Repo

  alias RetroTool.Retrospective.Message

  @doc """
  Returns the list of messages.

  ## Examples

      iex> list_messages()
      [%Message{}, ...]

  """
  def list_messages(message_type, retro_session_id) do
    from(t in Messages,
         where: t.message_type == ^message_type,
         where: t.retro_session_id == ^retro_session_id
    )
    |> Repo.all
  end
  def list_messages do
    Repo.all(Message)
  end

  @doc """
  Gets a single message.

  Raises `Ecto.NoResultsError` if the Message does not exist.

  ## Examples

      iex> get_message!(123)
      %Message{}

      iex> get_message!(456)
      ** (Ecto.NoResultsError)

  """
  def get_message!(id), do: Repo.get!(Message, id)

  @doc """
  Creates a message.

  ## Examples

      iex> create_message(%{field: value})
      {:ok, %Message{}}

      iex> create_message(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_message(attrs \\ %{}) do
    %Message{}
    |> Message.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a message.

  ## Examples

      iex> update_message(message, %{field: new_value})
      {:ok, %Message{}}

      iex> update_message(message, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_message(%Message{} = message, attrs) do
    message
    |> Message.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Message.

  ## Examples

      iex> delete_message(message)
      {:ok, %Message{}}

      iex> delete_message(message)
      {:error, %Ecto.Changeset{}}

  """
  def delete_message(%Message{} = message) do
    Repo.delete(message)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking message changes.

  ## Examples

      iex> change_message(message)
      %Ecto.Changeset{source: %Message{}}

  """
  def change_message(%Message{} = message) do
    Message.changeset(message, %{})
  end

  alias RetroTool.Retrospective.RetroSession

  @doc """
  Returns the list of retro_sessions.

  ## Examples

      iex> list_retro_sessions()
      [%RetroSession{}, ...]

  """
  def list_retro_sessions do
    Repo.all(RetroSession)
  end

  @doc """
  Gets a single retro_session.

  Raises `Ecto.NoResultsError` if the Retro session does not exist.

  ## Examples

      iex> get_retro_session!(123)
      %RetroSession{}

      iex> get_retro_session!(456)
      ** (Ecto.NoResultsError)

  """
  def get_retro_session!(id), do: Repo.get!(RetroSession, id)

  @doc """
  Creates a retro_session.

  ## Examples

      iex> create_retro_session(%{field: value})
      {:ok, %RetroSession{}}

      iex> create_retro_session(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_retro_session(attrs \\ %{}) do
    %RetroSession{}
    |> RetroSession.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a retro_session.

  ## Examples

      iex> update_retro_session(retro_session, %{field: new_value})
      {:ok, %RetroSession{}}

      iex> update_retro_session(retro_session, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_retro_session(%RetroSession{} = retro_session, attrs) do
    retro_session
    |> RetroSession.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a RetroSession.

  ## Examples

      iex> delete_retro_session(retro_session)
      {:ok, %RetroSession{}}

      iex> delete_retro_session(retro_session)
      {:error, %Ecto.Changeset{}}

  """
  def delete_retro_session(%RetroSession{} = retro_session) do
    Repo.delete(retro_session)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking retro_session changes.

  ## Examples

      iex> change_retro_session(retro_session)
      %Ecto.Changeset{source: %RetroSession{}}

  """
  def change_retro_session(%RetroSession{} = retro_session) do
    RetroSession.changeset(retro_session, %{})
  end
end
