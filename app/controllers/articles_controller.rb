class ArticlesController < ApplicationController

    def index
    @articles = Article.order(created_at: :desc).all
    end

    def new
    @article = Article.new
    end

    def show
    @article = Article.where(id: params[:id]).first
    end


    def create
        @article = Article.new(article_params)
        if @article.save
            redirect_to articles_path
        else
            #render the form again
        end
    end

    def edit
        @article = Article.where(id: params[:id]).first
    end

    def update
        @article = Article.where(id: params[:id]).first
        if @article.update(article_params)
            redirect_to articles_path
        else
            #render the form again
        end
    end

    def destroy
        @article = Article.find_by(id: params[:id])

  if @article
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
    end
  else
    respond_to do |format|
      format.html { redirect_to articles_url, alert: 'Article not found.' }
    end
  end
end

    private
    def article_params
        params.require(:article).permit(:title, :body)
    end
end
