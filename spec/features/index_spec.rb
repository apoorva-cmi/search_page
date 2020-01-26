require 'rails_helper'
require 'kaminari'

RSpec.describe 'Index features' do
    it 'displays the title of the home page' do
        visit('/')
        expect(page).to have_content('Products')
    end

    it 'has products table' do
        visit('/')
        expect(page).to have_css('table#example')
    end

    it 'has rows for all products', js: true do
        visit('/')
        within("table#example") do
            expect(page).to have_css("tbody tr", :count => 10)
        end
    end

    it 'searches right values', js: true do
        visit('/')
        find(:css, "div#example_filter label input").set("Canada")
        within("table#example") do
            expect(page).to have_css("tbody tr", :count => 2)
        end
    end

    it 'searches for right records based on country', js: true do
        visit('/')
        find(:css, "#country").find(:option, "Canada").select_option
        within("table#example") do
            expect(page).to have_css("tbody tr", :count => 2)
            expect(page.first('tbody tr').text.include?('Canada')).to be_truthy
            expect(page.first('tbody tr').text.include?('United States')).to be_falsey
        end
    end

    it 'sorts the right way; Price: Low to High', js: true do
        visit('/')
        find(:css, "#sort").find(:option, "Price: Low to High").select_option
        within("table#example") do
            expect(page).to have_css("tbody tr", :count => 10)

            expect(page.first('tbody tr').text.include?('2.59')).to be_truthy
        end
    end

    it 'sorts the right way; Price: High to Low', js: true do
        visit('/')
        find(:css, "#sort").find(:option, "Price: High to Low").select_option
        within("table#example") do
            expect(page).to have_css("tbody tr", :count => 10)

            expect(page.first('tbody tr').text.include?('21.86')).to be_truthy
        end
    end

    it 'searches records with equal price', js: true do
        visit('/')
        find(:css, "#filter").find(:option, "Equal to").select_option
        find(:css, "#value").set('9.7')

        within("table#example") do
            expect(page).to have_css("tbody tr", :count => 1)

            expect(page.first('tbody tr').text.include?('9.7')).to be_truthy
        end
    end

    it 'searches records with price greater than value', js: true do
        visit('/')
        find(:css, "#filter").find(:option, "Greater than").select_option
        find(:css, "#value").set('15')

        within("table#example") do
            expect(page).to have_css("tbody tr", :count => 4)

            expect(page.first('tbody tr').text.include?('21.86')).to be_truthy
        end
    end

    it 'searches records with price less than value', js: true do
        visit('/')
        find(:css, "#filter").find(:option, "Less than").select_option
        find(:css, "#value").set('15')

        within("table#example") do
            expect(page).to have_css("tbody tr", :between => (1..26))

            expect(page.first('tbody tr').text.include?('9.7')).to be_truthy
        end
    end
end