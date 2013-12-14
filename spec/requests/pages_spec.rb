require 'spec_helper'
#require 'capybara/rspec'

describe "Pages" do
	
	describe "Home" do 

		it "should have the barChart" do 
			visit root_path
			expect(page).to have_selector('div#barChart')
		end

		it "barChart graph should be filled" do 
			visit root_path
			within('div#barChart') do 
				page.should have_content
			end
		end

	end
end