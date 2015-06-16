require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do

  it 'should return the login form for a new session' do

    get :new

    expect(response).to render_template(:new)
  end

  it 'should assign new user for the login form' do

    get :new

    expect(assigns(:user)).to be_a_new(User)
  end

  it 'should login user with the correct email and password' do

    user = FactoryGirl.create(:valid_user)
    user_params = FactoryGirl.attributes_for(:valid_user, execpt: :username)

    post :create, user: user_params

    expect(user.save).to redirect_to(:comments)
  end

  it 'should not login user with the wrong password' do

    user = FactoryGirl.create(:valid_user)
    user_params = FactoryGirl.attributes_for(:valid_user, password: 'a87654321', execpt: :username)

    post :create, user: user_params

    expect(assigns(user)).to be(nil)
    expect(response).to redirect_to(:new_session)
  end

  it 'should destroy the current session when the user logs out' do

    user = FactoryGirl.create(:valid_user)
    user_params = FactoryGirl.attributes_for(:valid_user, execpt: :username)

    post :create, user: user_params
    delete :destroy, user: user_params

    expect(assigns(user)).to be(nil)
    expect(response).to redirect_to(:new_session)
  end

end
