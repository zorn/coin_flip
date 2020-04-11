defmodule CoinFlip.FlipRecorder do
  alias CoinFlip.{FlipEvent, Repo}

  def record_coin_flip(wagger) do
    attrs = %{"result" => Enum.random(0..1), "wagger" => wagger}

    FlipEvent.changeset(%FlipEvent{}, attrs)
    |> Repo.insert()
  end

  def list_flip_events() do
    Repo.all(FlipEvent)
  end
end
