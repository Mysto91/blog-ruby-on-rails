require 'rails_helper'
require 'api/shared_examples'


RSpec.describe 'Articles', type: :request do
  describe 'POST /api/articles' do
    let(:uri) { '/api/articles' }
    let(:params) do
      {
        title: Faker::Sports::Football.team,
        body: Faker::Lorem.paragraph,
        status: 'public',
        author_id: @author.id
      }
    end

    before do
      @author = FactoryBot.create :author
    end

    it 'when params valid, article should be created' do
      post uri, params: { article: params }

      expect(response).to have_http_status :created
    end

    context 'when title is missing' do
      subject {
        {
          body: Faker::Lorem.paragraph,
          status: 'public',
          author_id: @author.id
        }
      }

      expected_body = {
        'title' => ["can't be blank"]
      }

      include_examples 'when bad params', expected_body
    end

    context 'when body is missing' do
      subject {
        {
          title: Faker::Sports::Football.team,
          status: 'public',
          author_id: @author.id
        }
      }

      expected_body = {
        'body' => [
          "can't be blank",
          'is too short (minimum is 10 characters)'
        ]
      }

      include_examples 'when bad params', expected_body
    end

    context 'when status is missing' do
      subject {
        {
          title: Faker::Sports::Football.team,
          body: Faker::Lorem.paragraph,
          author_id: @author.id
        }
      }

      expected_body = {
        'status' => [
          'is not included in the list'
        ]
      }

      include_examples 'when bad params', expected_body
    end

    context 'when status is invalid' do
      subject {
        {
          title: Faker::Sports::Football.team,
          body: Faker::Lorem.paragraph,
          author_id: @author.id,
          status: 'invalid status'
        }
      }

      expected_body = {
        'status' => [
          'is not included in the list'
        ]
      }

      include_examples 'when bad params', expected_body
    end

    context 'when body is too short' do
      subject {
        {
          title: Faker::Sports::Football.team,
          body: 'short',
          author_id: @author.id,
          status: 'archived'
        }
      }

      expected_body = {
        'body' => [
          'is too short (minimum is 10 characters)'
        ]
      }

      include_examples 'when bad params', expected_body
    end

    context 'when author does not exist' do
      subject {
        {
          title: Faker::Sports::Football.team,
          body: Faker::Lorem.paragraph,
          author_id: 9999,
          status: 'archived'
        }
      }

      expected_body = {
        'author' => [
          'must exist'
        ]
      }

      include_examples 'when bad params', expected_body
    end
  end
end
