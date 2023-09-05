defmodule ShortGhost.Links.UrlTest do
  use ShortGhost.DataCase, async: true
  alias ShortGhost.Links.Url

  describe "changeset/2" do
    test "validates data" do
      changeset =
        Url.changeset(%Url{}, %{original_url: "http://some_url", short_url: "short_url"})

      assert changeset.valid?
    end

    test "errors when original url has invalid format" do
      changeset =
        Url.changeset(%Url{}, %{original_url: "some_invalid_url", short_url: "short_url"})

      refute changeset.valid?
      assert errors_on(changeset) == %{original_url: ["has invalid format"]}
    end

    test "errors on invalid data" do
      changeset = Url.changeset(%Url{}, %{})

      refute changeset.valid?

      assert errors_on(changeset) == %{
               original_url: ["can't be blank"],
               short_url: ["can't be blank"]
             }
    end
  end
end
