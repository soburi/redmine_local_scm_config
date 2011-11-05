class LocalScmConfigController < ApplicationController
  unloadable
  before_filter :require_admin

  def load
    print "--------------------------------------- load ----------------------------------\n"
    p params
    p params[:id]
    p params[:fileselect]
    p params[:fileeditor]
    proj = Project.find(params[:id])
    p proj.repository
    p proj.repository.url

    filename = params[:fileselect]
    fn = proj.repository.url + "/" + filename
    begin
        file = File::open(fn, "r")
        text = file.read
    rescue => exp
      p exp
      text = ""
    ensure
        file.close unless file.nil?
    end

    render :text => text

    p text
    print "--------------------------------------- end load ----------------------------------\n"
  end

  def save
    print "--------------------------------------- save ----------------------------------\n"
    p "admin check"
    p User.current.admin?
    p params
    p params[:id]
    p params[:save]
    p params[:delete]
    p params[:fileselect]
    p params[:fileeditor]

    text = params[:fileeditor]
    filename = params[:fileselect]
    proj = Project.find(params[:id])
    p proj.repository
    p proj.repository.url

    fn = proj.repository.url + "/" + filename
    begin
        file = File::open(fn, "w")
        file.write(text)
    rescue => exp
      p exp
      text = ""
    ensure
        file.close unless file.nil?
    end

    render :text => text
    p text
    print "--------------------------------------- end ----------------------------------\n"
  end
    
  def delete
    print "--------------------------------------- delete ----------------------------------\n"
    p params
    p params[:id]
    p params[:save]
    p params[:delete]
    p params[:fileselect]
    p params[:fileeditor]

    text = params[:fileeditor]
    filename = params[:fileselect]
    proj = Project.find(params[:id])
    p proj.repository
    p proj.repository.url

    fn = proj.repository.url + "/" + filename
    begin
        File::delete(fn)
        render :text => ""
    rescue => exp
      p exp
    end

    print "--------------------------------------- end ----------------------------------\n"
  end

end
