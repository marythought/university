require 'rails_helper'

describe "the index page", :type => :feature do
  before do
    create(:student, :cs)
    create(:student, :non_cs)
  end

  it "is reading the test file" do
    expect(3).to eq 3
  end

  it "displays a list of students" do
    visit "/"
    expect(page).to have_content('Students at University')
    expect(page).to have_content('Mary')
    expect(page).to have_content('Lynn')
    expect(find_field("major-select").value).to eq "Filter by major:"
    select('CS', from: "major-select")
    # how to recognize JS reload page in capybara?
    visit(root_path + "/?major=CS")
    expect(page).to_not have_content('Mary')
    expect(page).to have_content('Lynn')
    # and check that "CS" still showing as select option?
    # This works in dev environment.
    expect(find_field("major-select").value).to eq "CS"
  end
end
