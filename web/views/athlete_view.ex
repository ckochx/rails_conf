defmodule RailsConf.AthleteView do
  use RailsConf.Web, :view

  def title do
    "RailsConf -- ViewTitle"
  end

  def errors(changeset) do
    render "errors.html", changeset
  end
end
