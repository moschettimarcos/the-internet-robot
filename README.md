# Projeto The Internet Robot

Projeto profissional de automação para [the-internet.herokuapp.com](https://the-internet.herokuapp.com/) usando Robot Framework e Selenium WebDriver. Este projeto demonstra as melhores práticas em automação de testes, incluindo Page Object Model, keywords reutilizáveis e cobertura abrangente de testes.

## 🚀 Funcionalidades

- **Page Object Model**: Separação limpa entre lógica de página e casos de teste
- **Keywords Reutilizáveis**: Keywords comuns para implementação consistente de testes
- **Cobertura Abrangente**: Testes para múltiplos componentes e interações de UI
- **Estrutura Profissional**: Projeto bem organizado seguindo padrões da indústria
- **Pronto para CI/CD**: Workflow do GitHub Actions para execução automatizada de testes
- **Suporte Multi-Browser**: Configurado para Chrome (facilmente extensível para outros navegadores)

## 📋 Cobertura de Testes

O projeto inclui testes automatizados para as seguintes funcionalidades:

- **Autenticação de Formulário**: Login, logout e tratamento de erros
- **Checkboxes**: Seleção e desseleção de checkboxes
- **Dropdown**: Seleção de opções por texto, valor e índice
- **Controles Dinâmicos**: Adição/remoção de elementos e habilitar/desabilitar
- **Adicionar/Remover Elementos**: Manipulação dinâmica de elementos
- **Alerts JavaScript**: Interações de Alert, Confirm e Prompt
- **Pressionamento de Teclas**: Detecção de entrada de teclado
- **Inputs**: Input numérico e interações com teclas de seta
- **Hovers**: Interações de hover e exibição de legendas

## 🛠️ Stack Tecnológico

- **Robot Framework**: 7.0.1
- **SeleniumLibrary**: 6.4.0
- **Selenium WebDriver**: 4.23.1
- **Python**: 3.9+

## 📁 Estrutura do Projeto

```
the-internet-robot/
├── .github/
│   └── workflows/
│       └── ci.yml              # Pipeline CI/CD do GitHub Actions
├── pages/                      # Page Object Model
│   ├── __init__.py
│   ├── base_page.py           # Página base com métodos comuns
│   ├── login_page.py          # Objeto de página de login
│   ├── checkboxes_page.py     # Objeto de página de checkboxes
│   ├── dropdown_page.py       # Objeto de página de dropdown
│   ├── dynamic_controls_page.py
│   ├── add_remove_elements_page.py
│   ├── file_upload_page.py
│   ├── javascript_alerts_page.py
│   ├── key_presses_page.py
│   ├── inputs_page.py
│   └── hovers_page.py
├── resources/                  # Recursos do Robot Framework
│   ├── config.robot           # Variáveis de configuração
│   └── common_keywords.robot  # Keywords reutilizáveis
├── tests/                      # Suítes de testes
│   ├── test_login.robot
│   ├── test_checkboxes.robot
│   ├── test_dropdown.robot
│   ├── test_dynamic_controls.robot
│   ├── test_add_remove_elements.robot
│   ├── test_javascript_alerts.robot
│   ├── test_key_presses.robot
│   ├── test_inputs.robot
│   └── test_hovers.robot
├── results/                    # Resultados de execução de testes
├── screenshots/                # Screenshots de falhas
├── .gitignore
├── README.md
├── CONTRIBUTING.md
├── requirements.txt            # Dependências Python
├── pyproject.toml             # Configuração do projeto
└── robot.yaml                 # Configuração do Robot Framework
```

## 🚦 Pré-requisitos

- Python 3.9 ou superior
- pip (instalador de pacotes Python)
- Git

## 📦 Instalação

1. **Clone o repositório**
   ```bash
   git clone https://github.com/seu-usuario/the-internet-robot.git
   cd the-internet-robot
   ```

2. **Crie um ambiente virtual** (recomendado)
   ```bash
   python -m venv venv
   
   # No Windows
   venv\Scripts\activate
   
   # No macOS/Linux
   source venv/bin/activate
   ```

3. **Instale as dependências**
   ```bash
   pip install -r requirements.txt
   ```

4. **Instale o ChromeDriver** (se não estiver usando webdriver-manager)
   - Baixe o ChromeDriver em [ChromeDriver Downloads](https://chromedriver.chromium.org/downloads)
   - Adicione o ChromeDriver ao PATH do sistema

## 🎯 Executando Testes

### Executar Todos os Testes
```bash
robot --outputdir results tests/
```

### Executar Suíte de Testes Específica
```bash
robot --outputdir results tests/test_login.robot
```

### Executar Testes por Tag
```bash
# Executar apenas testes de login
robot --include login --outputdir results tests/

# Executar apenas testes positivos
robot --include positive --outputdir results tests/

# Executar apenas testes de funcionalidade específica
robot --include checkboxes --outputdir results tests/
```

### Executar Testes em Modo Headless
```bash
robot --variable HEADLESS:true --outputdir results tests/
```

### Executar Testes com Browser Específico
```bash
# Chrome (padrão)
robot --variable BROWSER:chrome --outputdir results tests/

# Firefox
robot --variable BROWSER:firefox --outputdir results tests/

# Edge
robot --variable BROWSER:edge --outputdir results tests/
```

### Gerar Relatório Detalhado
```bash
robot --outputdir results --loglevel DEBUG tests/
```

## 📊 Relatórios de Testes

Após a execução dos testes, relatórios são gerados no diretório `results/`:
- `log.html`: Log de execução detalhado
- `report.html`: Relatório resumido com estatísticas
- `output.xml`: Saída legível por máquina

## 🔧 Configuração

A configuração pode ser modificada em `robot.yaml`:
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

## 🤝 Contribuindo

Contribuições são bem-vindas! Por favor, leia [CONTRIBUTING.md](CONTRIBUTING.md) para detalhes sobre nosso código de conduta e o processo para enviar pull requests.

## 📝 Diretrizes de Desenvolvimento

### Adicionando Novos Testes

1. Crie um novo objeto de página no diretório `pages/`
2. Adicione casos de teste no diretório `tests/`
3. Use keywords existentes de `resources/common_keywords.robot`
4. Siga as convenções de nomenclatura existentes
5. Adicione tags apropriadas para categorização de testes

### Estilo de Código

- Use Black para formatação de código Python
- Siga as diretrizes PEP 8
- Adicione docstrings a todas as funções e classes
- Use nomes descritivos para variáveis e funções

### Melhores Práticas

- Use Page Object Model para interações de página
- Mantenha casos de teste independentes e isolados
- Use nomes significativos para testes e descrições
- Adicione tags apropriadas para categorização de testes
- Trate esperas adequadamente (esperas explícitas sobre implícitas)
- Tire screenshots em falhas de teste

## 🐛 Solução de Problemas

### Problemas com ChromeDriver
Se você encontrar problemas com ChromeDriver:
```bash
pip install --upgrade webdriver-manager
```

### Erros de Elemento Não Encontrado
- Aumente os tempos de espera em `robot.yaml`
- Verifique se os seletores estão corretos
- Verifique se a página está totalmente carregada

### Erros de Importação
- Certifique-se de que o ambiente virtual está ativado
- Verifique se todas as dependências estão instaladas
- Verifique se o caminho Python inclui o diretório do projeto

## 📄 Licença

Este projeto está licenciado sob a Licença MIT - veja o arquivo LICENSE para detalhes.

## 👤 Autor

**Marcos**
- GitHub: [@seu-usuario](https://github.com/seu-usuario)
- Portfolio: [seuportfolio.com](https://seuportfolio.com)

## 🙏 Agradecimentos

- [The Internet](https://the-internet.herokuapp.com/) por fornecer o aplicativo de teste
- Comunidade [Robot Framework](https://robotframework.org/)
- Equipe [Selenium](https://www.selenium.dev/)

## 📞 Contato

Para perguntas ou sugestões, por favor abra uma issue no GitHub ou entre em contato em [marcos@example.com](mailto:marcos@example.com).

---

**Nota**: Este projeto é destinado para fins educacionais e de portfolio. Ele demonstra práticas profissionais de automação de testes e pode ser usado como modelo para outros projetos de automação.
