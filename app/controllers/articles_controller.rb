class ArticlesController < ApplicationController
    http_basic_authenticate_with name: "admin", password: "admin", except: [:index, :show, :getArticles, :getArticle]

    def index
        @articles = Article.all
    end

    def show
        @article = Article.find(params[:id])
    end

    def new
        @article = Article.new
    end
    
    def create
        @article = Article.new(article_params)

        if @article.save
            redirect_to @article
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])

        if @article.update(article_params)
            redirect_to @article
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @article = Article.find(params[:id])

        unless @article.comments.all.length > 0
            @article.destroy
            redirect_to root_path
        else
            flash.now[:alert] = 'Article cannot be deleted when comments are associated'
            render :show, status: :unprocessable_entity
        end
    end

    def getArticles
        render json: Article.all
    end

    def getArticle
        render json: Article.find(params[:id])
    end

    private
    def article_params
      params.require(:article).permit(:title, :body, :status)
    end
end
