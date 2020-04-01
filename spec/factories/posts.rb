FactoryBot.define do
  factory :post do
    title { "hello" }
    description { "hhh" }
    user_id {@user.id}
  end

   before :each do
    @user = User.create(first_name: "hello",email: "hello@gmail.com",password: "12345")
    post.user_id=@user.id
  end
end
