defmodule Blog.Blog do
  use Ecto.Schema
  import Ecto.Changeset

  schema "blogs" do
    field :title, :string
    field :body, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(blog, attrs) do
    blog
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body])
  end
end
