class ArticlesController < ApplicationController
    # vas a necesitar esa autentificacion para todo excepto index y show
    http_basic_authenticate_with name: "dhh", password: "secret", except: [:index, :show]
    
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
    
    def edit
        @article = Article.find(params[:id])
    end
    
    def create
        @article = Article.new(article_params)
        
        if @article.save
            redirect_to @article
        else
            render 'new'
        end
    end
    
    def update
        @article = Article.find(params[:id])
        
        # The update method, is used when you want to update a record that already exists, and it accepts a hash containing the attributes that you want to update. As before, if there was an error updating the article we want to show the form back to the user.
        if @article.update(article_params)
            redirect_to @article
        else
            render 'edit'
        end
    end
    
    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        
        redirect_to articles_path
    end
    
    # para factorizar y usar esto en new/update
    # privado para que no sea llamado en cualquier contexto
    private
    def article_params
        params.require(:article).permit(:title, :text)
    end
end
