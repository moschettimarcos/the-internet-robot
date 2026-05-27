"""Dynamic Controls page."""

from selenium.webdriver.common.by import By
from .base_page import BasePage


class DynamicControlsPage(BasePage):
    """Page object for the Dynamic Controls page."""

    # Locators
    CHECKBOX = (By.ID, "checkbox")
    REMOVE_BUTTON = (By.CSS_SELECTOR, "button[onclick='swapCheckbox()']")
    ADD_BUTTON = (By.CSS_SELECTOR, "button[onclick='swapCheckbox()']")
    ENABLE_BUTTON = (By.CSS_SELECTOR, "button[onclick='swapInput()']")
    DISABLE_BUTTON = (By.CSS_SELECTOR, "button[onclick='swapInput()']")
    INPUT_FIELD = (By.CSS_SELECTOR, "input[type='text']")
    MESSAGE = (By.ID, "message")
    PAGE_HEADER = (By.TAG_NAME, "h4")

    def __init__(self, driver):
        """Initialize dynamic controls page."""
        super().__init__(driver)
        self.url = "https://the-internet.herokuapp.com/dynamic_controls"

    def navigate(self):
        """Navigate to dynamic controls page."""
        self.open(self.url)

    def is_checkbox_visible(self):
        """Check if checkbox is visible."""
        return self.is_element_visible(self.CHECKBOX)

    def click_remove_button(self):
        """Click remove button to remove checkbox."""
        self.click_element(self.REMOVE_BUTTON)

    def click_add_button(self):
        """Click add button to add checkbox."""
        self.click_element(self.ADD_BUTTON)

    def is_checkbox_selected(self):
        """Check if checkbox is selected."""
        checkbox = self.find_element(self.CHECKBOX)
        return checkbox.is_selected()

    def select_checkbox(self):
        """Select the checkbox."""
        checkbox = self.find_element(self.CHECKBOX)
        checkbox.click()

    def is_input_enabled(self):
        """Check if input field is enabled."""
        return self.is_element_enabled(self.INPUT_FIELD)

    def click_enable_button(self):
        """Click enable button to enable input."""
        self.click_element(self.ENABLE_BUTTON)

    def click_disable_button(self):
        """Click disable button to disable input."""
        self.click_element(self.DISABLE_BUTTON)

    def send_text_to_input(self, text):
        """Send text to input field."""
        self.send_keys(self.INPUT_FIELD, text)

    def get_input_value(self):
        """Get value from input field."""
        input_element = self.find_element(self.INPUT_FIELD)
        return input_element.get_attribute("value")

    def get_message(self):
        """Get message text."""
        return self.get_text(self.MESSAGE)

    def get_page_header(self):
        """Get page header text."""
        return self.get_text(self.PAGE_HEADER)
