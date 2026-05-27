"""Login page for Form Authentication."""
from selenium.webdriver.common.by import By
from .base_page import BasePage


class LoginPage(BasePage):
    """Page object for the Login page."""

    # Locators
    USERNAME_INPUT = (By.ID, "username")
    PASSWORD_INPUT = (By.ID, "password")
    LOGIN_BUTTON = (By.CSS_SELECTOR, "button[type='submit']")
    SUCCESS_MESSAGE = (By.ID, "flash")
    ERROR_MESSAGE = (By.ID, "flash")
    LOGOUT_BUTTON = (By.CSS_SELECTOR, "a[href='/logout']")
    PAGE_HEADER = (By.TAG_NAME, "h2")

    def __init__(self, driver):
        """Initialize login page."""
        super().__init__(driver)
        self.url = "https://the-internet.herokuapp.com/login"

    def navigate(self):
        """Navigate to login page."""
        self.open(self.url)

    def login(self, username, password):
        """Login with credentials."""
        self.send_keys(self.USERNAME_INPUT, username)
        self.send_keys(self.PASSWORD_INPUT, password)
        self.click_element(self.LOGIN_BUTTON)

    def get_success_message(self):
        """Get success message after login."""
        return self.get_text(self.SUCCESS_MESSAGE).strip()

    def get_error_message(self):
        """Get error message after failed login."""
        return self.get_text(self.ERROR_MESSAGE).strip()

    def is_logout_button_visible(self):
        """Check if logout button is visible."""
        return self.is_element_visible(self.LOGOUT_BUTTON)

    def logout(self):
        """Logout from the application."""
        self.click_element(self.LOGOUT_BUTTON)

    def get_page_header(self):
        """Get page header text."""
        return self.get_text(self.PAGE_HEADER)
