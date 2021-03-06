require 'rails_helper'

feature 'Admin interacts with promotions' do
  let!(:promotion) { create(:promotion) }
  before do
    visit admin_promotions_path
  end
  scenario 'admin views promotions' do
    expect(page).to have_css 'td', text: promotion.title
  end

  scenario 'admin sees message when no promotions available' do
    Promotion.destroy(promotion)
    visit admin_promotions_path

    expect(page).to have_css 'p', text: 'Er zijn momenteel geen acties, voeg een nieuwe actie toe'
  end

  scenario 'admin clicks promotion and views promotion details' do
    click_link promotion.title
    expect(page).to have_css 'h1', text: promotion.title
    expect(page).to have_css 'p', text: promotion.tagline 
    expect(page).to have_css 'p', text: promotion.summary
    expect(page).to have_css 'p', text: promotion.description
    expect(page).to have_xpath("//img[contains(@src,'#{File.basename(promotion.image.url)}')]") 
    expect(page).to have_css 'p', text: promotion.price
  end
  
  scenario 'admin sees success message when adding a valid promotion' do
    
    find("input[@value='Actie Toevoegen']").click
    fill_in 'Titel', with: "some title"
    fill_in 'Tagline', with: "some tagline"
    fill_in 'Samenvatting', with: "some summary text"
    fill_in 'Beschrijving', with: "some description"
    fill_in 'Prijs', with: "40.16"
    click_button 'Actie Toevoegen'

    expect(page).to have_css 'p', text: "Er werd een nieuwe actie toegevoegd"
  end

  scenario 'admin sees error message when adding promotion without title' do
    
    find("input[@value='Actie Toevoegen']").click
    fill_in 'Titel', with: ""
    fill_in 'Tagline', with: "some tagline"
    fill_in 'Samenvatting', with: "some summary text"
    fill_in 'Beschrijving', with: "some description"
    click_button 'Actie Toevoegen'

    expect(page).to have_css 'p', text: "Title can't be blank"
  end

  scenario 'admin sees error message when adding promotion without summary' do
    
    find("input[@value='Actie Toevoegen']").click
    fill_in 'Titel', with: "some title"
    fill_in 'Tagline', with: "some tagline"
    fill_in 'Samenvatting', with: ""
    fill_in 'Beschrijving', with: ""
    click_button 'Actie Toevoegen'

    expect(page).to have_css 'p', text: "Description can't be blank"
  end

  scenario 'admin sees error message when adding promotion without description' do
    
    find("input[@value='Actie Toevoegen']").click
    fill_in 'Titel', with: "some title"
    fill_in 'Tagline', with: "some tagline"
    fill_in 'Samenvatting', with: "some summary text"
    fill_in 'Beschrijving', with: ""
    click_button 'Actie Toevoegen'

    expect(page).to have_css 'p', text: "Description can't be blank"
  end
  
  scenario 'admin sees success message when editing a promotion' do
    find("a[href='/admin/promotions/#{promotion.title.parameterize}/edit']").click
    find("input[@id='promotion_title']").set("new title")
    find("input[@id='promotion_tagline']").set("new tagline")
    find("textarea[@id='promotion_summary']").set("new summary")
    find("textarea[@id='promotion_description']").set("new description")
    click_button "Actie Aanpassen"

    expect(page).to have_content "De actie \"new title\" werd aangepast"
  end
  
  scenario 'admin sees error message when editing invalid promotion' do

    find("a[href='/admin/promotions/#{promotion.title.parameterize}/edit']").click
    find("input[@id='promotion_title']").set("")
    find("input[@id='promotion_tagline']").set("new tagline")
    find("textarea[@id='promotion_summary']").set("new summary")
    find("textarea[@id='promotion_description']").set("new description")
    click_button "Actie Aanpassen"

    expect(page).to have_content "Title can't be blank"
  end

  scenario 'an admin deletes a promotion' do
    click_link 'Verwijderen'
    expect(page).to have_css 'p', text: "De actie werd verwijderd"
    expect(page).not_to have_css 'a', text: "promotion1"
  end

  scenario 'an admin sees succes message when hiding a promotion' do
    promotion.visible = true
    promotion.save
    visit admin_promotions_path
    click_link 'Verbergen'
    expect(page).to have_content "De actie is nu verborgen"
  end

  scenario 'an admin sees succes message when making a promotion visible' do
    promotion.visible = false
    promotion.save
    visit admin_promotions_path
    click_link 'Tonen'
    expect(page).to have_content "De actie is nu zichtbaar"
  end
end
