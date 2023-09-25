require 'rails_helper'

RSpec.describe 'Articles', type: :request do
  describe 'POST /api/articles' do
    let(:uri) { '/api/articles' }
    let(:params) do
      {
        title: Faker::Sports::Football.team,
        body: Faker::Lorem.paragraph,
        status: 'public',
        author_id: 1
      }
    end

    before do
      @total_articles = 5
      @existing_article = FactoryBot.create :article
    end

    it 'when params valid, article should be created' do
      post uri, params: { article: params }

      expect(response).to have_http_status :created
    end

    it 'when title missing, should return bad request' do
      invalid_params = params.dup
      invalid_params.delete(:title)

      post uri, params: { article: invalid_params }

      expected_result = {
        'title' => ["can't be blank"]
      }

      expect(response).to have_http_status :bad_request
      expect(json).to eq expected_result
    end

    it 'when body missing, should return bad request' do
      invalid_params = params.dup
      invalid_params.delete(:body)

      post uri, params: { article: invalid_params }

      expected_result = {
        'body' => ["can't be blank", 'is too short (minimum is 10 characters)']
      }

      expect(response).to have_http_status :bad_request
      expect(json).to eq expected_result
    end
  end
end
