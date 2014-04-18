require 'spec_helper'

describe "StaticPages" do
	

   let(:base_title) { "Ruby on Rails Tutorial Sample App" } 
   subject { page }
   
   shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading)}
    it { should have_title(full_title(page_title))}
   end


  #short hand tests
  describe "Home page" do
  	before {visit root_path}
  	
  	it { should have_content('Sample App') }
    it { should have_title(full_title('')) }
    it { should_not have_content('| Home') }
       
    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
        FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
        sign_in user
        visit root_path
      end

      it "should render the user's feed" do
        user.feed.each do |item|
          expect(page).to have_selector("li##{item.id}", text: item.content)
        end
      end
    end
 end
  
  #using shared example
  describe "Help page" do
      before {visit help_path}
      let(:heading) { 'Help' }
      let(:page_title) { 'Help' }

      it_should_behave_like "all static pages"
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
  	before { visit contact_path }
  	it { should have_selector('h1', text: 'Contact')}
  	it { should have_title(full_title('Contact'))}
  
  	
  end

  it "should have the right links on the layout" do
    visit root_path
    click_link "About"
    expect(page).to have_title(full_title('About'))
        click_link "Help"
    expect(page).to have_title(full_title('Help'))
        click_link "Contact"
    expect(page).to have_title(full_title('Contact'))
        click_link "Home"
         click_link "Sign up now!"
    expect(page).to have_title(full_title(''))
  end

end
