class PagesController < ApplicationController
  def index
    @pages = Article.where("article_state = '公开' " ).paginate(:page => params[:page], :per_page => 5 )
  end

  def new
    @sorts = Sort.all
  end

  def show
    @sort = Sort.find(params[:id])
    @articles = @sort.articles
  end
end
