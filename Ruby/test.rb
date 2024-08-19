require 'appium_lib_core'
require 'test/unit'

CAPABILITIES = {
  platformName: 'Android',
  automationName: 'uiautomator2',
  deviceName: 'Android',
  browserName: 'chrome'
  #appPackage: 'com.android.settings',
  #appActivity: '.Settings',
  #language: 'en',
  #locale: 'US'
}

SERVER_URL = 'http://127.0.0.1:4723/'

class AppiumTest < Test::Unit::TestCase
  def setup
    @core = ::Appium::Core.for capabilities: CAPABILITIES
    @driver = @core.start_driver server_url: SERVER_URL
  end

  def teardown
    @driver&.quit
  end

  def test_assert_blog_header
    #@driver.wait { |d| d.find_element :xpath, '//*[@text="Battery"]' }.click

    @driver.get('https://www.fusionmedstaff.com/')
    @driver.find_element(:xpath, '//*[@id="__next"]/header/div[1]/nav/div/a/img').click
    @driver.find_element(:xpath, '//*[@id="__next"]/header/div[1]/nav/div/div[2]/button').click
    sleep(5)
    #@driver.find_element(:xpath, '//*[@id="__next"]/header/div[1]/nav/div/div[2]/div[1]/div[2]/div/div/div[5]').click
    @driver.find_element(:xpath, '//*[contains(text(), "Blog")]').click
    sleep(5)
    blog_txt = @driver.find_element(:xpath, '//*[@id="hs_cos_wrapper_module_150521827506610"]/h3').text
    puts blog_txt

    assert_equal("The word on the street", blog_txt)
    
  end
end