
class LocalScmConfigHook < Redmine::Hook::Listener
  def helper_projects_settings_tabs(context)
    tabs = context[:tabs].clone
    newmenu = { :name => 'local_scm_config',
                :action => :manage_something,
                :partial => 'projects/settings/local_scm_config',
                :label => :label_local_scm_config}

    repent = tabs.select {|t| t[:name] == "repository" }
    idx = tabs.index(repent[0])

    context[:tabs].slice!(idx+1,tabs.length)
    context[:tabs].push(newmenu)
    context[:tabs].concat(tabs[idx+1, tabs.length-1])
  end
end

