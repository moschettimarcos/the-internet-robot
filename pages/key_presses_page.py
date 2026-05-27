"""Key Presses page."""
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from .base_page import BasePage


class KeyPressesPage(BasePage):
    """Page object for the Key Presses page."""

    # Locators
    TARGET_INPUT = (By.ID, "target")
    RESULT_TEXT = (By.ID, "result")
    PAGE_HEADER = (By.TAG_NAME, "h3")

    def __init__(self, driver):
        """Initialize key presses page."""
        super().__init__(driver)
        self.url = "https://the-internet.herokuapp.com/key_presses"

    def navigate(self):
        """Navigate to key presses page."""
        self.open(self.url)

    def press_key(self, key):
        """Press a key on the target input."""
        target = self.find_element(self.TARGET_INPUT)
        target.send_keys(key)

    def press_enter(self):
        """Press Enter key."""
        self.press_key(Keys.ENTER)

    def press_escape(self):
        """Press Escape key."""
        self.press_key(Keys.ESCAPE)

    def press_space(self):
        """Press Space key."""
        self.press_key(Keys.SPACE)

    def press_tab(self):
        """Press Tab key."""
        self.press_key(Keys.TAB)

    def get_result_text(self):
        """Get result text after key press."""
        return self.get_text(self.RESULT_TEXT)

    def get_page_header(self):
        """Get page header text."""
        return self.get_text(self.PAGE_HEADER)
