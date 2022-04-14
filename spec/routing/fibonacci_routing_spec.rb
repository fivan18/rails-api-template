require 'rails_helper'

RSpec.describe '/fibonacci routes' do
  it 'routes to fibonacci#show' do
    expect(get('/fibonacci/10')).to route_to('fibonacci#show', id: '10')
  end
end