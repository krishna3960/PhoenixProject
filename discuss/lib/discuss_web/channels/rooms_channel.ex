defmodule DiscussWeb.RoomsChannel do
  use DiscussWeb, :channel
  alias Discuss.Chats.Room
  alias Discuss.Repo

  @impl true
  def join("room:" <> room_id, _params, socket) do
    IO.puts("Joined Room channel")
    {:ok, assign(socket,%{changeset: Discuss.Chats.change_room(%Room{})})}
  end

  @impl true
  def handle_in(("random-page"), _params, socket) do
    random_slug = MnemonicSlugs.generate_slug(4)
    random_url = "/" <> random_slug
    #Discuss.Chats.create_room(%{random_slug})

    {:noreply, socket}
  end

  @impl true
  def handle_in("validate", %{"room" => rooms} = params, socket) do
    IO.inspect(socket)
    changeset = %Room{}
    |> Discuss.Chats.change_room(rooms)
    |> Map.put(:action, :insert)

    {:noreply, assign(socket, changeset: changeset)}
  end

  @impl true
  def handle_in("validate", %{"room" => %{"username" => username}} = params, socket) do

    {:noreply, assign(socket, :username, username)}
  end

  @impl true
  def handle_in("create", %{"room" => %{"title" => url}}, socket) do
    url = "/" <> socket.assigns.title
    {:noreply, socket}

  end


end
