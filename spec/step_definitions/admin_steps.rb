step "I should be able to delete another user" do
	page.should have_link('delete', href: user_path(User.first))
	step "delete should destroy a user"
end

step "I should not be able to delete myself" do
	page.should_not have_link('delete', href: user_path(@user))
end