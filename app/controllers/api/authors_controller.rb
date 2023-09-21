class Api::AuthorsController < ApplicationController
    protect_from_forgery with: :null_session

    def index
        render json: Author.all
    end

    def show
        render json: Author.find(params[:id])
    end

    def create
        author = Author.create(author_params)

        if author.save
            render json: author
        else
            render json: author.errors, status: :bad_request
        end
    end

    private
    def author_params
        params.require(:author).permit(:full_name, :nationality)
    end
end