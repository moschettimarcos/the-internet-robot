"""Base page class with common functionality for all pages."""

from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.by import By


class BasePage:
    """Base page class with common methods for page interactions."""

    def __init__(self, driver):
        """Initialize base page with driver."""
        self.driver = driver
        self.timeout = 30

    def open(self, url):
        """Navigate to the specified URL."""
        self.driver.get(url)

    def find_element(self, locator, timeout=None):
        """Find element with explicit wait."""
        wait_time = timeout or self.timeout
        return WebDriverWait(self.driver, wait_time).until(EC.presence_of_element_located(locator))

    def find_elements(self, locator, timeout=None):
        """Find multiple elements with explicit wait."""
        wait_time = timeout or self.timeout
        WebDriverWait(self.driver, wait_time).until(EC.presence_of_element_located(locator))
        return self.driver.find_elements(*locator)

    def click_element(self, locator, timeout=None):
        """Click on element with explicit wait."""
        wait_time = timeout or self.timeout
        element = WebDriverWait(self.driver, wait_time).until(EC.element_to_be_clickable(locator))
        element.click()

    def send_keys(self, locator, text, timeout=None):
        """Send keys to element with explicit wait."""
        wait_time = timeout or self.timeout
        element = WebDriverWait(self.driver, wait_time).until(
            EC.presence_of_element_located(locator)
        )
        element.clear()
        element.send_keys(text)

    def get_text(self, locator, timeout=None):
        """Get text from element with explicit wait."""
        wait_time = timeout or self.timeout
        element = WebDriverWait(self.driver, wait_time).until(
            EC.presence_of_element_located(locator)
        )
        return element.text

    def is_element_visible(self, locator, timeout=None):
        """Check if element is visible."""
        wait_time = timeout or self.timeout
        try:
            WebDriverWait(self.driver, wait_time).until(EC.visibility_of_element_located(locator))
            return True
        except:
            return False

    def is_element_enabled(self, locator, timeout=None):
        """Check if element is enabled."""
        wait_time = timeout or self.timeout
        element = WebDriverWait(self.driver, wait_time).until(
            EC.presence_of_element_located(locator)
        )
        return element.is_enabled()

    def wait_for_element_to_disappear(self, locator, timeout=None):
        """Wait for element to disappear from the page."""
        wait_time = timeout or self.timeout
        WebDriverWait(self.driver, wait_time).until(EC.invisibility_of_element_located(locator))

    def get_current_url(self):
        """Get current URL."""
        return self.driver.current_url

    def get_page_title(self):
        """Get page title."""
        return self.driver.title
