class ArticlesController < ApplicationController
  before_action :validate_search_key, only: [:search]
  def index
    @articles = Article.all.paginate(:page => params[:page], :per_page => 5 )
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    hash = { article: @article, title_name: params[:article][:title] }
    Article.title_sort(hash)
    if @article.save
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def show
    @article = Article.find(params[:id])
    @article.article_count = @article.article_count + 1
    @article.save
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to article_path(@article), notice: "修改成功"
    else
      render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    redirect_to articles_path
  end

  def search
    if @query_string.present?
      search_result = Article.ransack(@search_criteria).result(:distinct => true)
      @articles = search_result.paginate(:page => params[:page], :per_page => 5)
    end
  end

  private

  def article_params
    params.require(:article).permit(:title, :text, :article_state)
  end

  def validate_search_key
    @query_string = params[:q].gsub(/\\|\'|\/|\?/, "") if params[:q].present?
    @search_criteria = search_criteria(@query_string)
  end

  def search_criteria(query_string)
    { title_or_text_cont: query_string }
  end
end
