require 'spec_helper'

describe UploadsController do

  before (:each) do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  describe "GET 'new'" do
    it "returns http success" do
      get :new
      response.should be_success
    end
  end

  describe "POST 'create'" do
    it "returns http success" do
      post 'create'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get :show
      response.should be_success
    end
  end

  it "should parse the file" do
    @file = Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/example.tab'), 'text/csv')
    post :create, :file_data => @file
    response.should be_success
  end

end
