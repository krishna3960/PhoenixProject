defmodule DiscussWeb.MyPageLive do
  use DiscussWeb, :live_view
  alias Discuss.Chats.Room
  require Logger

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, query: "", results: %{})}
  end

  @impl true
  def handle_event(("random-page"), _params, socket) do
    random_slug = MnemonicSlugs.generate_slug(4)
    random_url = "/" <> random_slug

    {:noreply, push_redirect(socket, to: random_url)}
  end





end
