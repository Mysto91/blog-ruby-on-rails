shared_examples 'when bad params' do |expected_body|
    it 'should return bad request' do
      post uri, params: { article: subject }

      expect(response).to have_http_status :bad_request
      expect(json).to eq expected_body
    end
end