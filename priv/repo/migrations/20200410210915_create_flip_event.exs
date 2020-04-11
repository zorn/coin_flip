defmodule CoinFlip.Repo.Migrations.CreateFlipEvent do
  use Ecto.Migration

  def change do
    create table(:flip_event) do
      add(:wagger, :string)
      add(:result, :integer)

      timestamps()
    end
  end
end
