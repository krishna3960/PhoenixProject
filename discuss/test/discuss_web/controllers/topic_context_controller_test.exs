defmodule DiscussWeb.TopicContextControllerTest do
  use DiscussWeb.ConnCase

  import Discuss.DiscussionsFixtures

  @create_attrs %{title: "some title"}
  @update_attrs %{title: "some updated title"}
  @invalid_attrs %{title: nil}

  describe "index" do
    test "lists all topics", %{conn: conn} do
      conn = get(conn, Routes.topic_context_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Topics"
    end
  end

  describe "new topic_context" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.topic_context_path(conn, :new))
      assert html_response(conn, 200) =~ "New Topic context"
    end
  end

  describe "create topic_context" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.topic_context_path(conn, :create), topic_context: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.topic_context_path(conn, :show, id)

      conn = get(conn, Routes.topic_context_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Topic context"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.topic_context_path(conn, :create), topic_context: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Topic context"
    end
  end

  describe "edit topic_context" do
    setup [:create_topic_context]

    test "renders form for editing chosen topic_context", %{conn: conn, topic_context: topic_context} do
      conn = get(conn, Routes.topic_context_path(conn, :edit, topic_context))
      assert html_response(conn, 200) =~ "Edit Topic context"
    end
  end

  describe "update topic_context" do
    setup [:create_topic_context]

    test "redirects when data is valid", %{conn: conn, topic_context: topic_context} do
      conn = put(conn, Routes.topic_context_path(conn, :update, topic_context), topic_context: @update_attrs)
      assert redirected_to(conn) == Routes.topic_context_path(conn, :show, topic_context)

      conn = get(conn, Routes.topic_context_path(conn, :show, topic_context))
      assert html_response(conn, 200) =~ "some updated title"
    end

    test "renders errors when data is invalid", %{conn: conn, topic_context: topic_context} do
      conn = put(conn, Routes.topic_context_path(conn, :update, topic_context), topic_context: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Topic context"
    end
  end

  describe "delete topic_context" do
    setup [:create_topic_context]

    test "deletes chosen topic_context", %{conn: conn, topic_context: topic_context} do
      conn = delete(conn, Routes.topic_context_path(conn, :delete, topic_context))
      assert redirected_to(conn) == Routes.topic_context_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.topic_context_path(conn, :show, topic_context))
      end
    end
  end

  defp create_topic_context(_) do
    topic_context = topic_context_fixture()
    %{topic_context: topic_context}
  end
end
