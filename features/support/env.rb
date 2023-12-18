require 'capybara'
require 'cucumber'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'capybara/rspec'
require 'rspec'
require 'bundler'
require 'site_prism'
require 'httparty'
require 'httparty/request'
require 'httparty/response/headers'
require_relative 'helper.rb'
require 'pry'


BROWSER = ENV['BROWSER']
AMBIENTE = ENV['AMBIENTE']

CONFIG = YAML.load_file(File.dirname(__FILE__) + "/ambientes/#{AMBIENTE}.yml")

World(Helper)
World(PageObjects)

Capybara.register_driver :selenium do |app|
    if BROWSER.eql?('edge')
        Capybara::Selenium::Driver.new(app, :browser => :edge)
    elsif BROWSER.eql?('firefox')
        Capybara::Selenium::Driver.new(app, :browser => :firefox, :marionette =>true)
    elsif BROWSER.eql?('safari')
        Capybara::Selenium::Driver.new(app, :browser => :safari)
    elsif BROWSER.eql?('ie')
        Capybara::Selenium::Driver.new(app, :browser => :internet_explorer)
    elsif BROWSER.eql?('chrome')
        Capybara::Selenium::Driver.new(app, :browser => :chrome)
    elsif BROWSER.eql?('chrome_headless')
        Capybara::Selenium::Driver.new(app, :browser => :chrome,
        options: Selenium::WebDriver::Chrome::Options.new(args: %w[headless disable-gpu])
        )
    end
end

Capybara.configure do |config|
    config.app_host = CONFIG['url_padrao']
    CONFIG['filial']
    CONFIG['empresa']
    CONFIG['matricula']
    CONFIG['senha']
end

Capybara.default_driver = :selenium

Capybara.default_max_wait_time = 30

Capybara.page.driver.browser.manage.window.maximize