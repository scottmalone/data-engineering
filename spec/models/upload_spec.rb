require 'spec_helper'

describe Upload do
  before(:each) do
    upload = FactoryGirl.build(:upload)
    @attr = {
      :file_name => upload.file_name,
      :complete => upload.complete
    }
  end

  it "should create a new instance given a valid attribute" do
    Upload.create!(@attr)
  end

  it "should set the complete status to false if none is given" do
    @attr[:complete] = nil
    upload = Upload.create!(@attr)
    upload.complete.should be_false 
  end

  #it "should parse the file" do
  #  upload = Upload.new(@attr)
  #  upload.stub!(:file_path).and_return(file_fixture_path('example.tab'))
  #  upload.save!
  #  p "upload.file_name = #{upload.file_name}"
  #  expect {
  #    upload.parse_data
  #  }.to change { Upload.count }.by(1)
  #end

  #it "should parse the file" do
  #  @file = fixture_file_upload('example.tab', 'text/text')
  #  post :uploadLicense, :upload => @file
  #  response.should be_success
  #end

private

#def file_fixture(filename)
#  IO.read file_fixture_path(filename)
#end

def file_fixture_path(filename)
  File.expand_path(File.dirname(__FILE__) + "/../fixtures/Upload/#{ filename }")
end



end
