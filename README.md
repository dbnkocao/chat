![Logo of the project](https://github.com/dbnkocao/blob/master/public/readme_images/logo.png)
## Chat

Esse projeto foi produzido durante o bootcamp do [onebitcode](https://onebitcode.com/), é uma ferramenta para comunicação entre equipes, um clone do slack, porém mais simples.


## Tecnologias

Tecnologias usadas nesse projeto.

* Ruby version  2.7.1
* Rails version 6.0.2
* Postgresql 12
* Redis


## Ruby Gems
* devise
* cancancan
* redis

## Deploy

* Para instalar as gems:
  >    $ bundle install
* Para criar a base de dados e a estrutura do banco de dados:
  >    $ rake db:create db:migrate db:seed
* Subindo o projeto:
  >    $ rails s

## Deploy usando Docker e Docker Compose

  > docker-compose run --rm website bundle install

  > docker-compose run --rm website yarn install

  > docker-compose run --rm website bundle exec rake db:create db:migrate

  > docker-compose up -d

## Como Usar
### Entrando no sistema
![login](https://raw.githubusercontent.com/dbnkocao/chat/master/public/readme_images/login.png)

### Criando novo usuário
![siign up](https://raw.githubusercontent.com/dbnkocao/chat/master/public/readme_images/signup.png)

### Criando um novo time
![new team](https://raw.githubusercontent.com/dbnkocao/chat/master/public/readme_images/new_team.png)

### Criando um novo canal
![new channel](https://raw.githubusercontent.com/dbnkocao/chat/master/public/readme_images/new_channel.png)

### Adicionando usuário ao time
![adding user](https://raw.githubusercontent.com/dbnkocao/chat/master/public/readme_images/add_user.png)

### Conversando através de canais
![channel_conversation](https://raw.githubusercontent.com/dbnkocao/chat/master/public/readme_images/channel_conversation.png)

### Conversando com um usuário específico
![private_coversation](https://raw.githubusercontent.com/dbnkocao/chat/master/public/readme_images/private_conversation.png)

## Funcionalidades
  - Possibilidade de criar inúmeros times.
  - Canais ilimitados para os times.
  - Adicão de usuários a times.
  - Conversas separadas por canais.
  - Conversas privadas entre usuários.

## Links
  * Repository: (https://github.com/dbnkocao/chat)

## Authors
* **Daniel Nascimento**: @dbnkocao (https://github.com/dbnkocao)
