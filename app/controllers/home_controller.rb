class HomeController < ApplicationController
  layout "home"
  
  def index
    @Noticias = Notice.all(:conditions => ['published = 1'], :order => "created_at ASC", :limit => 7)
  end
end
