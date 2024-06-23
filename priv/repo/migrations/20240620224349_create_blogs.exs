defmodule Blog.Repo.Migrations.CreateBlogs do
  use Ecto.Migration

  def change do
    create table(:blogs) do
      add :title, :string
      add :body, :text

      timestamps(type: :utc_datetime)
    end
  end
end
