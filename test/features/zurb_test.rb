require "test_helper"
require 'capybara/poltergeist'

Capybara.javascript_driver = :poltergeist


class ZurbTest < Capybara::Rails::TestCase

  feature 'Zurb' do
    scenario 'loads Zurb correctly' do
      visit root_path
#      puts page.driver.network_traffic
#      assert_true page.driver.network_traffic.include?('framework_and_overrides.css.scss'), true
    end
  end

end
