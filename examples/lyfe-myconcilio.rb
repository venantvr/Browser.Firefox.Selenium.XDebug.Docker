require 'rubygems'
require 'selenium-webdriver'
require 'faker'

wd = Selenium::WebDriver.for :firefox

any_email = Faker::Internet.email

wd.get "https://recipe.concilio.com/lyfe-myconcilio/"

wd.find_element(:id, "input_82_12").click
wd.find_element(:id, "input_82_12").clear
wd.find_element(:id, "input_82_12").send_keys "VENANT-VALERY"
wd.find_element(:id, "input_82_13").click
wd.find_element(:id, "input_82_13").clear
wd.find_element(:id, "input_82_13").send_keys "Rénald"
wd.find_element(:id, "input_82_10").click
wd.find_element(:id, "input_82_10").clear
wd.find_element(:id, "input_82_10").send_keys any_email
wd.find_element(:id, "input_82_17").click
wd.find_element(:id, "input_82_17").clear
wd.find_element(:id, "input_82_17").send_keys "Adresse"
wd.find_element(:id, "input_82_20").click
wd.find_element(:id, "input_82_20").clear
wd.find_element(:id, "input_82_20").send_keys "28000"
wd.find_element(:id, "input_82_21").click
wd.find_element(:id, "input_82_21").clear
wd.find_element(:id, "input_82_21").send_keys "CHARTRES"
wd.find_element(:id, "input_82_24").click
wd.find_element(:id, "input_82_24").clear
wd.find_element(:id, "input_82_24").send_keys "Phone"

# Hidden field...
wd.execute_script("return document.getElementById('input_82_2').value = '" + any_email + "';")

if not wd.find_element(:id, "choice_82_14_1").selected?
    wd.find_element(:id, "choice_82_14_1").click
end

wd.find_element(:id, "gform_submit_button_82").click
wd.quit

