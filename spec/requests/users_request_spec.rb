require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'Get /index' do
    before :each do
      get '/users'
    end

    it 'should respond to the correct http status' do
      expect(response.status).to eq(200)
    end

    it 'should render the correct template' do
      expect(response).to render_template(:index)
    end

    it 'should respond to the correct placeholder text' do
      expect(response.body).to include('Welcome to my Blog App')
    end
  end

  describe 'Get /show' do
    before :each do
      get '/users/1'
    end

    it 'should respond to the correct http status' do
      expect(response.status).to eq(200)
    end

    it 'should render the correct template' do
      expect(response).to render_template(:show)
    end

    it 'should respond to the correct placeholder text' do
      expect(response.body).to include('Users Profile')
    end
  end
end
