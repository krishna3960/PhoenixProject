defmodule Discuss.Discussions do
  @moduledoc """
  The Discussions context.
  """

  import Ecto.Query, warn: false
  import Ecto
  alias Discuss.Repo

  alias Discuss.Discussions.TopicContext

  @doc """
  Returns the list of topics.

  ## Examples

      iex> list_topics()
      [%TopicContext{}, ...]

  """
  def list_topics do
    Repo.all(TopicContext)
  end

  @doc """
  Gets a single topic_context.

  Raises `Ecto.NoResultsError` if the Topic context does not exist.

  ## Examples

      iex> get_topic_context!(123)
      %TopicContext{}

      iex> get_topic_context!(456)
      ** (Ecto.NoResultsError)

  """
  def get_topic_context!(id), do: Repo.get!(TopicContext, id)

  @doc """
  Creates a topic_context.

  ## Examples

      iex> create_topic_context(%{field: value})
      {:ok, %TopicContext{}}

      iex> create_topic_context(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_topic_context(conn, attrs \\ %{}) do
   # %TopicContext{}
     # |> TopicContext.changeset(attrs)
     # |> Repo.insert()
    changeset = conn.assigns.user
      |> build_assoc(:topics)
      |> TopicContext.changeset(attrs)
      |> Repo.insert()

  end

  @doc """
  Updates a topic_context.

  ## Examples

      iex> update_topic_context(topic_context, %{field: new_value})
      {:ok, %TopicContext{}}

      iex> update_topic_context(topic_context, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_topic_context(%TopicContext{} = topic_context, attrs) do
    topic_context
    |> TopicContext.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a topic_context.

  ## Examples

      iex> delete_topic_context(topic_context)
      {:ok, %TopicContext{}}

      iex> delete_topic_context(topic_context)
      {:error, %Ecto.Changeset{}}

  """
  def delete_topic_context(%TopicContext{} = topic_context) do
    Repo.delete(topic_context)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking topic_context changes.

  ## Examples

      iex> change_topic_context(topic_context)
      %Ecto.Changeset{data: %TopicContext{}}

  """
  def change_topic_context(%TopicContext{} = topic_context, attrs \\ %{}) do
    TopicContext.changeset(topic_context, attrs)
  end

  alias Discuss.Discussions.Comment

  @doc """
  Returns the list of comments.

  ## Examples

      iex> list_comments()
      [%Comment{}, ...]

  """
  def list_comments do
    Repo.all(Comment)
  end

  @doc """
  Gets a single comment.

  Raises `Ecto.NoResultsError` if the Comment does not exist.

  ## Examples

      iex> get_comment!(123)
      %Comment{}

      iex> get_comment!(456)
      ** (Ecto.NoResultsError)

  """
  def get_comment!(id), do: Repo.get!(Comment, id)

  @doc """
  Creates a comment.

  ## Examples

      iex> create_comment(%{field: value})
      {:ok, %Comment{}}

      iex> create_comment(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_comment(attrs \\ %{}) do
    %Comment{}
    |> Comment.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a comment.

  ## Examples

      iex> update_comment(comment, %{field: new_value})
      {:ok, %Comment{}}

      iex> update_comment(comment, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_comment(%Comment{} = comment, attrs) do
    comment
    |> Comment.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a comment.

  ## Examples

      iex> delete_comment(comment)
      {:ok, %Comment{}}

      iex> delete_comment(comment)
      {:error, %Ecto.Changeset{}}

  """
  def delete_comment(%Comment{} = comment) do
    Repo.delete(comment)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking comment changes.

  ## Examples

      iex> change_comment(comment)
      %Ecto.Changeset{data: %Comment{}}

  """
  def change_comment(%Comment{} = comment, attrs \\ %{}) do
    Comment.changeset(comment, attrs)
  end
end
