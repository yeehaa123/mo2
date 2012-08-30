step "I should see my articles" do
	@user.articles.each do |article|
		page.should have_content(article.title)
	end
end

step "I should see my article count" do
	page.should have_content(@user.articles.count)
end