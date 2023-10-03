defmodule ShortGhost.Links.UrlTest do
  use ShortGhost.DataCase, async: true
  alias ShortGhost.Links.Url

  describe "changeset/2" do
    test "validates data" do
      changeset =
        Url.create_changeset(%Url{}, %{original_url: "http://some_url", short_url: "short_url"})

      assert changeset.valid?
    end

    test "errors when original url has invalid format" do
      changeset =
        Url.create_changeset(%Url{}, %{original_url: "some_invalid_url", short_url: "short_url"})

      refute changeset.valid?
      assert errors_on(changeset) == %{original_url: ["has invalid format"]}
    end

    test "errors on invalid data" do
      changeset = Url.create_changeset(%Url{}, %{})

      refute changeset.valid?

      assert errors_on(changeset) == %{original_url: ["can't be blank"]}
    end
  end

  describe "short_url/0" do
    test "generates a url of len 6" do
      assert String.length(Url.generate_short_url()) == 6
    end

    test "only generates characters that we expect" do
      expected_chars =
        String.graphemes("0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ")

      Url.generate_short_url()
      |> String.graphemes()
      |> Enum.each(fn char -> assert char in expected_chars end)
    end
  end
end
