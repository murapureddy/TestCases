require "rails_helper"

RSpec.describe PostsController, type: :controller do
    def post_params
		return {
			title: "lll",
			description: "ll"
		}
	end

	def invalid_params
		return {
			title: "ll",
			description: ""
		}
	end
	#https://jarlowrey.com/blog/polymorphic-rails-5
 context 'POST #create' do
 let(:user){FactoryBot.create :user}
 before { post(:create, params: { post: post_params,user_id: user}) }
 it 'create a new post' do
 expect(flash[:notice]).to eq 'The post was sucessfully created'
end
end

context 'POST #show' do
 let(:post){FactoryBot.create :post}
 before { get(:show, params: { id: post.to_param}) }
 it 'get a one post' do
 expect(response.status).to eq (200)
end
end 

context 'POST #edit' do
 let(:post){FactoryBot.create :post}
 before { put(:edit, params: { id: post.to_param}) }
 it 'edit a one post' do
 expect(response.status).to eq (200)
end

context 'POST #show' do
 let(:post){FactoryBot.create :post}
 before { patch(:update, params: { post: post_params,id: post.to_param}) }
 it 'update a one post' do
 expect(flash[:notice]).to eq 'The post was sucessfully updated'
end
end 

context 'POST #show' do
 let(:post){FactoryBot.create :post}
	it "it will delete a post" do
	expect{ 
 delete :destroy, params: {id: post.to_param}}.to change(Post, :count).by(-1)
end
end 
end 



end