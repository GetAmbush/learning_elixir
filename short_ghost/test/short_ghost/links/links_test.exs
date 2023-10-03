defmodule ShortGhost.LinksTest do
  use ShortGhost.DataCase, async: true

  alias Ecto.Changeset
  alias ShortGhost.Links
  alias ShortGhost.Links.Url

  @create_args %{original_url: "https://github.com/GetAmbush"}

  describe "create_url/1" do
    test "creates a url" do
      assert {:ok, %Url{} = url} = Links.create_url(@create_args)
      assert url.original_url == @create_args.original_url
    end

    test "creates a url with string params" do
      assert {:ok, %Url{} = url} =
               Links.create_url(%{"original_url" => "https://github.com/GetAmbush"})

      assert url.original_url == @create_args.original_url
    end

    test "creates a url fails when we have the same original url multiple times" do
      repeated_original_url = "https://github.com/GetAmbush/learning_elixir"
      create_args = %{original_url: repeated_original_url}

      short_url_provider = fn -> "abc123" end
      assert {:ok, %Url{}} = Links.create_url(create_args, short_url_provider)

      assert {:error, %Changeset{} = changeset} =
               Links.create_url(create_args, short_url_provider)

      refute changeset.valid?
      assert errors_on(changeset) == %{short_url: ["has already been taken"]}
    end

    test "fails when creating a url" do
      assert {:error, %Changeset{} = changeset} = Links.create_url(%{})
      refute changeset.valid?
    end
  end

  describe "fetch_url/1" do
    test "fetches an existing url from the database" do
      {:ok, created_url} = Links.create_url(@create_args)
      assert {:ok, fetch_url = %Url{}} = Links.fetch_url(created_url.short_url)
      assert fetch_url.id == created_url.id
    end

    test "errors when url doesn't exist" do
      assert {:error, :url_does_not_exist} == Links.fetch_url("some_short_url")
    end
  end
end
