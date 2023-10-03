defmodule ShortGhostWeb.UrlControllerTest do
  use ShortGhostWeb.ConnCase, async: true

  @create_attrs %{original_url: "https://github.com/GetAmbush"}

  describe "create url" do
    test "renders the created url when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/urls", @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)
      assert not is_nil(id)
    end

    test "returns an error when doesn't have valid arguments", %{conn: conn} do
      conn = post(conn, ~p"/api/urls", %{})
      assert %{"errors" => errors} = json_response(conn, 422)
      assert errors == %{"original_url" => ["can't be blank"]}
    end
  end
end
