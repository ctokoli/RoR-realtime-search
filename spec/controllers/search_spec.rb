# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SearchController, type: :controller do
  describe '#index' do
    it 'fetches data by IP group and renders JSON response' do
      allow(Search).to receive(:fetch_data_by_ip_group).and_return([{ id: 1, name: 'Example Data' }])
      get :index
      expect(response).to have_http_status(:success)

      json_response = JSON.parse(response.body)
      expect(json_response).to have_key('data')

      data = json_response['data']
      expect(data).to be_an(Array)
      expect(data.length).to eq(1)
    end
  end
end
