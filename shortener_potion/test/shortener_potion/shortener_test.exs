defmodule ShortenerPotion.ShortenerTest do
  use ShortenerPotion.DataCase

  alias ShortenerPotion.Shortener

  describe "links" do
    alias ShortenerPotion.Shortener.Link

    import ShortenerPotion.ShortenerFixtures

    @invalid_attrs %{original_url: nil, short_url: nil, access_counter: nil}

    test "list_links/0 returns all links" do
      link = link_fixture()
      assert Shortener.list_links() == [link]
    end

    test "get_link!/1 returns the link with given id" do
      link = link_fixture()
      assert Shortener.get_link!(link.id) == link
    end

    test "create_link/1 with valid data creates a link" do
      valid_attrs = %{original_url: "some original_url", short_url: "some short_url", access_counter: 42}

      assert {:ok, %Link{} = link} = Shortener.create_link(valid_attrs)
      assert link.original_url == "some original_url"
      assert link.short_url == "some short_url"
      assert link.access_counter == 42
    end

    test "create_link/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Shortener.create_link(@invalid_attrs)
    end

    test "update_link/2 with valid data updates the link" do
      link = link_fixture()
      update_attrs = %{original_url: "some updated original_url", short_url: "some updated short_url", access_counter: 43}

      assert {:ok, %Link{} = link} = Shortener.update_link(link, update_attrs)
      assert link.original_url == "some updated original_url"
      assert link.short_url == "some updated short_url"
      assert link.access_counter == 43
    end

    test "update_link/2 with invalid data returns error changeset" do
      link = link_fixture()
      assert {:error, %Ecto.Changeset{}} = Shortener.update_link(link, @invalid_attrs)
      assert link == Shortener.get_link!(link.id)
    end

    test "delete_link/1 deletes the link" do
      link = link_fixture()
      assert {:ok, %Link{}} = Shortener.delete_link(link)
      assert_raise Ecto.NoResultsError, fn -> Shortener.get_link!(link.id) end
    end

    test "change_link/1 returns a link changeset" do
      link = link_fixture()
      assert %Ecto.Changeset{} = Shortener.change_link(link)
    end
  end
end
