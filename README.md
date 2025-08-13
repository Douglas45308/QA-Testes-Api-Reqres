# Automação de API Reqres com Robot Framework

Projeto de automação de testes para a API Reqres usando Robot Framework com padrão Page Object.

## Pré-requisitos
- Python 3.8+
- Pip

## Instalação
```bash
pip install -r requirements.txt
```

## Execução dos testes
```bash
# Todos os testes
robot features/api/
robot -d results features-api (gera relatório html)

# Testes específicos por tag
robot --include SMOKE features/api/
robot --include REGISTER features/api/
robot --include GET features/api/
```

## Estrutura do Projeto
- `features/`: Casos de teste organizados por funcionalidade
- `features/steps/`: Passos dos testes em linguagem natural
- `pages/`: Page Objects com implementação das chamadas API
- `variables/`: Configurações e dados fixos

## Tags disponíveis
- SMOKE: Testes críticos
- REGISTER: Testes de cadastro
- GET: Testes de consulta
- NEGATIVE: Testes de cenários negativos