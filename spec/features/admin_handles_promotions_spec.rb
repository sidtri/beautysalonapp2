require 'rails_helper'

feature 'Admin interacts with promotions' do

  scenario 'admin views promotions' do
    promotion = Promotion.create(title: "promotion1", description: "this is promotion 1")
    visit admin_promotions_path
    expect(page).to have_css 'td', text: promotion.title
  end

  scenario 'admin clicks promotion and views promotion details' do
    promotion = Promotion.create(title: "promotion1", tagline: "this is the tagline", description: "this is promotion 1")
    visit admin_promotions_path
    click_link promotion.title
    expect(page).to have_css 'h1', text: promotion.title
    expect(page).to have_css 'p', text: "this is the tagline"
    expect(page).to have_css 'p', text: promotion.description
  end
  
  scenario 'admin sees success message when adding a valid promotion' do
    visit admin_promotions_path
    
    find("input[@value='Actie Toevoegen']").click
    fill_in 'Titel', with: "some title"
    fill_in 'Tagline', with: "some tagline"
    fill_in 'Beschrijving', with: "some description"
    click_button 'Actie Toevoegen'

    expect(page).to have_css 'p', text: "Er werd een nieuwe actie toegevoegd"
  end

  scenario 'admin sees error message when adding promotion without title' do
    visit admin_promotions_path
    
    find("input[@value='Actie Toevoegen']").click
    fill_in 'Titel', with: ""
    fill_in 'Tagline', with: "some tagline"
    fill_in 'Beschrijving', with: "some description"
    click_button 'Actie Toevoegen'

    expect(page).to have_css 'p', text: "Title can't be blank"
  end

  scenario 'admin sees error message when adding promotion without description' do
    visit admin_promotions_path
    
    find("input[@value='Actie Toevoegen']").click
    fill_in 'Titel', with: "some title"
    fill_in 'Tagline', with: "some tagline"
    fill_in 'Beschrijving', with: ""
    click_button 'Actie Toevoegen'

    expect(page).to have_css 'p', text: "Description can't be blank"
  end
  
  scenario 'admin sees success message when editing a promotion' do
    promotion = Promotion.create(title: "promotion1", tagline: "this is the tagline", description: "this is promotion 1")
    visit admin_promotions_path
    find("a[href='/admin/promotions/#{promotion.id}/edit']").click
    find("input[@id='promotion_title']").set("new title")
    find("input[@id='promotion_tagline']").set("new tagline")
    find("textarea[@id='promotion_description']").set("new description")
    click_button "Actie Aanpassen"

    expect(page).to have_content "De actie werd aangepast"
  end
  
  scenario 'admin sees error message when editing invalid promotion' do
    promotion = Promotion.create(title: "promotion1", tagline: "this is the tagline", description: "this is promotion 1")
    visit admin_promotions_path

    find("a[href='/admin/promotions/#{promotion.id}/edit']").click
    find("input[@id='promotion_title']").set("")
    find("input[@id='promotion_tagline']").set("new tagline")
    find("textarea[@id='promotion_description']").set("new description")
    click_button "Actie Aanpassen"

    expect(page).to have_content "Title can't be blank"
  end

  scenario 'an admin deletes a course' do
    promotion = Promotion.create(title: "promotion1", tagline: "this is the tagline", description: "this is promotion 1")
    visit admin_promotions_path

    click_link 'Verwijderen'
    expect(page).to have_content, text: "De actie werd verwijderd"
    expect(page).not_to have_css 'p', text: "promotion1"
  end
end
