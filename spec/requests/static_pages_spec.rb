require 'spec_helper'

describe "StaticPages" do
	

   let(:base_title) { "Ruby on Rails Tutorial Sample App" } 
   subject { page }

  describe "Home page" do
  	before {visit root_path}
  	
  	it { should have_content('Sample App') }
    it { should have_title(full_title('')) }
    it { should_not have_content('| Home') }
    
    end
  
  describe "Help page" do
    before {visit help_path}
    it { should have_content('help')}
    it { should have_title(full_title('Help'))} 	
  end

 
 describe "About page" do
  	it "should have the content 'about us'" do
  	visit about_path
  	expect(page).to have_content('About Us')
  end

   it "should have the right 'About'" do
        visit about_path
        expect(page).to have_title("#{base_title} | About")
    end
end

describe "Contact page" do 
	it "should except name and surname" do
		visit contact_path
        expect(page).to have_title("#{base_title} | Contact")
    end
  end
 
  describe "Contact page" do
  	it "should have the content 'contact'" do 
  		visit '/contact'
  		expect(page).to have_title('Contact')
    end
    it "should have the title 'contact'" do 
    	visit contact_path
    	expect(page).to have_title("#{base_title} | Contact")
    end
  	
  end

end
