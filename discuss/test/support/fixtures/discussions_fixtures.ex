defmodule Discuss.DiscussionsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Discuss.Discussions` context.
  """

  @doc """
  Generate a topic_context.
  """
  def topic_context_fixture(attrs \\ %{}) do
    {:ok, topic_context} =
      attrs
      |> Enum.into(%{
        title: "some title"
      })
      |> Discuss.Discussions.create_topic_context()

    topic_context
  end

  @doc """
  Generate a comment.
  """
  def comment_fixture(attrs \\ %{}) do
    {:ok, comment} =
      attrs
      |> Enum.into(%{
        content: "some content"
      })
      |> Discuss.Discussions.create_comment()

    comment
  end
end
