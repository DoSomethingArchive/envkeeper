json.array!(@values) do |value|
  json.name value.setting.name
  json.value value.data
end
