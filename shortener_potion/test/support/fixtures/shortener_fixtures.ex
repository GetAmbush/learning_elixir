defmodule ShortenerPotion.ShortenerFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ShortenerPotion.Shortener` context.
  """

  @doc """
  Generate a link.
  """
  def link_fixture(attrs \\ %{}) do
    {:ok, link} =
      attrs
      |> Enum.into(%{
        original_url: "some original_url",
        short_url: "some short_url",
        access_counter: 42
      })
      |> ShortenerPotion.Shortener.create_link()

    link
  end
end
