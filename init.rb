require 'redmine'
require 'local_scm_config_hook'

Redmine::Plugin.register :redmine_local_scm_config do
  name 'Redmine Local Scm Config Editor plugin'
  author 'Author name'
  description 'This is a plugin for Redmine'
  version '0.0.1'
  url 'http://example.com/path/to/plugin'
  author_url 'http://example.com/about'
end
