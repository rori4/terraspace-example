# Docs: https://terraspace.cloud/docs/config/reference/
Terraspace.configure do |config|
  config.logger.level = :info
  config.auto_create = false # set to false to completely disable auto creation
  config.clean_cache = false # set to false as caching folder was breaking 2nd deployment (Might be M1 issue again)
end
