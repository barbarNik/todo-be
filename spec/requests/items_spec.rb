require 'rails_helper'

RSpec.describe 'Items API', type: :request do
  # initialize test data
  let!(:user) {create(:user)}
  let!(:items) {create_list(:item, 10, user: user)}
  let(:item_id) {items.first.id}
  let(:headers) {valid_headers}

  # Test suite for GET /items
  describe 'GET /api/items' do
    before {get '/api/items', params: {}, headers: headers}

    it 'returns items' do
      expect(JSON.parse(response.body)).not_to be_empty
      expect(JSON.parse(response.body)['items'].size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /items/:id
  describe 'GET /api/items/:id' do
    before {get "/api/items/#{item_id}", params: {}, headers: headers}

    context 'when the record exists' do
      it 'returns the item' do
        expect(JSON.parse(response.body)).not_to be_empty
        expect(JSON.parse(response.body)['item']['id']).to eq(item_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:item_id) {100}

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(JSON(response.body)['message']).to match(/Couldn't find Item with 'id'=100/)
      end
    end
  end

  # Test suite for POST /items
  describe 'POST /items' do
    # valid payload
    let(:valid_attributes) do
      # send json payload
      {text: 'Learn Elm', user_id: user.id.to_s}.to_json
    end

    context 'when the request is valid' do
      before {post '/api/items', params: valid_attributes, headers: headers}

      it 'creates a item' do
        expect(JSON.parse(response.body)['item']['text']).to eq('Learn Elm')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      let(:valid_attributes) {{text: nil}.to_json}
      before {post '/api/items', params: valid_attributes, headers: headers}

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(JSON.parse(response.body)['message'])
            .to match(/Validation failed: Text can't be blank/)
      end
    end
  end

  # Test suite for PUT /items/:id
  describe 'PUT /api/items/:id' do
    let(:valid_attributes) {{title: 'Shopping'}.to_json}

    context 'when the record exists' do
      before {put "/api/items/#{item_id}", params: valid_attributes, headers: headers}

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /items/:id
  describe 'DELETE /api/items/:id' do
    before {delete "/api/items/#{item_id}", params: {}, headers: headers}

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end