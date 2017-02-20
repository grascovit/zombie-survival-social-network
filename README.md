# Zombie Survival Social Network

[![Build Status](https://travis-ci.com/grascovit/zombie-survival-social-network.svg?token=eayXJNrAe9LbNAcpFGsz&branch=master)](https://travis-ci.com/grascovit/zombie-survival-social-network)

[Zombie Survival Social Network](https://gist.github.com/mauricioklein/1b1f279ad2d9cb42bcf0018e1cf05cfb)

### Inicialização
Execute na pasta raíz do projeto:
```
$ bundle install
$ rake db:create
$ rake db:migrate
$ rails s
```

### Testes
Para executar os testes da aplicação:
```
$ rake db:migrate RAILS_ENV=test
$ bundle exec rspec
```
Após a execução, será gerado um relatório com a cobertura detalhada dos casos de teste em `coverage/index.html`.

### Análise estática de código
O Rubocop é responsável pela análise estática do código, garantindo muitas das [guidelines](https://github.com/bbatsov/ruby-style-guide) previstas na comunidade.
Foi utilizado um conjunto de regras customizadas que estão dispostas em `.rubocop.yml`.
Para executar a análise:
```
Checagem de código:
    $ rubocop
Autofix:
    $ rubocop -a
```