require "rails_helper"

RSpec.describe "dishes show page", type: :feature do
  it "can see all ingredients and chefs name" do
    remi = Chef.create!(name: "Remi")
    gordon = Chef.create!(name: "Gordon Ramsay")

    pasta = remi.dishes.create!(name: "Spaghetti", description: "Really good")
    tacos = gordon.dishes.create!(name: "Chicken Tacos", description: "Simple, clean, easy food")

    ingredient1 = Ingredient.create!(name: "Tomato", calories: 34)
    ingredient2 = Ingredient.create!(name: "Chicken", calories: 140)

    DishIngredient.create!(dish: pasta, ingredient: ingredient1)
    DishIngredient.create!(dish: tacos, ingredient: ingredient2)

    visit "/dishes/#{tacos.id}"
    save_and_open_page

    expect(page).to have_content(tacos.name)
    expect(page).to have_content(ingredient2.name)
    expect(page).to have_content(gordon.name)
  end
end

# Story 1 of 3
# As a visitor
# When I visit a dish's show page
# I see a list of ingredients for that dish
# and the chef's name
