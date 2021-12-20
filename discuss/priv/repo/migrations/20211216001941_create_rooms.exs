defmodule Discuss.Repo.Migrations.CreateRooms do
  use Ecto.Migration

  def change do
    create table(:rooms) do
      add :url, :string

      timestamps()
    end
  end
end
