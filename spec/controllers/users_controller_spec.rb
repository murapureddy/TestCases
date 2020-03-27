require "rails_helper"

RSpec.describe UsersController, type: :controller do

	def valid_params
		return {
			first_name: "lll",
			email: "ll@gmail.com"
		}
	end

	def invalid_params
		return {
			first_name: "ll",
			email: "ddd"
		}
	end

context 'POST #create' do
 let!(:user) { FactoryBot.create :user }
 before { post(:create, params: { user: valid_params }) }
 it 'create a new product' do
  expect(flash[:notice]).to eq 'The user was sucessfully created'
 end
end

context "SHOW #method" do
let(:user){FactoryBot.create :user}
 before { get(:show, params: { id: user.to_param }) }
 it "display one user" do
 expect(response.status).to eq (200)
end
end

context "PUT #method" do
let(:user){FactoryBot.create :user}
 before { patch(:update, params: { user: valid_params,id: user.to_param })}
 it "edit one user" do
 expect(flash[:notice]).to eq 'The user was sucessfully updated'
end
end

context "Delete #method" do
	let(:user){FactoryBot.create :user}
	it "it will delete a user" do
	expect{ 
 delete :destroy, params: {id: user.to_param}}.to change(User, :count).by(0)
end
end
end