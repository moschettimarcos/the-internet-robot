"""Dropdown page."""
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import Select
from .base_page import BasePage


class DropdownPage(BasePage):
    """Page object for the Dropdown page."""

    # Locators
    DROPDOWN = (By.ID, "dropdown")
    PAGE_HEADER = (By.TAG_NAME, "h3")

    def __init__(self, driver):
        """Initialize dropdown page."""
        super().__init__(driver)
        self.url = "https://the-internet.herokuapp.com/dropdown"

    def navigate(self):
        """Navigate to dropdown page."""
        self.open(self.url)

    def get_dropdown_element(self):
        """Get dropdown select element."""
        return self.find_element(self.DROPDOWN)

    def get_selected_option(self):
        """Get currently selected option text."""
        dropdown = Select(self.get_dropdown_element())
        return dropdown.first_selected_option.text

    def select_option_by_text(self, text):
        """Select option by visible text."""
        dropdown = Select(self.get_dropdown_element())
        dropdown.select_by_visible_text(text)

    def select_option_by_value(self, value):
        """Select option by value attribute."""
        dropdown = Select(self.get_dropdown_element())
        dropdown.select_by_value(value)

    def select_option_by_index(self, index):
        """Select option by index (0-based)."""
        dropdown = Select(self.get_dropdown_element())
        dropdown.select_by_index(index)

    def get_all_options(self):
        """Get all available options."""
        dropdown = Select(self.get_dropdown_element())
        return [option.text for option in dropdown.options]

    def get_page_header(self):
        """Get page header text."""
        return self.get_text(self.PAGE_HEADER)
