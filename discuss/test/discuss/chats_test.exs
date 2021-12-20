defmodule Discuss.ChatsTest do
  use Discuss.DataCase

  alias Discuss.Chats

  describe "rooms" do
    alias Discuss.Chats.Room

    import Discuss.ChatsFixtures

    @invalid_attrs %{url: nil}

    test "list_rooms/0 returns all rooms" do
      room = room_fixture()
      assert Chats.list_rooms() == [room]
    end

    test "get_room!/1 returns the room with given id" do
      room = room_fixture()
      assert Chats.get_room!(room.id) == room
    end

    test "create_room/1 with valid data creates a room" do
      valid_attrs = %{url: "some url"}

      assert {:ok, %Room{} = room} = Chats.create_room(valid_attrs)
      assert room.url == "some url"
    end

    test "create_room/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Chats.create_room(@invalid_attrs)
    end

    test "update_room/2 with valid data updates the room" do
      room = room_fixture()
      update_attrs = %{url: "some updated url"}

      assert {:ok, %Room{} = room} = Chats.update_room(room, update_attrs)
      assert room.url == "some updated url"
    end

    test "update_room/2 with invalid data returns error changeset" do
      room = room_fixture()
      assert {:error, %Ecto.Changeset{}} = Chats.update_room(room, @invalid_attrs)
      assert room == Chats.get_room!(room.id)
    end

    test "delete_room/1 deletes the room" do
      room = room_fixture()
      assert {:ok, %Room{}} = Chats.delete_room(room)
      assert_raise Ecto.NoResultsError, fn -> Chats.get_room!(room.id) end
    end

    test "change_room/1 returns a room changeset" do
      room = room_fixture()
      assert %Ecto.Changeset{} = Chats.change_room(room)
    end
  end
end
