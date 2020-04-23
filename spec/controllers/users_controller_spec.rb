require "rails_helper"

RSpec.describe UsersController, type: :controller do

	def valid_params
		return {
			first_name: "lll",
			email: "ll@gmail.com",
			password: "123456789"
		}
	end

	def invalid_params
		return {
			first_name: "ll",
			email: "ddd"
		}
	end
context 'POST #create' do
let!(:user){FactoryBot.create :user}
 before { post(:create, params: { user: valid_params }) }
 it 'create a new user' do
  expect(flash[:notice]).to eq 'The user was sucessfully created'
 end
end

context 'GET #index' do
let!(:user){FactoryBot.create :user}
 before { get(:index) }
 it 'list of all users' do
  expect(assigns(:users)).to eq([user])
 end
end

context 'GET #index' do
let!(:user){FactoryBot.create :user }
 before { get(:index,params: {search:  user.first_name})}
 it 'search based on first_name' do
 expect(assigns(:users)).to eq([user])
  #expect().to render_template("index")
 end
end

context 'GET #index' do
let!(:user){FactoryBot.create :user }
 before { get(:index,params: {search:  user.email})}
 it 'search based on email' do
  expect(assigns(:users)).to eq([user])
 end
end

context "SHOW #method" do
let!(:user){FactoryBot.create :user}
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

let!(:user){post(:create, params: { user: valid_params }) }
context "get sign_in of the user" do 
#before { user_sign_in user }
before { post(:user_sign_in, params: { email: "ll@gmail.com",password: "12345"} )}
it "login the user" do
expect(response.status).to eq (204)
end
end

context "sign out of the user" do
let(:user){FactoryBot.create :user}
before { get(:logout)}
it "logout the user" do
expect(response.status).to eq (302)
end
end

context "Delete #method" do
	let(:user){FactoryBot.create :user}
	it "it will delete a user" do
	expect{ 
 delete :destroy, params: {id: user.to_param}}.to change(User, :count).by(-1)
end
end
end