# Teste Synergia Rails
Uma aplicação simples para testar as habilidades com Ruby on Rails.

##### Configuração
O teste deve ser feito utilizando:
- Rails 4.2.0 +
- Ruby 2.2.0 +

##### Procedimento
Fazer um fork do projeto, e ao finalizar fazer um pull request para o repositório original.

##### Prazo de entrega
2 dias a partir do recebimento do teste por email. Faça um pull request, mesmo que não tenha finalizado tudo 100%, gostariamos de analisar o seu código de qualquer forma.

##### Descrição da tarefa:
Um cliente precisa de uma aplicação para controle de estoque dos seus produtos. Ele pode ter um mesmo produto em diferentes tamanhos e cores.

Por exemplo, ele pode ter no estoque:
- 5 peças da Camiseta X, na cor preta, tamanho P
- 2 peças da Camiseta X, na cor preta, tamanho M
- 3 peças da Camiseta X, na cor preta, tamanho G
- 7 peças da Camiseta X, na cor azul, tamanho M
- 1 peça da Camiseta Y, na cor braca, tamanho M

Etc...

##### O que você irá fazer:
Precisamos de uma tela onde seja possível cadastrar um produto com nome e descrição, e relacionar novas cores, tamanhos e quantidade **em um único formulário utilizando Nested Forms**. Após o cadastro, temos que ter uma tela onde listar os produtos disponíveis em cada combinação de tamanho e cor.

Cor e tamanho não precisa ter CRUD, apenas crie os modelos e popule com alguns dados de teste para serem relacionados ao produto (Pode ser um arquivo de seed).

##### Exemplo de banco de dados
![Alt text](https://bitbucket.org/sis_synergia/teste-rails/raw/ac154f3965918b60b10b5c9e7421b5b10936e8fb/public/Teste_Synergia.png)

##### Requisitos
- Escrever testes de model e controller utilizando RSpec ou MiniTest. (Nosso projeto atual usa RSpec)
- Não utilizar o scaffold. Mostre sua habilidade em criar views, controllers, models, sem usar scaffold.
- Organização e legibilidade do código
- Se utilizar gems, listar quais gems foram utilizadas, e para qual finalidade

##### Bônus
- Usar bootstrap para formatar as páginas de cadastro
- Utilizar SimpleForm
- Utilizar Docker (docker-compose) para subir o banco com a aplicação em containers separados
