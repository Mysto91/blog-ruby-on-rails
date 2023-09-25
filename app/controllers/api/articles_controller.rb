class Api::ArticlesController < Api::ApiController
    def index
        render json: Article.all
    end

    def show
        render json: Article.find(params[:id])
    end

     #TO DO : Pouvoir ajouter un auteur qui n'existe pas
    def create
        article = Article.create(article_params)

        if article.save
            render json: article, status: :created
        else
            render json: article.errors, status: :bad_request
        end
    end

    private
    def article_params
        params.require(:article).permit(:title, :body, :author_id, :status)
    end
end