API de Gerenciamento de Tarefas

Esta é uma API desenvolvida em Ruby on Rails para gerenciar tarefas. Ele permite que os usuários se inscrevam e acessem a plataforma para criar, atualizar, excluir e pesquisar tarefas.
Instalação

Para instalar a API, execute os seguintes comandos:

shell

$ git clone <url do repositório>
$ cd <nome do diretório>
$ bundle install
$ rails db:migrate
$ rails server

Endpoints

Os endpoints disponíveis na API são:
Autenticação

    POST /users/sign_in: para fazer login com as credenciais de usuário.

Tarefas

    GET /tasks: para listar todas as tarefas.
    GET /tasks/:id: para buscar uma tarefa específica.
    POST /tasks: para criar uma nova tarefa.
    PUT /tasks/:id: para atualizar uma tarefa existente.
    DELETE /tasks/:id: para excluir uma tarefa.
    GET /search_result: para pesquisar tarefas por palavra-chave.

Modelo de Dados

O modelo de dados consiste em duas tabelas: users e tasks. Cada usuário pode ter várias tarefas. As colunas principais de cada tabela são:
Usuários

    email: e-mail do usuário.
    encrypted_password: senha criptografada do usuário.

Tarefas

    name: nome da tarefa.
    description: descrição da tarefa.
    due_date: data de vencimento da tarefa.
    status: status da tarefa (pendente, concluída ou expirada).
    owner_id: ID do usuário que criou a tarefa.

Validação

    A data de vencimento da tarefa não pode estar no passado.
    Se uma tarefa expirar, seu status será automaticamente alterado para "expirado".

Autor

Esta API foi desenvolvida por .