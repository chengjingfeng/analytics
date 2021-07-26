defmodule Plausible.ClickhouseEvent do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  schema "events" do
    field :name, :string
    field :domain, :string
    field :hostname, :string
    field :pathname, :string
    field :user_id, :integer
    field :session_id, :integer
    field :timestamp, :naive_datetime

    field :referrer, :string, default: ""
    field :referrer_source, :string, default: ""
    field :utm_medium, :string, default: ""
    field :utm_source, :string, default: ""
    field :utm_campaign, :string, default: ""

    field :country_code, :string, default: ""
    field :continent_geoname_id, :string, default: ""
    field :country_geoname_id, :string, default: ""
    field :subdivision1_geoname_id, :string, default: ""
    field :subdivision2_geoname_id, :string, default: ""
    field :city_geoname_id, :string, default: ""

    field :screen_size, :string, default: ""
    field :operating_system, :string, default: ""
    field :operating_system_version, :string, default: ""
    field :browser, :string, default: ""
    field :browser_version, :string, default: ""

    field :"meta.key", {:array, :string}, default: []
    field :"meta.value", {:array, :string}, default: []
  end

  def new(attrs) do
    %__MODULE__{}
    |> cast(
      attrs,
      [
        :name,
        :domain,
        :hostname,
        :pathname,
        :user_id,
        :timestamp,
        :operating_system,
        :operating_system_version,
        :browser,
        :browser_version,
        :referrer,
        :referrer_source,
        :utm_medium,
        :utm_source,
        :utm_campaign,
        :country_code,
        :continent_geoname_id,
        :country_geoname_id,
        :subdivision1_geoname_id,
        :subdivision2_geoname_id,
        :city_geoname_id,
        :screen_size,
        :"meta.key",
        :"meta.value"
      ],
      empty_values: [nil, ""]
    )
    |> validate_required([:name, :domain, :hostname, :pathname, :user_id, :timestamp])
  end
end
