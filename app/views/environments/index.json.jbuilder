json.array!(@environments) do |environment|
  json.extract! environment, :id
  json.url project_environment_url(@project, environment, format: :json)
end
