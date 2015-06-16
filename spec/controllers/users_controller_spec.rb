require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  it 'should return the index view for the index method' do

    get :index

    expect(response).to render_template(:index)
  end

  it 'should create a new user' do

    get :new

    expect(assigns(:user)).to be_a_new(User)
  end

  it 'should return the new user view for the index method' do

    get :new

    expect(response).to have_http_status(200)
  end

  it 'should allow creation of a valid user and redirect to a the login view' do

    user_params = FactoryGirl.attributes_for(:valid_user)

    post :create, user: user_params

    expect(response).to redirect_to(:new_session)
  end

  it 'should not allow creation of an invalid user and redirect back to the new user view' do

    user_params = FactoryGirl.attributes_for(:insecure_password)

    post :create, user: user_params

    expect(response).to redirect_to(:new_user)
  end
end
