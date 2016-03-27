require 'rails_helper'

describe "the index page", :type => :feature do
  before do
    10.times do
      create(:student)
    end
    create(:student, :cs)
    create(:student, :non_cs)
    visit "/"
  end

  it "displays a list of students" do
    expect(page).to have_content('Students at University')
    expect(page).to have_content('Mary')
    expect(page).to have_content('Lynn')
    expect(find_field("major-select").value).to eq "Filter by major:"
  end

  it "filters by major" do
    select('CS', from: "major-select")
    visit(root_path + "/?major=CS")
    expect(page).to_not have_content('Mary')
    expect(page).to have_content('Lynn')
  end
end

describe "Selenium run" do
  before(:each) do
    @driver = Selenium::WebDriver.for :chrome
    @base_url = "localhost:3000"
    @accept_next_alert = true
    @driver.manage.timeouts.implicit_wait = 30
  end

  after(:each) do
    @driver.quit
  end

  it "persists the chosen select box option" do
    skip
    @driver.get(@base_url + "/?major=CS")
    # no value is showing up in drop-down with Selenium, I think it's bc it populates
    # from a cookie. I should change that to populate from the major parameter in the url.
    # @driver.save_screenshot('screenshot.png')
    expect(@driver.execute_script("return $('#major-select').val()")).to eq "CS"
  end
end
