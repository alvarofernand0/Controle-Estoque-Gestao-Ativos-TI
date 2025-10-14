**Descrição do Sistema de Controle de Estoque com Gestão de Ativos de TI**



**GERAL**



* O sistema possui controle de acesso de usuários. Cada usuário do sistema tem um perfil de acesso que determina as permissões para ações que o usuário pode executar no sistema. O sistema deve ter um histórico de ações que usuário realizou.



* Os Perfis de acesso podem ser: Administrador, Estoquista, Técnico de TI, Auditor, Serviços Gerais.



* A empresa tem filiais, onde estão lotados os colaboradores e por sua vez os Ativos de TI, que podem ser hardwares como computadores ou softwares como licenças por exemplo. Cada filial tem departamentos e salas.



* Colaboradores tem um cargo, está em um departamento, em uma filial. Colaboradores podem ter várias movimentações ligadas a ele, que podem ser movimentações de Materiais de Limpeza, no caso de zeladores e serviços gerais ou Ativos de Ti, que é quando um Ativo (ex: Computador, Teclado, Mouse) é cedido ao colaborador pela empresa para que este desempenhe suas funções.



**MATERIAIS DE LIMPEZA**



* Ativos de TI e Materiais de limpeza são entidades distintas pois Materiais são itens de Estoque e Ativos são Individuais e possuem campos distintos. Em Materiais deve-se registrar o estoque atual e mínimo, local de armazenamento (Almoxarifado, Depósito, Dispensa ou Setor Específico), a categoria do Material (Desinfetante, Detergente, Papel higiênico, Sabão, Sabonete e etc). Unidade de medida (Litros, Unidades, Pacotes, Caixas, e etc).



* O sistema deve registrar Movimentações de Materiais de Limpeza como Entrada (Ex: Compra, Doação, Reposição) e Saída (Ex: Entrega para Setor, Consumo Interno, Descarte).





**ATIVOS de TI**



* Ativos de TI, Sistema deve permitir cadastra-los individualmente, e deve ter informações como: Cod. de Patrimônio, N° Serie, Data Aquisição e valor, Garantia e Depreciação, Status (Em uso, Em estoque, Em Manutenção, Baixado), Usuário Solicitante pelo pedido no sistema e Colaborador Responsável pelo Item (Caso em estoque, o campo de colaborador será nulável). Localização (Filial, Departamento, Sala). Ativos podem ser não tangíveis (Softwares e Licenças) e o sistema deve controlar (Quantidade Adquirida, Quantidade Em Uso, Data de Expiração),



* O sistema deve registrar Movimentações de Ativos de TI como (Transferência de Setor, Troca de Colaborador Responsável).



* O sistema deve Gerar Inventário automático de Ativos (Por setor, Por Usuário, Por Tipo de Ativo).



* O sistema deve permitir registrar histórico de Manutenção dos Ativos de TI (Manutenção Preventiva ou Corretiva).



* O sistema deve permitir o registro de baixas de ativos (Por descarte, doação, venda, obsolescência).
