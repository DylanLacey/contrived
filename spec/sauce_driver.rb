un = ENV["SAUCE_USERNAME"]
access_key = ENV["SAUCE_ACCESS_KEY"]

Capybara.register_driver :sauce do |application|
  Capybara::Selenium::Driver.new(application,
    :browser => :remote,
    :url => "http://#{un}:#{access_key}@ondemand.saucelabs.com:80/wd/hub",
    :desired_capabilities => :internet_explorer
  )
end
