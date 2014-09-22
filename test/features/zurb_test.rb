require "test_helper"
require 'capybara/poltergeist'

Capybara.javascript_driver = :poltergeist


class ZurbTest < Capybara::Rails::TestCase

  feature 'BootStrap' do
    scenario 'loads bootstrap correctly' do
      visit root_path
      puts page.driver.network_traffic
      assert_true page.driver.network_traffic.include?('bootstrap.js'), true
    end
  end

end
