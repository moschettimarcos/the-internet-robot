# Contributing to The Internet Robot Project

Thank you for your interest in contributing to this project! This document provides guidelines and instructions for contributing.

## 🤝 How to Contribute

### Reporting Bugs

Before creating bug reports, please check the existing issues to avoid duplicates. When creating a bug report, include:

- **Description**: A clear and concise description of the bug
- **Steps to Reproduce**: Steps to reproduce the behavior
- **Expected Behavior**: What you expected to happen
- **Actual Behavior**: What actually happened
- **Screenshots**: Screenshots if applicable
- **Environment**: 
  - OS: [e.g., Windows 10, macOS 13, Ubuntu 22.04]
  - Python version: [e.g., 3.11]
  - Browser and version: [e.g., Chrome 120]

### Suggesting Enhancements

Enhancement suggestions are welcome! Please include:

- **Description**: A clear and concise description of the enhancement
- **Motivation**: Why this enhancement would be useful
- **Proposed Solution**: How you envision the enhancement being implemented
- **Alternatives**: Any alternative solutions or features you've considered

## 🛠️ Development Setup

1. **Fork the repository**
   ```bash
   # Fork the repository on GitHub
   # Clone your fork
   git clone https://github.com/yourusername/the-internet-robot.git
   cd the-internet-robot
   ```

2. **Create a virtual environment**
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
   pip install -r requirements-dev.txt  # if available
   ```

4. **Create a branch**
   ```bash
   git checkout -b feature/your-feature-name
   # or
   git checkout -b fix/your-bug-fix
   ```

## 📝 Coding Standards

### Python Code

- Follow [PEP 8](https://pep8.org/) style guidelines
- Use [Black](https://black.readthedocs.io/) for code formatting
- Add docstrings to all functions and classes
- Use descriptive variable and function names
- Keep functions focused and single-purpose

### Robot Framework Code

- Use meaningful test case names
- Add documentation to test cases and keywords
- Use tags for test categorization
- Follow the existing naming conventions
- Keep test cases independent and isolated

### Example Python Code

```python
class LoginPage(BasePage):
    """Page object for the Login page."""

    def __init__(self, driver):
        """Initialize login page."""
        super().__init__(driver)
        self.url = "https://the-internet.herokuapp.com/login"

    def login(self, username, password):
        """Login with credentials.
        
        Args:
            username: The username for login
            password: The password for login
        """
        self.send_keys(self.USERNAME_INPUT, username)
        self.send_keys(self.PASSWORD_INPUT, password)
        self.click_element(self.LOGIN_BUTTON)
```

### Example Robot Framework Code

```robot
*** Test Cases ***
Successful Login With Valid Credentials
    [Documentation]    Verify user can login with valid credentials
    [Tags]    login    positive
    Input Text With Wait    ${USERNAME_FIELD}    ${VALID_USERNAME}
    Input Text With Wait    ${PASSWORD_FIELD}    ${VALID_PASSWORD}
    Click Element With Wait    ${LOGIN_BUTTON}
    Verify Element Contains Text    ${SUCCESS_MESSAGE}    You logged into a secure area
```

## 🧪 Testing

### Running Tests

```bash
# Run all tests
robot --outputdir results tests/

# Run specific test suite
robot --outputdir results tests/test_login.robot

# Run tests by tag
robot --include login --outputdir results tests/
```

### Writing Tests

When adding new tests:

1. Create a page object in `pages/` directory
2. Add test cases in `tests/` directory
3. Use existing keywords from `resources/common_keywords.robot`
4. Add appropriate tags for test categorization
5. Ensure tests are independent and can run in isolation

### Test Coverage

- Aim for high test coverage
- Test both positive and negative scenarios
- Include edge cases and boundary conditions
- Test error handling and validation

## 📤 Pull Request Process

1. **Update Documentation**: Update README.md and other documentation if needed
2. **Add Tests**: Add tests for new features or bug fixes
3. **Run Tests**: Ensure all tests pass locally
4. **Format Code**: Run Black formatter on Python code
5. **Commit Changes**: Make clear, descriptive commit messages
6. **Push Changes**: Push to your fork
7. **Create Pull Request**: Create a PR with a clear description

### Pull Request Checklist

- [ ] Code follows project style guidelines
- [ ] Self-review of the code
- [ ] Commented complex code sections
- [ ] Updated documentation
- [ ] Added tests for new features
- [ ] All tests pass locally
- [ ] No new warnings introduced
- [ ] Commit messages are clear and descriptive

### Commit Message Format

```
type(scope): subject

body

footer
```

Types:
- `feat`: New feature
- `fix`: Bug fix
- `docs`: Documentation changes
- `style`: Code style changes (formatting, etc.)
- `refactor`: Code refactoring
- `test`: Adding or updating tests
- `chore`: Maintenance tasks

Example:
```
feat(login): add remember me functionality

Add remember me checkbox to login page and implement
the corresponding functionality in the login page object.

Closes #123
```

## 🎯 Project Structure Guidelines

### Adding New Page Objects

1. Create a new file in `pages/` directory
2. Inherit from `BasePage`
3. Define locators as class attributes
4. Implement page-specific methods
5. Add docstrings to all methods

### Adding New Test Suites

1. Create a new `.robot` file in `tests/` directory
2. Include necessary resources
3. Add suite setup and teardown
4. Write test cases with clear documentation
5. Use appropriate tags

### Adding New Keywords

1. Add to `resources/common_keywords.robot` if reusable
2. Add to specific test suite if not reusable
3. Include documentation
4. Handle errors appropriately
5. Use explicit waits

## 📋 Code Review Process

- All pull requests require review before merging
- Be constructive and respectful in feedback
- Address review comments promptly
- Request re-review after making changes

## 🎨 Style Guide

### Naming Conventions

- **Files**: `snake_case.robot` or `snake_case.py`
- **Classes**: `PascalCase`
- **Functions/Methods**: `snake_case`
- **Variables**: `${snake_case}` (Robot) or `snake_case` (Python)
- **Constants**: `UPPER_CASE`
- **Test Cases**: `Title Case With Spaces`

### Documentation

- Add docstrings to all Python functions and classes
- Add documentation to Robot Framework test cases and keywords
- Keep documentation clear and concise
- Update documentation when code changes

## 🌐 Language

- Use English for code comments and documentation
- Use English for commit messages and pull request descriptions

## 📞 Getting Help

If you need help:

- Check existing issues and discussions
- Read the documentation
- Ask questions in discussions
- Contact maintainers

## 📜 License

By contributing, you agree that your contributions will be licensed under the MIT License.

## 🙏 Thank You

Thank you for taking the time to contribute to this project! Your contributions help make this project better for everyone.
