defmodule Discuss.Discussions.TopicContext do
  use Ecto.Schema
  import Ecto.Changeset

  schema "topics" do
    field :title, :string
    belongs_to :user, Discuss.Accounts.User
    has_many :comments, Discuss.Discussions.Comment , on_delete: :delete_all

    timestamps()
  end

  @doc false
  def changeset(topic_context, attrs) do
    topic_context
    |> cast(attrs, [:title])
    |> validate_required([:title])
  end
end
