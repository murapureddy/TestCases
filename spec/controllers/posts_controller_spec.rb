require "rails_helper"

RSpec.describe PostsController, type: :controller do
def post_params
		return {
			title: "lll",
			description: "ll",
			user_id: "1"
		}
	end

	def invalid_params
		return {
			title: "ll",
			description: ""
		}
	end

describe UsersController do
	before { post(:create, params: { user: {first_name: "mango",email:"man@gmail.com",password: "12345"}}) }
	before { post(:user_sign_in, params: { email: "man@gmail.com",password: "12345"} )}
    it 'should return 99 if large' do
  	expect(response.status).to eq (302)
  end
end
#let!(:user){post(:create, params: { user:  {first_name: "mango",email:"man@gmail.com",password: "12345"}}) }
 context 'POST #create' do
 	let(:user){FactoryBot.create :post}
 before { post(:create, params: { post: post_params}) }
 it 'create a new post' do
 expect(flash[:notice]).to eq 'The post was sucessfully created'
 end
end
end