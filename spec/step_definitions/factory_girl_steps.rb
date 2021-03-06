step "I am a signed in user" do
  @user = FactoryGirl.create(:user)
  cookies[:remember_token] = @user.remember_token
end

step "a(n) identity exists" do
  @identity = FactoryGirl.create(:identity)
end

step "I am a user" do
  @user = FactoryGirl.create(:user)
end

step "there is another user" do
  @user2 = FactoryGirl.create(:user, user_name: "otheruser", email: "otheruser@example.org")
end

step ":count users exist" do |count|
	FactoryGirl.create_list(:user, count.to_i)
end

step "I have :count articles" do |count|
	FactoryGirl.create_list(:article, count.to_i, user: @user)
end

step "there are :count articles" do |count|
	FactoryGirl.create_list(:article, count.to_i)
end

# FactoryGirl.factories.each do |factory|
#   factory.compile
#   factory.human_names.each do |human_name|
#     step "the following #{human_name} exists:" do |table|
#       table.hashes.each do |human_hash|
#         attributes = convert_human_hash_to_attribute_hash(human_hash, factory.associations)
#         @user = FactoryGirl.create(factory.name, attributes)
#       end
#     end

#     step "the following #{human_name.pluralize} exist:" do |table|
#       table.hashes.each do |human_hash|
#         attributes = convert_human_hash_to_attribute_hash(human_hash, factory.associations)
#         @users =FactoryGirl.create(factory.name, attributes)
#       end
#     end


#     step "a(n) user exists" do
#       @user = FactoryGirl.create(:user)
#     end

#     step "a(n) admin exists" do
#       @user = FactoryGirl.create(:admin)
#     end

#     # step "I am a signed in user" do
#     #   @user = FactoryGirl.create(:user)
#     #   cookies[:remember_token] = @user.remember_token
#     #   visit edit_user_path(@user)
#     # end







#     if factory.build_class.respond_to?(:columns)
#       factory.build_class.columns.each do |column|
#         name = column.respond_to?(:name) ? column.name : column.to_s
#         human_column_name = name.downcase.gsub('_', ' ')
#         step "a(n) #{human_name} exists with a(n) #{human_column_name} of :value" do |value|
#           @user = FactoryGirl.create(factory.name, name => value)
#         end

#         step ":count #{human_name.pluralize} exist with a(n) #{human_column_name} of :value" do |count, value|
#           @users = FactoryGirl.create_list(factory.name, count.to_i, name => value)
#         end
#       end
#     end
#   end
# end