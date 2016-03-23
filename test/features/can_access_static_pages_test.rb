require "test_helper"

feature "CanAccessStaticPages" do
  scenario "on the index page" do
    visit root_path
    page.must_have_content "Students at University"
    # all majors selected
    page.find("#major-select").value.must_equal "Filter by major:"
    page.must_have_content "all majors"
    page.must_have_content students(:mary).name
    # select one major
    page.select "CS", from: "major-select"
    # how to trigger reload page in capybara?
    # and check that "CS" still showing as select option?
    # page.find("#major-select").value.must_equal "CS"
    page.visit root_path + "/?major=CS"
    page.wont_have_content students(:mary).name
    page.must_have_content students(:jake).name
    page.must_have_content students(:john).name
  end
end
