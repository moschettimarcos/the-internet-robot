"""File Upload page."""

from selenium.webdriver.common.by import By
from .base_page import BasePage


class FileUploadPage(BasePage):
    """Page object for the File Upload page."""

    # Locators
    FILE_INPUT = (By.ID, "file-upload")
    UPLOAD_BUTTON = (By.ID, "file-submit")
    SUCCESS_MESSAGE = (By.TAG_NAME, "h3")
    UPLOADED_FILES = (By.ID, "uploaded-files")
    PAGE_HEADER = (By.TAG_NAME, "h3")

    def __init__(self, driver):
        """Initialize file upload page."""
        super().__init__(driver)
        self.url = "https://the-internet.herokuapp.com/upload"

    def navigate(self):
        """Navigate to file upload page."""
        self.open(self.url)

    def upload_file(self, file_path):
        """Upload file by providing file path."""
        file_input = self.find_element(self.FILE_INPUT)
        file_input.send_keys(file_path)
        self.click_element(self.UPLOAD_BUTTON)

    def get_success_message(self):
        """Get success message after upload."""
        return self.get_text(self.SUCCESS_MESSAGE)

    def get_uploaded_filename(self):
        """Get uploaded file name."""
        return self.get_text(self.UPLOADED_FILES)

    def get_page_header(self):
        """Get page header text."""
        return self.get_text(self.PAGE_HEADER)
