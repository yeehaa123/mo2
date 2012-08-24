step "sign up should create a user" do
  expect { click_button "Sign up" }.to change(User, :count)
end

step "sign up should not create a user" do
  expect { click_button "Sign up" }.not_to change(User, :count)
end

step "delete should destroy a user" do
	expect { click_link('delete') }.to change(User, :count).by(-1)
end

step "my user_name should be updated in the database to :new_value" do |new_value|
  @user.reload.user_name.should == new_value
end

step "my email should be updated in the database to :new_value" do |new_value|
  @user.reload.email.should == new_value
end