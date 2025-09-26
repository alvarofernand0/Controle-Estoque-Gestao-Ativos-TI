# 📈 Controle de Estoque com Gestao de Ativos de TI

## 📌 Requisitos Funcionais
  🔹 Módulo de Autenticação e Usuários
    •	O sistema deve permitir login e logout de usuários.
    •	O sistema deve possuir diferentes perfis de acesso (ex.: Administrador, Estoquista, Técnico de TI, Auditor, Serviços Gerais).
    •	O sistema deve registrar histórico de ações de cada usuário (log de auditoria).
  🔹 Controle de Estoque (nível macro)
    •	O sistema deve permitir cadastrar itens de estoque (nome, categoria, fabricante, fornecedor, quantidade mínima e máxima, localização).
    •	O sistema deve registrar entradas de estoque (compra, devolução, transferência).
    •	O sistema deve registrar saídas de estoque (uso interno, entrega a colaborador, descarte).
    •	O sistema deve permitir consultar saldo atual do estoque.
    •	O sistema deve emitir alertas quando um item atingir o estoque mínimo.
    •	O sistema deve permitir a geração de relatórios de movimentação (entradas, saídas, saldo atual).
  
  🔹 Gestão de Ativos de TI (nível detalhado)
    •	O sistema deve permitir cadastrar ativos de TI individualmente com informações como:
    •	• Código de patrimônio
    •	• Número de série
    •	• Data de aquisição e valor
    •	• Garantia e depreciação
    •	• Status (em uso, em estoque, em manutenção, baixado)
    •	• Usuário responsável
    •	• Localização (filial, departamento, sala)
    •	O sistema deve registrar a movimentação do ativo (ex.: transferência de setor, troca de responsável).
    •	O sistema deve permitir vincular cada ativo a um colaborador.
    •	O sistema deve controlar licenças de software (quantidade adquirida, quantidade em uso, data de expiração).
    •	O sistema deve gerar inventário automático de ativos (por setor, usuário, tipo de ativo).
    •	O sistema deve permitir registrar histórico de manutenção (preventiva e corretiva).
    •	O sistema deve permitir o registro de baixas de ativos (por descarte, doação, venda, obsolescência).
  
  🔹 Gestão de Materiais de Limpeza
    •	O sistema deve permitir cadastrar materiais de limpeza com informações como:
    •	• Nome do item
    •	• Categoria (detergente, desinfetante, papel, etc.)
    •	• Fabricante e fornecedor
    •	• Unidade de medida (litros, unidades, pacotes, caixas)
    •	• Quantidade mínima e máxima em estoque
    •	• Local de armazenamento (almoxarifado, setor específico)
    •	O sistema deve registrar entradas de materiais de limpeza (compra, doação, reposição).
    •	O sistema deve registrar saídas de materiais de limpeza (entrega para setores, consumo interno).
    •	O sistema deve emitir alertas de estoque baixo.
    •	O sistema deve permitir a geração de relatórios de consumo de materiais de limpeza por período e por setor.
    •	O sistema deve permitir calcular a previsão de reposição com base no consumo histórico.
  
  🔹 Relatórios e Dashboards
    •	O sistema deve gerar relatórios de inventário de TI.
    •	O sistema deve gerar relatórios de depreciação de ativos.
    •	O sistema deve gerar relatórios de consumo de materiais de limpeza.
    •	O sistema deve permitir visualizar um painel com indicadores, como:
    • Quantidade de ativos em uso / em estoque
    • Ativos próximos do fim da garantia
    • Licenças de software expirando
    • Estoque crítico (TI e limpeza)
    • Consumo médio mensal de materiais de limpeza
  
## 📌 Requisitos Não Funcionais
  •	O sistema deve ser responsivo e acessível via desktop e dispositivos móveis.
  •	O sistema deve permitir integração com planilhas (importação/exportação em CSV/XLSX).
  •	O sistema deve ter autenticação segura (senha forte, opção de MFA).
  •	O sistema deve ter capacidade de escalabilidade para suportar aumento de itens no estoque (TI e limpeza).
  •	O sistema deve permitir filtros e buscas rápidas por categoria de item (TI, limpeza, outros).

