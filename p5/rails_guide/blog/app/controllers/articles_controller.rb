class ArticlesController < ApplicationController
    def index
        @articles = Article.all
    end
    
    def show
        @article = Article.find(params[:id])
    end
    
    def new
        # importantisimo para testear @article.errors.any? en la vista del new
        @article = Article.new
    end
    
    def create
        @article = Article.new(article_params)
        
        if @article.save
            redirect_to @article
        else
            render 'new'
        end
    end
    
    
    # para factorizar y usar esto en new/update
    # privado para que no sea llamado en cualquier contexto
    private
    def article_params
        params.require(:article).permit(:title, :text)
    end
end
