require 'rails_helper'

RSpec.describe ArticleController, type: :controller do

  describe '#result' do
    context 'when query is present' do
      let(:query) { 'example' }

      it 'calls search_params with downcased query' do
        expect(controller).to receive(:search_params).with(query.downcase)
        get :result, params: { query: query }
      end

      it 'returns articles with matching titles in JSON format' do
        article = create(:article, title: 'Example Article')
        get :result, params: { query: query }
        expect(response).to have_http_status(:success)
        expect(JSON.parse(response.body)['data']).to eq([article.title])
      end
    end
  end

  describe 'GET #result' do
    it 'returns http success' do
      get :result
      expect(response).to have_http_status(:success)
    end
  end

end
