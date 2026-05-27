"""Hovers page."""

from selenium.webdriver.common.by import By
from selenium.webdriver.common.action_chains import ActionChains
from .base_page import BasePage


class HoversPage(BasePage):
    """Page object for the Hovers page."""

    # Locators
    AVATARS = (By.CSS_SELECTOR, ".figure")
    AVATAR_IMAGES = (By.CSS_SELECTOR, ".figure img")
    CAPTIONS = (By.CSS_SELECTOR, ".figcaption")
    USER_NAMES = (By.CSS_SELECTOR, ".figcaption h5")
    PROFILE_LINKS = (By.CSS_SELECTOR, ".figcaption a")
    PAGE_HEADER = (By.TAG_NAME, "h3")

    def __init__(self, driver):
        """Initialize hovers page."""
        super().__init__(driver)
        self.url = "https://the-internet.herokuapp.com/hovers"

    def navigate(self):
        """Navigate to hovers page."""
        self.open(self.url)

    def hover_over_avatar(self, index):
        """Hover over avatar by index (0-based)."""
        avatars = self.find_elements(self.AVATARS)
        actions = ActionChains(self.driver)
        actions.move_to_element(avatars[index]).perform()

    def is_caption_visible(self, index):
        """Check if caption is visible for avatar at index."""
        captions = self.find_elements(self.CAPTIONS)
        return captions[index].is_displayed()

    def get_user_name(self, index):
        """Get user name for avatar at index."""
        user_names = self.find_elements(self.USER_NAMES)
        return user_names[index].text

    def get_profile_link_href(self, index):
        """Get profile link href for avatar at index."""
        profile_links = self.find_elements(self.PROFILE_LINKS)
        return profile_links[index].get_attribute("href")

    def click_profile_link(self, index):
        """Click profile link for avatar at index."""
        profile_links = self.find_elements(self.PROFILE_LINKS)
        profile_links[index].click()

    def get_avatar_count(self):
        """Get total number of avatars."""
        return len(self.find_elements(self.AVATAR_IMAGES))

    def get_page_header(self):
        """Get page header text."""
        return self.get_text(self.PAGE_HEADER)
