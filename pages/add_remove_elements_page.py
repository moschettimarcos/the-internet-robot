"""Add/Remove Elements page."""
from selenium.webdriver.common.by import By
from .base_page import BasePage


class AddRemoveElementsPage(BasePage):
    """Page object for the Add/Remove Elements page."""

    # Locators
    ADD_ELEMENT_BUTTON = (By.CSS_SELECTOR, "button[onclick='addElement()']")
    DELETE_BUTTONS = (By.CSS_SELECTOR, "button[onclick='deleteElement()']")
    PAGE_HEADER = (By.TAG_NAME, "h3")

    def __init__(self, driver):
        """Initialize add/remove elements page."""
        super().__init__(driver)
        self.url = "https://the-internet.herokuapp.com/add_remove_elements/"

    def navigate(self):
        """Navigate to add/remove elements page."""
        self.open(self.url)

    def click_add_element(self):
        """Click add element button."""
        self.click_element(self.ADD_ELEMENT_BUTTON)

    def get_delete_buttons_count(self):
        """Get count of delete buttons."""
        return len(self.find_elements(self.DELETE_BUTTONS))

    def click_delete_button(self, index=0):
        """Click delete button by index."""
        delete_buttons = self.find_elements(self.DELETE_BUTTONS)
        delete_buttons[index].click()

    def click_all_delete_buttons(self):
        """Click all delete buttons to remove all elements."""
        delete_buttons = self.find_elements(self.DELETE_BUTTONS)
        for button in delete_buttons:
            button.click()

    def get_page_header(self):
        """Get page header text."""
        return self.get_text(self.PAGE_HEADER)
