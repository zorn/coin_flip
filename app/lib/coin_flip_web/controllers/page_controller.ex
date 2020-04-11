defmodule CoinFlipWeb.PageController do
  use CoinFlipWeb, :controller

  alias CoinFlip.{FlipEvent, FlipRecorder}

  def index(conn, _params) do
    changeset = FlipEvent.changeset(%FlipEvent{}, %{})
    flip_events = FlipRecorder.list_flip_events()
    render(conn, "index.html", changeset: changeset, flip_events: flip_events)
  end

  def create(conn, %{"flip_event" => flip_event_params}) do
    case FlipRecorder.record_coin_flip(flip_event_params["wagger"]) do
      {:ok, _flip_event} ->
        conn
        |> put_flash(:info, "Coin Flip recorded!")
        |> redirect(to: Routes.page_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "index.html", changeset: changeset)
    end
  end
end
