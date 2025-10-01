CREATE DATABASE ControleEstoqueGestaoAtivos;
GO

USE ControleEstoqueGestaoAtivos;
GO

CREATE TABLE CategoriaAtivos (
	Id SMALLINT IDENTITY,
	Nome VARCHAR(15) NOT NULL,

	CONSTRAINT PK_CategoriaAtivos PRIMARY KEY (Id)
);
GO

CREATE TABLE Filial (
	Id INTEGER IDENTITY,
	Nome VARCHAR(50) NOT NULL,

	CONSTRAINT PK_Filial PRIMARY KEY (Id)
);
GO

CREATE TABLE Departamento (
	Id SMALLINT IDENTITY,
	Nome VARCHAR(60) NOT NULL,

	CONSTRAINT PK_Departamento PRIMARY KEY (Id)
);
GO

CREATE TABLE Cargo (
	Id INTEGER IDENTITY,
	Nome VARCHAR(60) NOT NULL,

	CONSTRAINT PK_Cargo PRIMARY KEY (Id)
);
GO

CREATE TABLE Colaborador (
	Id INTEGER IDENTITY,
	IdCargo INTEGER NOT NULL,
	IdDepartamento SMALLINT NOT NULL,
	IdFilial INTEGER NOT NULL,
	Nome VARCHAR(100) NOT NULL,
	Cpf CHAR(11) NOT NULL,

	CONSTRAINT PK_Colaborador PRIMARY KEY (Id),
	CONSTRAINT FK_Colaborador_Cargo FOREIGN KEY(IdCargo) REFERENCES Cargo (Id),
	CONSTRAINT FK_Colaborador_Departamento FOREIGN KEY(IdDepartamento) REFERENCES Departamento (Id),
	CONSTRAINT FK_Colaborador_Filial FOREIGN KEY(IdFilial) REFERENCES Filial (Id),
	CONSTRAINT UK_Colaborador_Cpf UNIQUE (Cpf)
);
GO

CREATE TABLE Perfil (
	Id INTEGER IDENTITY,
	Nome VARCHAR(80) NOT NULL,
	Descricao VARCHAR(300) NOT NULL,

	CONSTRAINT PK_Perfil PRIMARY KEY (Id),
);
GO

CREATE TABLE Usuario (
	Id INTEGER IDENTITY,
	Nome VARCHAR(100) NOT NULL,
	Email VARCHAR(255) NOT NULL,
	SenhaHash VARCHAR(255) NOT NULL,
	Ativo BIT NOT NULL,
	UsuarioAlteracao VARCHAR(60),
	DataAlteracao DATETIME,

	CONSTRAINT PK_Usuario PRIMARY KEY (Id),
	CONSTRAINT UK_Usuario_Email UNIQUE (Email)
);
GO

CREATE TABLE UsuarioPerfil (
	IdUsuario INTEGER NOT NULL,
	IdPerfil INTEGER NOT NULL,

	CONSTRAINT FK_UsuarioPerfil_Usuario FOREIGN KEY (IdUsuario) REFERENCES Usuario (Id),
	CONSTRAINT FK_UsuarioPerfil_Perfil FOREIGN KEY (IdPerfil) REFERENCES Perfil (Id)
);
GO

CREATE TABLE Fornecedor (
	Id INTEGER IDENTITY,
	Nome VARCHAR(100) NOT NULL,
	Cnpj CHAR(14) NOT NULL,

	CONSTRAINT PK_Fornecedor PRIMARY KEY (Id),
	CONSTRAINT UK_Fornecedor_Cnpj UNIQUE (Cnpj)
);
GO

CREATE TABLE Fabricante (
	Id INTEGER IDENTITY,
	Nome VARCHAR(100) NOT NULL,
	Cnpj CHAR(14) NOT NULL,

	CONSTRAINT PK_Fabricante PRIMARY KEY (Id),
	CONSTRAINT UK_Fabricante_Cnpj UNIQUE (Cnpj)
);
GO

CREATE TABLE CategoriaMaterial (
	Id SMALLINT IDENTITY,
	Nome VARCHAR(30) NOT NULL,

	CONSTRAINT PK_CategoriaMaterial PRIMARY KEY (Id)
);
GO

CREATE TABLE LocalArmazenamento (
	Id INTEGER IDENTITY,
	Nome VARCHAR(40) NOT NULL,

	CONSTRAINT PK_LocalArmazenamento PRIMARY KEY (Id)
);
GO

CREATE TABLE Material (
	Id INTEGER IDENTITY,
	IdCategoriaMaterial SMALLINT NOT NULL,
	IdFornecedor INTEGER NOT NULL,
	IdFabricante INTEGER NOT NULL,
	IdLocalArmazenamento INTEGER NOT NULL,
	Nome VARCHAR(100) NOT NULL,
	UnidadeMedida VARCHAR(15) NOT NULL,
	EstoqueAtual SMALLINT NOT NULL,
	EstoqueMinimo SMALLINT NOT NULL,
	EstoqueMaximo SMALLINT NOT NULL,

	CONSTRAINT PK_Material PRIMARY KEY (Id),
	CONSTRAINT FK_Material_CategoriaMaterial FOREIGN KEY (IdCategoriaMaterial) REFERENCES CategoriaMaterial (Id),
	CONSTRAINT FK_Material_Fornecedor FOREIGN KEY (IdFornecedor) REFERENCES Fornecedor (Id),
	CONSTRAINT FK_Material_Fabricante FOREIGN KEY (IdFabricante) REFERENCES Fabricante (Id),
	CONSTRAINT FK_Material_LocalArmazenamento FOREIGN KEY (IdLocalArmazenamento) REFERENCES LocalArmazenamento (Id),
	CONSTRAINT CK_Material_EstoqueAtual CHECK (EstoqueAtual < EstoqueMinimo AND EstoqueAtual > EstoqueMaximo)
);
GO

CREATE TABLE StatusAtivo (
	Id SMALLINT IDENTITY,
	Nome VARCHAR(30) NOT NULL,

	CONSTRAINT PK_StatusAtivo PRIMARY KEY (Id)
);
GO

CREATE TABLE AtivosTi (
	Id INTEGER IDENTITY,
	IdColaboradorResponsavel INTEGER,
	IdCategoriaAtivos SMALLINT NOT NULL,
	IdFabricante INTEGER NOT NULL,
	IdFornecedor INTEGER NOT NULL,
	IdStatusAtivo SMALLINT NOT NULL,
	Nome VARCHAR(100) NOT NULL,
	CodigoPatrimonio VARCHAR(100) NOT NULL,
	NumeroSerie VARCHAR(100) NOT NULL,
	DataAquisicao DATE NOT NULL,
	ValorAquisicao DECIMAL(10,2) NOT NULL,
	DataFimGarantia DATE,

	CONSTRAINT PK_AtivosTi PRIMARY KEY (Id),
	CONSTRAINT FK_AtivosTi_Colaborador FOREIGN KEY (IdColaboradorResponsavel) REFERENCES Colaborador (Id),
	CONSTRAINT FK_AtivosTi_CategoriaAtivos FOREIGN KEY (IdCategoriaAtivos) REFERENCES CategoriaAtivos (Id),
	CONSTRAINT FK_AtivosTi_Fabricante FOREIGN KEY (IdFabricante) REFERENCES Fabricante (Id),
	CONSTRAINT FK_AtivosTi_Fornecedor FOREIGN KEY (IdFornecedor) REFERENCES Fornecedor (Id),
	CONSTRAINT FK_AtivosTi_StatusAtivo FOREIGN KEY (IdStatusAtivo) REFERENCES StatusAtivo (Id),
	CONSTRAINT UK_AtivosTi_CodigoPatrimonio UNIQUE (CodigoPatrimonio),
	CONSTRAINT UK_AtivosTi_NumeroSerie UNIQUE (NumeroSerie)
);
GO

CREATE TABLE TipoMovimentacao (
	Id SMALLINT IDENTITY,
	Nome VARCHAR(30) NOT NULL,

	CONSTRAINT PK_TipoMovimentacao PRIMARY KEY (Id)
);
GO

CREATE TABLE Movimentacao (
	Id INTEGER IDENTITY,
	IdTipoMovimentacao SMALLINT NOT NULL,
	IdUsuarioSolicitante INTEGER NOT NULL,
	IdMaterial INTEGER,
	IdAtivoTi INTEGER,
	IdColaboradorOrigem INTEGER,
	IdColaboradorDestino INTEGER,
	DataMovimentacao DATETIME NOT NULL,
	Justificativa VARCHAR(500) NOT NULL,
	Quantidade SMALLINT,
	
	CONSTRAINT PK_Movimentacao PRIMARY KEY (Id),
	CONSTRAINT FK_Movimentacao_TipoMovimentacao FOREIGN KEY (IdTipoMovimentacao) REFERENCES TipoMovimentacao (Id),
	CONSTRAINT FK_Movimentacao_Usuario FOREIGN KEY (IdUsuarioSolicitante) REFERENCES Usuario (Id),
	CONSTRAINT FK_Movimentacao_Material FOREIGN KEY (IdMaterial) REFERENCES Material (Id),
	CONSTRAINT FK_Movimentacao_AtivosTi FOREIGN KEY (IdAtivoTi) REFERENCES AtivosTi (Id),
	CONSTRAINT FK_Movimentacao_ColaboradorOrigem FOREIGN KEY (IdColaboradorOrigem) REFERENCES Colaborador (Id),
	CONSTRAINT FK_Movimentacao_ColaboradorDestino FOREIGN KEY (IdColaboradorDestino) REFERENCES Colaborador (Id)
);
GO

CREATE TABLE LicencaSoftware (
	Id INTEGER IDENTITY,
	NomeSoftware VARCHAR(255) NOT NULL,
	ChaveProduto VARCHAR(255) NOT NULL,
	DataExpiracao DATE NOT NULL,

	CONSTRAINT PK_LicencaSoftware PRIMARY KEY (Id)
);
GO

CREATE TABLE LicencaAtivo (
	IdLicencaSoftware INTEGER NOT NULL,
	IdAtivoTi INTEGER NOT NULL,

	CONSTRAINT FK_LicencaAtivo_LicencaSoftware FOREIGN KEY (IdLicencaSoftware) REFERENCES LicencaSoftware (Id),
	CONSTRAINT FK_LicencaAtivo_AtivosTi FOREIGN KEY (IdAtivoTi) REFERENCES AtivosTi (Id)
);
GO

CREATE TABLE Manutencao (
	Id INTEGER IDENTITY,
	IdAtivoTi INTEGER NOT NULL,
	TipoManutencao VARCHAR(20) NOT NULL,
	DataInicio DATE NOT NULL,
	DataFim DATE,
	DescricaoProblema VARCHAR(1000) NOT NULL,
	DescricaoServicoRealizado VARCHAR(1000),
	Custo DECIMAL(10,2) NOT NULL,

	CONSTRAINT PK_Manutencao PRIMARY KEY (Id),
	CONSTRAINT FK_Manutencao_AtivosTi FOREIGN KEY (IdAtivoTi) REFERENCES AtivosTi (Id)
);
GO
