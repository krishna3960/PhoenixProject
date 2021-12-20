defmodule Discuss.DiscussionsTest do
  use Discuss.DataCase

  alias Discuss.Discussions

  describe "topics" do
    alias Discuss.Discussions.TopicContext

    import Discuss.DiscussionsFixtures

    @invalid_attrs %{title: nil}

    test "list_topics/0 returns all topics" do
      topic_context = topic_context_fixture()
      assert Discussions.list_topics() == [topic_context]
    end

    test "get_topic_context!/1 returns the topic_context with given id" do
      topic_context = topic_context_fixture()
      assert Discussions.get_topic_context!(topic_context.id) == topic_context
    end

    test "create_topic_context/1 with valid data creates a topic_context" do
      valid_attrs = %{title: "some title"}

      assert {:ok, %TopicContext{} = topic_context} = Discussions.create_topic_context(valid_attrs)
      assert topic_context.title == "some title"
    end

    test "create_topic_context/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Discussions.create_topic_context(@invalid_attrs)
    end

    test "update_topic_context/2 with valid data updates the topic_context" do
      topic_context = topic_context_fixture()
      update_attrs = %{title: "some updated title"}

      assert {:ok, %TopicContext{} = topic_context} = Discussions.update_topic_context(topic_context, update_attrs)
      assert topic_context.title == "some updated title"
    end

    test "update_topic_context/2 with invalid data returns error changeset" do
      topic_context = topic_context_fixture()
      assert {:error, %Ecto.Changeset{}} = Discussions.update_topic_context(topic_context, @invalid_attrs)
      assert topic_context == Discussions.get_topic_context!(topic_context.id)
    end

    test "delete_topic_context/1 deletes the topic_context" do
      topic_context = topic_context_fixture()
      assert {:ok, %TopicContext{}} = Discussions.delete_topic_context(topic_context)
      assert_raise Ecto.NoResultsError, fn -> Discussions.get_topic_context!(topic_context.id) end
    end

    test "change_topic_context/1 returns a topic_context changeset" do
      topic_context = topic_context_fixture()
      assert %Ecto.Changeset{} = Discussions.change_topic_context(topic_context)
    end
  end

  describe "comments" do
    alias Discuss.Discussions.Comment

    import Discuss.DiscussionsFixtures

    @invalid_attrs %{content: nil}

    test "list_comments/0 returns all comments" do
      comment = comment_fixture()
      assert Discussions.list_comments() == [comment]
    end

    test "get_comment!/1 returns the comment with given id" do
      comment = comment_fixture()
      assert Discussions.get_comment!(comment.id) == comment
    end

    test "create_comment/1 with valid data creates a comment" do
      valid_attrs = %{content: "some content"}

      assert {:ok, %Comment{} = comment} = Discussions.create_comment(valid_attrs)
      assert comment.content == "some content"
    end

    test "create_comment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Discussions.create_comment(@invalid_attrs)
    end

    test "update_comment/2 with valid data updates the comment" do
      comment = comment_fixture()
      update_attrs = %{content: "some updated content"}

      assert {:ok, %Comment{} = comment} = Discussions.update_comment(comment, update_attrs)
      assert comment.content == "some updated content"
    end

    test "update_comment/2 with invalid data returns error changeset" do
      comment = comment_fixture()
      assert {:error, %Ecto.Changeset{}} = Discussions.update_comment(comment, @invalid_attrs)
      assert comment == Discussions.get_comment!(comment.id)
    end

    test "delete_comment/1 deletes the comment" do
      comment = comment_fixture()
      assert {:ok, %Comment{}} = Discussions.delete_comment(comment)
      assert_raise Ecto.NoResultsError, fn -> Discussions.get_comment!(comment.id) end
    end

    test "change_comment/1 returns a comment changeset" do
      comment = comment_fixture()
      assert %Ecto.Changeset{} = Discussions.change_comment(comment)
    end
  end
end
