defmodule ShortGhostWeb.FallbackController do
  use Phoenix.Controller

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:unprocessable_entity)
    |> put_view(json: ShortGhostWeb.ChangesetJSON)
    |> render(:error, changeset: changeset)
  end
end
