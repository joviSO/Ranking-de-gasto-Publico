# Ranking-de-gasto-Publico

### Pré-requisitos

Antes de começar, você vai precisar ter instalado em sua máquina as seguintes ferramentas:
[Git](https://git-scm.com), [Ruby](https://www.ruby-lang.org/pt/), [Rbenv](https://github.com/rbenv/rbenv) ou [RMV] (https://rvm.io). 
Além disto é bom ter um editor para trabalhar com o código como [VSCode](https://code.visualstudio.com/)

Certifique-se que a versão do Ruby instalada seja a 3.0.0 
$ ruby -v

ou

$ rbenv versions

### 🎲 Rodando o Programa

```bash
# Clone este repositório
$ git clone <git@github.com:joviSO/Ranking-de-gasto-Publico.git>
$ git clone <https://github.com/joviSO/Ranking-de-gasto-Publico.git>

# Após o clone rode o bundle dentro da pasta do repositorio
$ cd Ranking-de-gasto-Publico
$ bundle install

# Rode o Yarn para rodar as dependências do JS
$ yarn install

# Iniciando o Servidor
$ rails s

# O servidor inciará na porta:3000 - acesse <127.0.0.1:3000>

# Acessando o Console do Programa
$ rails c

# Em que lugar encontro o CSV?
o CSV pode ser encontrado aqui (https://dadosabertos.camara.leg.br/swagger/api.html#staticfile)