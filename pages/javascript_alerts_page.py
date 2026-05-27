"""JavaScript Alerts page."""
from selenium.webdriver.common.by import By
from selenium.webdriver.common.alert import Alert
from .base_page import BasePage


class JavaScriptAlertsPage(BasePage):
    """Page object for the JavaScript Alerts page."""

    # Locators
    JS_ALERT_BUTTON = (By.CSS_SELECTOR, "button[onclick='jsAlert()']")
    JS_CONFIRM_BUTTON = (By.CSS_SELECTOR, "button[onclick='jsConfirm()']")
    JS_PROMPT_BUTTON = (By.CSS_SELECTOR, "button[onclick='jsPrompt()']")
    RESULT_MESSAGE = (By.ID, "result")
    PAGE_HEADER = (By.TAG_NAME, "h3")

    def __init__(self, driver):
        """Initialize JavaScript alerts page."""
        super().__init__(driver)
        self.url = "https://the-internet.herokuapp.com/javascript_alerts"

    def navigate(self):
        """Navigate to JavaScript alerts page."""
        self.open(self.url)

    def click_js_alert(self):
        """Click JS Alert button."""
        self.click_element(self.JS_ALERT_BUTTON)

    def click_js_confirm(self):
        """Click JS Confirm button."""
        self.click_element(self.JS_CONFIRM_BUTTON)

    def click_js_prompt(self):
        """Click JS Prompt button."""
        self.click_element(self.JS_PROMPT_BUTTON)

    def accept_alert(self):
        """Accept the alert."""
        alert = Alert(self.driver)
        alert.accept()

    def dismiss_alert(self):
        """Dismiss the alert."""
        alert = Alert(self.driver)
        alert.dismiss()

    def send_text_to_prompt(self, text):
        """Send text to prompt alert."""
        alert = Alert(self.driver)
        alert.send_keys(text)

    def get_alert_text(self):
        """Get alert text."""
        alert = Alert(self.driver)
        return alert.text

    def get_result_message(self):
        """Get result message after alert interaction."""
        return self.get_text(self.RESULT_MESSAGE)

    def get_page_header(self):
        """Get page header text."""
        return self.get_text(self.PAGE_HEADER)
