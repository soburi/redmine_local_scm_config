require 'redmine'
require 'local_scm_config_hook'

Redmine::Plugin.register :redmine_local_scm_config do
  name 'Redmine Local Scm Config Editor plugin'
  author 'TOKITA Hiroshi'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'https://github.com/soburi/redmine_local_scm_config'
  author_url 'https://github.com/soburi/'
end
