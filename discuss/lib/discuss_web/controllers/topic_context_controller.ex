defmodule DiscussWeb.TopicContextController do
  use DiscussWeb, :controller

  alias Discuss.Discussions
  alias Discuss.Discussions.TopicContext
  alias Discuss.Repo

  plug DiscussWeb.Controllers.Plugs.RequireAuth when action in [:create, :new, :edit, :update, :delete]
  plug :check_topic_owner when action in [:update, :edit, :delete]

  def index(conn, _params) do

    topics = Discussions.list_topics()
    render(conn, "index.html", topics: topics)
  end

  def new(conn, _params) do
    changeset = Discussions.change_topic_context(%TopicContext{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"topic_context" => topic_context_params}) do
    case Discussions.create_topic_context(conn, topic_context_params) do
      {:ok, topic_context} ->
        conn
        |> put_flash(:info, "Topic created successfully.")
        |> redirect(to: Routes.topic_context_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    topic_context = Discussions.get_topic_context!(id)
    render(conn, "show.html", topic_context: topic_context)
  end

  def edit(conn, %{"id" => id}) do
    topic_context = Discussions.get_topic_context!(id)
    changeset = Discussions.change_topic_context(topic_context)
    render(conn, "edit.html", topic_context: topic_context, changeset: changeset)
  end

  def update(conn, %{"id" => id, "topic_context" => topic_context_params}) do
    topic_context = Discussions.get_topic_context!(id)

    case Discussions.update_topic_context(topic_context, topic_context_params) do
      {:ok, topic_context} ->
        conn
        |> put_flash(:info, "Topic updated successfully.")
        |> redirect(to: Routes.topic_context_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", topic_context: topic_context, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    topic_context = Discussions.get_topic_context!(id)
    {:ok, _topic_context} = Discussions.delete_topic_context(topic_context)

    conn
    |> put_flash(:info, "Topic deleted successfully.")
    |> redirect(to: Routes.topic_context_path(conn, :index))
  end


  def check_topic_owner(conn, _params) do
   %{params: %{"id" => topic_id}} = conn
   if Repo.get(TopicContext, topic_id).user_id == conn.assigns.user.id do
     conn
   else
    conn
      |> put_flash(:error, "You cannot modify that")
      |> redirect(to: Routes.topic_context_path(conn, :index))
      |> halt()
   end
    end

end
