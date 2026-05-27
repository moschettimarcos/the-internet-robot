"""Inputs page."""

from selenium.webdriver.common.by import By
from .base_page import BasePage


class InputsPage(BasePage):
    """Page object for the Inputs page."""

    # Locators
    NUMBER_INPUT = (By.CSS_SELECTOR, "input[type='number']")
    PAGE_HEADER = (By.TAG_NAME, "h3")

    def __init__(self, driver):
        """Initialize inputs page."""
        super().__init__(driver)
        self.url = "https://the-internet.herokuapp.com/inputs"

    def navigate(self):
        """Navigate to inputs page."""
        self.open(self.url)

    def enter_number(self, number):
        """Enter number in the input field."""
        self.send_keys(self.NUMBER_INPUT, str(number))

    def get_input_value(self):
        """Get current value from input field."""
        input_element = self.find_element(self.NUMBER_INPUT)
        return input_element.get_attribute("value")

    def clear_input(self):
        """Clear the input field."""
        input_element = self.find_element(self.NUMBER_INPUT)
        input_element.clear()

    def increment_number(self, times=1):
        """Increment number using arrow up key."""
        from selenium.webdriver.common.keys import Keys

        input_element = self.find_element(self.NUMBER_INPUT)
        for _ in range(times):
            input_element.send_keys(Keys.ARROW_UP)

    def decrement_number(self, times=1):
        """Decrement number using arrow down key."""
        from selenium.webdriver.common.keys import Keys

        input_element = self.find_element(self.NUMBER_INPUT)
        for _ in range(times):
            input_element.send_keys(Keys.ARROW_DOWN)

    def get_page_header(self):
        """Get page header text."""
        return self.get_text(self.PAGE_HEADER)
