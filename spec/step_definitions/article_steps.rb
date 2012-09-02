step "I should see my articles" do
	@user.articles.each do |article|
		page.should have_content(article.title)
	end
end

step "I should see my article count" do
	page.should have_content(@user.articles.count)
end

step "I should see all article titles" do
	Article.all.each do |article|
		page.should have_content(article.title)
	end
end

step "I cannot create an article" do
	expect { click_button "Post" }.not_to change(Article, :count)
	page.should have_content('error')
end

step "I can create an article" do
	expect { click_button "Post" }.to change(Article, :count).by(1)
	page.should have_content('Article created')
end