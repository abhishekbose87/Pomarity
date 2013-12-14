=begin
require 'spec_helper'
#require 'capybara/rspec'

describe "pages" do

subject { page }

	describe "home" do 

		it "should have the barChart graph" do
			visit root_path
			expect(page).to have_selector('div#barChart')
		end

		xit "barChart graph should be filled" do 
			visit root_path
			within('div#barChart') do 
				page.should have_content
			end
		end
	
	end
end
=end