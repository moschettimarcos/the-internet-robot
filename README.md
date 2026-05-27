# The Internet Robot Project

Professional automation project for [the-internet.herokuapp.com](https://the-internet.herokuapp.com/) using Robot Framework and Selenium WebDriver. This project demonstrates best practices in test automation, including Page Object Model, reusable keywords, and comprehensive test coverage.

## 🚀 Features

- **Page Object Model**: Clean separation between page logic and test cases
- **Reusable Keywords**: Common keywords for consistent test implementation
- **Comprehensive Coverage**: Tests for multiple UI components and interactions
- **Professional Structure**: Well-organized project following industry standards
- **CI/CD Ready**: GitHub Actions workflow for automated test execution
- **Cross-Browser Support**: Configured for Chrome (easily extensible to other browsers)

## 📋 Test Coverage

The project includes automated tests for the following features:

- **Form Authentication**: Login, logout, and error handling
- **Checkboxes**: Selection and deselection of checkboxes
- **Dropdown**: Option selection by text, value, and index
- **Dynamic Controls**: Element addition/removal and enable/disable
- **Add/Remove Elements**: Dynamic element manipulation
- **JavaScript Alerts**: Alert, Confirm, and Prompt interactions
- **Key Presses**: Keyboard input detection
- **Inputs**: Number input and arrow key interactions
- **Hovers**: Hover interactions and caption display

## 🛠️ Tech Stack

- **Robot Framework**: 7.0.1
- **SeleniumLibrary**: 6.4.0
- **Selenium WebDriver**: 4.23.1
- **Python**: 3.9+

## 📁 Project Structure

```
the-internet-robot/
├── .github/
│   └── workflows/
│       └── ci.yml              # GitHub Actions CI/CD pipeline
├── pages/                      # Page Object Model
│   ├── __init__.py
│   ├── base_page.py           # Base page with common methods
│   ├── login_page.py          # Login page object
│   ├── checkboxes_page.py     # Checkboxes page object
│   ├── dropdown_page.py       # Dropdown page object
│   ├── dynamic_controls_page.py
│   ├── add_remove_elements_page.py
│   ├── file_upload_page.py
│   ├── javascript_alerts_page.py
│   ├── key_presses_page.py
│   ├── inputs_page.py
│   └── hovers_page.py
├── resources/                  # Robot Framework resources
│   ├── config.robot           # Configuration variables
│   └── common_keywords.robot  # Reusable keywords
├── tests/                      # Test suites
│   ├── test_login.robot
│   ├── test_checkboxes.robot
│   ├── test_dropdown.robot
│   ├── test_dynamic_controls.robot
│   ├── test_add_remove_elements.robot
│   ├── test_javascript_alerts.robot
│   ├── test_key_presses.robot
│   ├── test_inputs.robot
│   └── test_hovers.robot
├── results/                    # Test execution results
├── screenshots/                # Failure screenshots
├── .gitignore
├── README.md
├── CONTRIBUTING.md
├── requirements.txt            # Python dependencies
├── pyproject.toml             # Project configuration
└── robot.yaml                 # Robot Framework configuration
```

## 🚦 Prerequisites

- Python 3.9 or higher
- pip (Python package installer)
- Git

## 📦 Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/the-internet-robot.git
   cd the-internet-robot
   ```

2. **Create a virtual environment** (recommended)
   ```bash
   python -m venv venv
   
   # On Windows
   venv\Scripts\activate
   
   # On macOS/Linux
   source venv/bin/activate
   ```

3. **Install dependencies**
   ```bash
   pip install -r requirements.txt
   ```

4. **Install ChromeDriver** (if not using webdriver-manager)
   - Download ChromeDriver from [ChromeDriver Downloads](https://chromedriver.chromium.org/downloads)
   - Add ChromeDriver to your system PATH

## 🎯 Running Tests

### Run All Tests
```bash
robot --outputdir results tests/
```

### Run Specific Test Suite
```bash
robot --outputdir results tests/test_login.robot
```

### Run Tests by Tag
```bash
# Run only login tests
robot --include login --outputdir results tests/

# Run only positive tests
robot --include positive --outputdir results tests/

# Run only specific feature tests
robot --include checkboxes --outputdir results tests/
```

### Run Tests in Headless Mode
```bash
robot --variable HEADLESS:true --outputdir results tests/
```

### Run Tests with Specific Browser
```bash
# Chrome (default)
robot --variable BROWSER:chrome --outputdir results tests/

# Firefox
robot --variable BROWSER:firefox --outputdir results tests/

# Edge
robot --variable BROWSER:edge --outputdir results tests/
```

### Generate Detailed Report
```bash
robot --outputdir results --loglevel DEBUG tests/
```

## 📊 Test Reports

After test execution, reports are generated in the `results/` directory:
- `log.html`: Detailed execution log
- `report.html`: Summary report with statistics
- `output.xml`: Machine-readable output

## 🔧 Configuration

Configuration can be modified in `robot.yaml`:
```yaml
output_dir: results
log_level: INFO
variables:
  BASE_URL: https://the-internet.herokuapp.com
  BROWSER: chrome
  HEADLESS: "false"
  IMPLICIT_WAIT: 10s
  EXPLICIT_WAIT: 30s
```

## 🤝 Contributing

Contributions are welcome! Please read [CONTRIBUTING.md](CONTRIBUTING.md) for details on our code of conduct and the process for submitting pull requests.

## 📝 Development Guidelines

### Adding New Tests

1. Create a new page object in `pages/` directory
2. Add test cases in `tests/` directory
3. Use existing keywords from `resources/common_keywords.robot`
4. Follow the existing naming conventions
5. Add appropriate tags for test categorization

### Code Style

- Use Black for Python code formatting
- Follow PEP 8 guidelines
- Add docstrings to all functions and classes
- Use descriptive variable and function names

### Best Practices

- Use Page Object Model for page interactions
- Keep test cases independent and isolated
- Use meaningful test names and descriptions
- Add appropriate tags for test categorization
- Handle waits properly (explicit waits over implicit)
- Take screenshots on test failures

## 🐛 Troubleshooting

### ChromeDriver Issues
If you encounter ChromeDriver issues:
```bash
pip install --upgrade webdriver-manager
```

### Element Not Found Errors
- Increase wait times in `robot.yaml`
- Check if selectors are correct
- Verify page is fully loaded

### Import Errors
- Ensure virtual environment is activated
- Verify all dependencies are installed
- Check Python path includes project directory

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 👤 Author

**Marcos**
- GitHub: [@yourusername](https://github.com/yourusername)
- Portfolio: [yourportfolio.com](https://yourportfolio.com)

## 🙏 Acknowledgments

- [The Internet](https://the-internet.herokuapp.com/) for providing the test application
- [Robot Framework](https://robotframework.org/) community
- [Selenium](https://www.selenium.dev/) team

## 📞 Contact

For questions or suggestions, please open an issue on GitHub or contact [marcos@example.com](mailto:marcos@example.com).

---

**Note**: This project is intended for educational and portfolio purposes. It demonstrates professional test automation practices and can be used as a template for other automation projects.
