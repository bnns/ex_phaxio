defmodule ExPhaxio.Api do
  @moduledoc """
  The Api module provides path helper methods to all of Phaxio's endpoints.
  """
  def faxes_path, do: "/faxes/"

  def show_path(id), do: "/faxes/#{id}"

  def show_content_path(id, :large), do: "/faxes/#{id}/file?thumbnail=l"
  def show_content_path(id, :small), do: "/faxes/#{id}/file?thumbnail=s"
  def show_content_path(id, nil), do: "/faxes/#{id}/file"

  def cancel_path(id), do: "/faxes/#{id}/cancel"

  def resend_path(id, nil), do: "/faxes/#{id}/resend"
  def resend_path(id, cb_url) when is_binary(cb_url), do: "/faxes/#{id}/resend?callback_url=#{cb_url}"

  def countries_path, do: "/public/countries"

  def provision_path(country, area, nil), do: "/phone_numbers?country_code=#{country}&area_code=#{area}"
  def provision_path(country, area, cb_url), do: "/phone_numbers?country_code=#{country}&area_code=#{area}&callback_url=#{cb_url}"
  def provision_path, do: "/phone_numbers"

  def account_status_path, do: "/account/status"
end
