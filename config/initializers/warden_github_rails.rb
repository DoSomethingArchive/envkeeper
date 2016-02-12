Warden::GitHub::Rails.setup do |config|
  config.add_scope :admin, scope: 'read:org'
  config.default_scope = :admin
end
