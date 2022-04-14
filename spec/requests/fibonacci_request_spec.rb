require 'rails_helper'

RSpec.describe FibonacciController, type: :request do
  describe '#show' do
    it 'returns a success response' do
      get '/fibonacci/10'
      expect(response).to have_http_status(:ok)
      expect(JSON.parse(response.body).deep_symbolize_keys).to eq({
        fibonacci_value: 55
      })
    end

    it 'returns a error response because of a negative integer' do
      get '/fibonacci/-10'
      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body).deep_symbolize_keys).to eq({
        message: 'Can\'t get fibonacci sequence from a negative integer or string'
      })
    end

    it 'returns a error response because of a no integer' do
      get '/fibonacci/integer'
      expect(response).to have_http_status(:unprocessable_entity)
      expect(JSON.parse(response.body).deep_symbolize_keys).to eq({
        message: 'Can\'t get fibonacci sequence from a negative integer or string'
      })
    end
  end
end
