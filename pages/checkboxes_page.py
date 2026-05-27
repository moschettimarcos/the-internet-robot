"""Checkboxes page."""
from selenium.webdriver.common.by import By
from .base_page import BasePage


class CheckboxesPage(BasePage):
    """Page object for the Checkboxes page."""

    # Locators
    CHECKBOXES = (By.CSS_SELECTOR, "input[type='checkbox']")
    PAGE_HEADER = (By.TAG_NAME, "h3")

    def __init__(self, driver):
        """Initialize checkboxes page."""
        super().__init__(driver)
        self.url = "https://the-internet.herokuapp.com/checkboxes"

    def navigate(self):
        """Navigate to checkboxes page."""
        self.open(self.url)

    def get_all_checkboxes(self):
        """Get all checkbox elements."""
        return self.find_elements(self.CHECKBOXES)

    def get_checkbox(self, index):
        """Get checkbox by index (0-based)."""
        checkboxes = self.get_all_checkboxes()
        return checkboxes[index]

    def is_checkbox_selected(self, index):
        """Check if checkbox at index is selected."""
        checkbox = self.get_checkbox(index)
        return checkbox.is_selected()

    def toggle_checkbox(self, index):
        """Toggle checkbox at index."""
        checkbox = self.get_checkbox(index)
        checkbox.click()

    def select_checkbox(self, index):
        """Select checkbox at index if not already selected."""
        if not self.is_checkbox_selected(index):
            self.toggle_checkbox(index)

    def deselect_checkbox(self, index):
        """Deselect checkbox at index if selected."""
        if self.is_checkbox_selected(index):
            self.toggle_checkbox(index)

    def get_page_header(self):
        """Get page header text."""
        return self.get_text(self.PAGE_HEADER)
