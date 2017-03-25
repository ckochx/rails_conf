defmodule RailsConf.AthleteTest do
  use RailsConf.ModelCase

  alias RailsConf.Athlete

  @valid_attrs %{name: "some content", position: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Athlete.changeset(%Athlete{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Athlete.changeset(%Athlete{}, @invalid_attrs)
    refute changeset.valid?
  end
end
