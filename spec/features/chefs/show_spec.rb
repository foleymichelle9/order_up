require "rails_helper"

RSpec.describe "chefs show page", type: :feature do
  it "can see chefs name and link to all ingredients" do
    remi = Chef.create!(name: "Remi")
    gordon = Chef.create!(name: "Gordon Ramsay")

    pasta = remi.dishes.create!(name: "Spaghetti", description: "Really good")
    tacos = gordon.dishes.create!(name: "Chicken Tacos", description: "Simple, clean, easy food")

    ingredient1 = Ingredient.create!(name: "Tomato", calories: 34)
    ingredient2 = Ingredient.create!(name: "Chicken", calories: 140)
    ingredient3 = Ingredient.create!(name: "Taco Shells", calories: 50)

    visit "/chefs/#{gordon.id}"

    expect(page).to have_content(gordon.name)
    expect(page).to have_link("Ingredients")
  end
end



# Story 3 of 3
# As a visitor
# When I visit a chef's show page
# I see the name of that chef
# And I see a link to view a list of all ingredients that this chef uses in their dishes
# When I click on that link
# I'm taken to a chef's ingredient index page
# and I can see a unique list of names of all the ingredients that this chef uses
#
