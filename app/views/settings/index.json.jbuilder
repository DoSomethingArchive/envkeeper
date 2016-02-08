json.array!(@settings) do |setting|
  json.extract! setting, :id, :name, :value
  json.url setting_url(setting, format: :json)
end
