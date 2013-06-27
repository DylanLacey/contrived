# You should edit this file with the browsers you wish to use
# For options, check out http://saucelabs.com/docs/platforms
require "sauce"
require "sauce/capybara"

Sauce.config do |config|
  config[:browsers] = [
    ["Windows 8", "Internet Explorer", 10],
    ["OS X 10.6", "ipad", 5],
    ["Linux", "Opera", 12],
    ["OS X 10.8", "Safari", 6]
  ]

  config[:start_tunnel] = false
end

Capybara.default_driver = :sauce
