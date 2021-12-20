defmodule Discuss.ChatsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Discuss.Chats` context.
  """

  @doc """
  Generate a room.
  """
  def room_fixture(attrs \\ %{}) do
    {:ok, room} =
      attrs
      |> Enum.into(%{
        url: "some url"
      })
      |> Discuss.Chats.create_room()

    room
  end
end
