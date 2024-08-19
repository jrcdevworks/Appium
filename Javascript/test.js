const {remote} = require('webdriverio');

const capabilities = {
  platformName: 'Android',
  'appium:automationName': 'UiAutomator2',
  'appium:deviceName': 'Android',
  'appium:browserName': 'chrome'
};

const wdOpts = {
  hostname: process.env.APPIUM_HOST || 'localhost',
  port: parseInt(process.env.APPIUM_PORT, 10) || 4723,
  logLevel: 'info',
  capabilities,
};

async function test_navigateToBlogPage() {
  const driver = await remote(wdOpts);
  try{
    await driver.navigateTo('https://www.fusionmedstaff.com/');
    const menu = driver.$('//*[@id="__next"]/header/div[1]/nav/div/div[2]/button');
    await menu.click();
    const blogListItem = driver.$('//*[contains(text(), "Blog")]');
    await blogListItem.click();
    var blogHeader = driver.$('//*[@id="hs_cos_wrapper_module_150521827506610"]/h3').getText();
    console.log(blogHeader);


  } finally {
    await driver.pause(1000);
    await driver.deleteSession();
  }

}

test_navigateToBlogPage().catch(console.error);