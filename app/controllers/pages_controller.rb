class PagesController < ApplicationController
  def index
    @pages = Article.all.paginate(:page => params[:page], :per_page => 5 )
  end
end
