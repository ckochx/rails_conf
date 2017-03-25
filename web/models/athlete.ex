defmodule RailsConf.Athlete do
  use RailsConf.Web, :model

  schema "athletes" do
    field :name, :string
    field :position, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :position])
    |> validate_required([:name, :position])
  end
end
