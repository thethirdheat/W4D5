require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'Get #new' do
    it 'Retrieve user sign up page' do
      get :new, new_user_url
      
      expect(response).to render_template('new')
      expect(response).to have_http_status(200)
    end
  end

  describe 'Post #create' do
    it 'Creates user and saves to dabatabase' do 
      post :create, users_url

      expect(response).to redirect_to(goals_url)
      expect(response).to have_http_status(302)
    end
  end
  

end
