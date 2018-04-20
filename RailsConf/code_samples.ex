def show(conn, %{params: params}) do
  MyApp.SearchClient.search(params)
  user_access_id = user_for_email_access(params["assigned_to_id"])
  @emails = ...
end

defmodule MyApp.SearchClient do
  def search(params) do

    terms = Map.take(params, @search_term_whitelist)

    perform_search(params)
  end

  defp perform_search(terms) when terms == %{} do
    render_error(400)
  end
  defp perform_search(terms) do
    case MyApp.Search.search(@index, @index_type, terms) do
      {:ok, results} -> render_results(results)
      {:error, status} -> render_error(status)
    end
  end
end




defp user_for_email_access(nil) do
  case MyApp.Repo.get_by(MyApp.User, id: id) do
    nil -> nil
    user -> user
  end
end
defp user_for_email_access(id), do: id end






def show(conn, %{params: params}) do
  user_for_email_access(conn, params["assigned_to_id"])
end

...

defp user_for_email_access(conn, nil) do
  username = get_session(conn, :username)
  case MyApp.Repo.get_by(MyApp.User, username: username) do
    nil -> nil
    user -> user.id
  end
end
defp user_for_email_access(_conn, id), do: id end




require 'search/admin_client'
require 'search/admin_email_search_client'

class Admin::DashboardController < Admin::AdminApplicationController

  def show
    page = params[:page] ? params[:page].to_i : 1
    user_access_id = user_for_email_access

     @emails = AdminEmailSearchClient.new({ q: params[:q], worked: false, assigned_to_id: user_access_id, page: page }).search

    if (member_service? && params[:dash_type].nil?) || params[:dash_type] == "ms"
      @admin_email_summary_counter = AdminEmailSummaryCounter.new(user_email)
      render 'ms_show' and return
    else
      summary = RecruitingAssemblyLine.summary_for_rc_admin(get_user.id)
      @ral_presenter = RecruitingAssemblyLinePresenter.new(summary)
      @recent_client_actions = ClientAction.actions_for_user_id(get_user.id).limit(10)
      @recent_campaign_reports = CampaignReportPresenter.new(get_user.id).reports
      @unworked_emails = AdminEmailSummary.member_service_unworked_email_count
    end
  end

  private

  def user_for_email_access
    if params[:assigned_to_id].to_i == -1
      nil
    elsif params[:assigned_to_id] == nil
      UserAccess.find_by(username: session["username"]).id
    else
      params[:assigned_to_id].to_i
    end
  end
end
