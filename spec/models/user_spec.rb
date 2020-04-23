require 'rails_helper'

RSpec.describe User, :type => :model do
	let(:user) { build(:user) }  # it will create instnce based on FactroyBot
  it "is valid with valid attributes" do
  	 expect(user).to be_valid
  end
  it "is not valid without a first_name" do 
    user.first_name=nil
    expect(user).to_not be_valid
  end
  it "is not valid without a email" do 
   user.email=nil
   expect(user).to_not be_valid
  end
  it "is not valid without a valid email format" do
  	user.email = "abbc.com"
  	expect(user).to_not be_valid
  end
  it "validates password length" do
    user.password="1234"
    expect(user).to_not be_valid
  end

  it "validates password length" do
    user.password="12345678"
    expect(user).to be_valid
  end

  describe "#notify_if_spam" do
    it "is called after new record is created" do
      ie = FactoryBot.create(:user)
      expect_any_instance_of(User).to receive(:send_welcome_email)
      #expect(ie).to receive(:send_welcome_email)
    end
end

  #Callback related Spec
#describe "this is the world" do
  #let(:user){build(:user)} #it will return user instance but is not saved

  #it "triggers do_something on save" do
  #user.to receive(:first_name_letter)
  #expect(user.first_name==user.first_name.upcase)
  #end
 #end

   #context "callbacks" do
    # http://guides.rubyonrails.org/active_record_callbacks.html
    # https://github.com/beatrichartz/shoulda-callback-matchers/wiki
    
    #let(:user) { create(:user) }

   # it { expect(user).to callback(:send_welcome_email).before(:save) }
  #end
    #it { expect(user).to callback(:send_welcome_email).before(:save) }

  #it "is it calling the callback" do 
  # expect(user).to receive(:send_welcome_email)
  #end
end