module OmniAuthSteps
	step "I am signed in with provider :prov_name" do |prov_name|
	  OmniAuth.config.test_mode = true
	  OmniAuth.config.add_mock(prov_name, {
	  :uid => '12345',
	  info: {
	    name: "BlaBla",
	    email: "BlaBla@BlaBlaBla.com",
	    image: ""
	    }
	  })
	  visit "/auth/#{prov_name.downcase}"
	  OmniAuth.config.test_mode = false
	end

	step "I follow :link" do |link|
		OmniAuth.config.test_mode = true
	  OmniAuth.config.add_mock(:facebook, {
	  :uid => '12345',
	  info: {
	    name: "BlaBla",
	    email: "BlaBla@BlaBlaBla.com",
	    image: ""
	    }
	  })
		click_link(link)	  
		OmniAuth.config.test_mode = false
	end
end
	

RSpec.configure do |config|
  config.include OmniAuthSteps, :omniauth => true
end