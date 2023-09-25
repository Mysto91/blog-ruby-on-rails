require 'rails_helper'

RSpec.describe 'Articles', type: :request do
    describe 'GET /api/articles' do
      before do
        @total_articles = 5
        FactoryBot.create_list :article, 5
        get '/api/articles'
      end

      it 'get all articles' do
        expect(json.size).to eq @total_articles
        expect(response).to have_http_status :success
      end
    end
end
