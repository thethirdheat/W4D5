require 'rails_helper'

RSpec.describe SessionsController, type: :controller do

  describe '#login' do

    it 'Login a user' do
      User.create(username: 'helloworl', password: 'password')
      post :create, params: { user: { username: "helloworl", password: "password" } }
      # expect(session[:session_token]).to eq(user.session_token) # do it later if have time
      expect(response).to redirect_to(goals_url)
      # expect(response.to_s).to include("session_token")
    end

    it 'With wrong param, it should redirect to login page again' do
      post :create, params: { user: { username: "helloworl", password: "123456" } }
      expect(response).to render_template("new")
    end

  end
end
