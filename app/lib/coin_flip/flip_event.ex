defmodule CoinFlip.FlipEvent do
  use Ecto.Schema
  import Ecto.Changeset

  schema "flip_event" do
    field :wagger, :string
    field :result, :integer

    timestamps()
  end

  def changeset(flip_event, attrs) do
    required_fields = [:wagger, :result]
    optional_fields = []

    flip_event
    |> cast(attrs, required_fields ++ optional_fields)
    |> validate_required(required_fields)
  end
end
