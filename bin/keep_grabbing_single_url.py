import selenium.webdriver as webdriver
import sys

#first  arg = folder to save the screenshot to
#second arg = list of urls to grab

folder_path = sys.argv[1]
filename = sys.argv[2]
url = sys.argv[3]

driver = webdriver.Firefox()
driver.maximize_window()

#filename = 'helpling-de.png'

screenshot_path = folder_path + '/'

location = screenshot_path + filename

#print location

driver.get(url)
driver.save_screenshot(location)

driver.close()
