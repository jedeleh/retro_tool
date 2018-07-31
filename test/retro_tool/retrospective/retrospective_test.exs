defmodule RetroTool.RetrospectiveTest do
  use RetroTool.DataCase

  alias RetroTool.Retrospective

  describe "messages" do
    alias RetroTool.Retrospective.Message

    @valid_attrs %{content: "some content", message_type: "some message_type"}
    @update_attrs %{content: "some updated content", message_type: "some updated message_type"}
    @invalid_attrs %{content: nil, message_type: nil}

    def message_fixture(attrs \\ %{}) do
      {:ok, message} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Retrospective.create_message()

      message
    end

    test "list_messages/0 returns all messages" do
      message = message_fixture()
      assert Retrospective.list_messages() == [message]
    end

    test "get_message!/1 returns the message with given id" do
      message = message_fixture()
      assert Retrospective.get_message!(message.id) == message
    end

    test "create_message/1 with valid data creates a message" do
      assert {:ok, %Message{} = message} = Retrospective.create_message(@valid_attrs)
      assert message.content == "some content"
      assert message.message_type == "some message_type"
    end

    test "create_message/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Retrospective.create_message(@invalid_attrs)
    end

    test "update_message/2 with valid data updates the message" do
      message = message_fixture()
      assert {:ok, message} = Retrospective.update_message(message, @update_attrs)
      assert %Message{} = message
      assert message.content == "some updated content"
      assert message.message_type == "some updated message_type"
    end

    test "update_message/2 with invalid data returns error changeset" do
      message = message_fixture()
      assert {:error, %Ecto.Changeset{}} = Retrospective.update_message(message, @invalid_attrs)
      assert message == Retrospective.get_message!(message.id)
    end

    test "delete_message/1 deletes the message" do
      message = message_fixture()
      assert {:ok, %Message{}} = Retrospective.delete_message(message)
      assert_raise Ecto.NoResultsError, fn -> Retrospective.get_message!(message.id) end
    end

    test "change_message/1 returns a message changeset" do
      message = message_fixture()
      assert %Ecto.Changeset{} = Retrospective.change_message(message)
    end
  end

  describe "retro_sessions" do
    alias RetroTool.Retrospective.RetroSession

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def retro_session_fixture(attrs \\ %{}) do
      {:ok, retro_session} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Retrospective.create_retro_session()

      retro_session
    end

    test "list_retro_sessions/0 returns all retro_sessions" do
      retro_session = retro_session_fixture()
      assert Retrospective.list_retro_sessions() == [retro_session]
    end

    test "get_retro_session!/1 returns the retro_session with given id" do
      retro_session = retro_session_fixture()
      assert Retrospective.get_retro_session!(retro_session.id) == retro_session
    end

    test "create_retro_session/1 with valid data creates a retro_session" do
      assert {:ok, %RetroSession{} = retro_session} = Retrospective.create_retro_session(@valid_attrs)
      assert retro_session.name == "some name"
    end

    test "create_retro_session/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Retrospective.create_retro_session(@invalid_attrs)
    end

    test "update_retro_session/2 with valid data updates the retro_session" do
      retro_session = retro_session_fixture()
      assert {:ok, retro_session} = Retrospective.update_retro_session(retro_session, @update_attrs)
      assert %RetroSession{} = retro_session
      assert retro_session.name == "some updated name"
    end

    test "update_retro_session/2 with invalid data returns error changeset" do
      retro_session = retro_session_fixture()
      assert {:error, %Ecto.Changeset{}} = Retrospective.update_retro_session(retro_session, @invalid_attrs)
      assert retro_session == Retrospective.get_retro_session!(retro_session.id)
    end

    test "delete_retro_session/1 deletes the retro_session" do
      retro_session = retro_session_fixture()
      assert {:ok, %RetroSession{}} = Retrospective.delete_retro_session(retro_session)
      assert_raise Ecto.NoResultsError, fn -> Retrospective.get_retro_session!(retro_session.id) end
    end

    test "change_retro_session/1 returns a retro_session changeset" do
      retro_session = retro_session_fixture()
      assert %Ecto.Changeset{} = Retrospective.change_retro_session(retro_session)
    end
  end
end
