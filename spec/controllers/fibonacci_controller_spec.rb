require 'rails_helper'

RSpec.describe FibonacciController do
  describe '#show' do
    subject { get :show, params: { id: 11 } }

    it 'should return success response' do
      subject
      expect(response).to have_http_status(:ok)
    end

    it 'should return proper json' do
      subject
      expect(JSON.parse(response.body).deep_symbolize_keys).to eq({
        fibonacci_value: 89
      })
    end
  end
end