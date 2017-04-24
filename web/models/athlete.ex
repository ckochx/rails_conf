defmodule RailsConf.Athlete do
  use RailsConf.Web, :model

  schema "athletes" do
    field :name, :string
    field :email, :string, required: true
    field :position, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :position, :email])
    |> validate_required([:name, :position, :email])
  end
end
