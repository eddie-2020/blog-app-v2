require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'Get /index' do
    before :each do
      get '/users/3/posts'
    end

    it 'responds to the correct http status' do
      expect(response.status).to eq(200)
    end

    it 'renders the correct template' do
      expect(response).to render_template(:index)
    end

    it 'responds to the correct placeholder text' do
      expect(response.body).to include('All Posts')
    end
  end

  describe 'Get /show' do
    before :each do
      get '/users/1/posts/1'
    end

    it 'responds to the correct http status' do
      expect(response.status).to eq(200)
    end

    it 'renders the correct template' do
      expect(response).to render_template(:show)
    end

    it 'responds to the correct placeholder text' do
      expect(response.body).to include('Here is a list of posts for a given user')
    end
  end
end
