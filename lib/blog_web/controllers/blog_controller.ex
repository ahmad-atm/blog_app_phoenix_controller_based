defmodule BlogWeb.BlogController do
	use BlogWeb, :controller
	alias Blog.{Blog, Repo}

	def blogs(conn, _params) do
		blogs = Repo.all(Blog)
		render(conn, :blogs, blogs: blogs)
	end

	def blog(conn, %{"id" => id}) do
		blog = Repo.get(Blog, id)
		render(conn, :blog, blog: blog)
	end


	def create_blog(conn, _params)do
		form = Blog.changeset(%Blog{}, %{})
		render(conn, :create_blog, form: form)
	end

	def save_blog(conn, %{"blog"=> blog}) do
		Repo.insert(%Blog{title: blog["title"], body: blog["body"]})
		redirect(conn, to: "/blogs")
	end

	def update_blog(conn, %{"id" => id})do
		blog = Repo.get(Blog, id)
		changeset = Blog.changeset(%Blog{}, %{})
		render(conn, :update_blog, changeset: changeset, blog: blog)
	end

	def save_updated_blog(conn, %{"blog" => blog}) do
		r_blog = Repo.get(Blog, blog["id"])
		changeset = Blog.changeset(r_blog, blog)
		Repo.update(changeset)
		redirect(conn, to: "/blogs")
	end

	def delete_blog(conn, %{"id" => id})do
		blog = Repo.get(Blog, id)
		Repo.delete(blog)
		redirect(conn, to: "/blogs")
	end
end