CREATE TABLE `especies` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `nome_popular` varchar(100) NOT NULL,
  `nome_cientifico` varchar(150) NOT NULL,
  `familia_botanica` varchar(100),
  `parte_utilizada` text,
  `principal_indicacao` text,
  `descricao` text COMMENT 'Descrição detalhada da espécie, características e habitat',
  `propriedades_farmacologicas` text COMMENT 'Principais compostos ativos e propriedades medicinais',
  `modo_preparo` text COMMENT 'Formas de preparo tradicional (chá, maceração, etc.)',
  `contraindicacoes` text COMMENT 'Contraindicações e efeitos colaterais conhecidos',
  `status_conservacao` varchar(50) COMMENT 'Status de conservação (IUCN, etc.)',
  `imagem_url` text COMMENT 'URL da imagem da espécie',
  `created_at` timestamp DEFAULT (now()),
  `updated_at` timestamp DEFAULT (now())
);

CREATE TABLE `artigos_cientificos` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `especie_id` integer NOT NULL,
  `titulo` varchar(500) NOT NULL,
  `autores` text NOT NULL,
  `ano_publicacao` integer,
  `revista_periodico` varchar(300),
  `volume` varchar(50),
  `numero` varchar(50),
  `paginas` varchar(50),
  `doi` varchar(100) UNIQUE COMMENT 'Digital Object Identifier',
  `url` text COMMENT 'Link para o artigo completo',
  `resumo` text,
  `palavras_chave` text,
  `tipo_estudo` varchar(100) COMMENT 'ex: Revisão, Ensaio Clínico, Etnobotânico, Fitoquímico',
  `nivel_evidencia` varchar(50) COMMENT 'Alto, Médio, Baixo, Preliminar',
  `principais_resultados` text COMMENT 'Principais achados do estudo',
  `created_at` timestamp DEFAULT (now()),
  `updated_at` timestamp DEFAULT (now())
);

CREATE TABLE `compostos_ativos` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `especie_id` integer,
  `nome_composto` varchar(150) NOT NULL,
  `classe_quimica` varchar(100) COMMENT 'ex: Terpenoide, Alcaloide, Flavonoide',
  `estrutura_quimica` text COMMENT 'SMILES ou descrição estrutural',
  `parte_planta_origem` varchar(100),
  `atividade_farmacologica` text,
  `referencia_bibliografica` varchar(300)
);

CREATE TABLE `usos_tradicionais` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `especie_id` integer,
  `indicacao_uso` text NOT NULL,
  `parte_utilizada` varchar(100),
  `metodo_preparo` text,
  `dosagem_uso` text,
  `comunidade_etnia` varchar(150) COMMENT 'Comunidade ou etnia que utiliza',
  `regiao_origem` varchar(150),
  `referencia_etnobotanica` text
);

CREATE TABLE `patologias` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `nome_patologia` varchar(150) UNIQUE NOT NULL,
  `categoria` varchar(100) COMMENT 'ex: Inflamação, Infecção, Dor',
  `descricao` text,
  `codigo_cid` varchar(20) COMMENT 'Código CID-10 relacionado'
);

CREATE TABLE `especies_patologias` (
  `id` integer PRIMARY KEY AUTO_INCREMENT,
  `especie_id` integer,
  `patologia_id` integer,
  `nivel_eficacia` varchar(50) COMMENT 'Evidência científica da eficácia',
  `observacao` text
);

CREATE TABLE `especies_initial_data` (
  `id` integer,
  `nome_popular` varchar(100),
  `nome_cientifico` varchar(150),
  `familia_botanica` varchar(100),
  `parte_utilizada` text,
  `principal_indicacao` text
);

CREATE UNIQUE INDEX `especies_index_0` ON `especies` (`nome_cientifico`);

CREATE INDEX `especies_index_1` ON `especies` (`nome_popular`);

CREATE INDEX `especies_index_2` ON `especies` (`familia_botanica`);

CREATE INDEX `artigos_cientificos_index_3` ON `artigos_cientificos` (`especie_id`);

CREATE UNIQUE INDEX `artigos_cientificos_index_4` ON `artigos_cientificos` (`doi`);

CREATE INDEX `artigos_cientificos_index_5` ON `artigos_cientificos` (`ano_publicacao`);

CREATE INDEX `artigos_cientificos_index_6` ON `artigos_cientificos` (`tipo_estudo`);

CREATE INDEX `compostos_ativos_index_7` ON `compostos_ativos` (`especie_id`);

CREATE INDEX `compostos_ativos_index_8` ON `compostos_ativos` (`nome_composto`);

CREATE INDEX `usos_tradicionais_index_9` ON `usos_tradicionais` (`especie_id`);

CREATE INDEX `usos_tradicionais_index_10` ON `usos_tradicionais` (`indicacao_uso`);

CREATE INDEX `patologias_index_11` ON `patologias` (`nome_patologia`);

CREATE INDEX `patologias_index_12` ON `patologias` (`categoria`);

CREATE UNIQUE INDEX `especies_patologias_index_13` ON `especies_patologias` (`especie_id`, `patologia_id`);

ALTER TABLE `artigos_cientificos` ADD FOREIGN KEY (`especie_id`) REFERENCES `especies` (`id`);

ALTER TABLE `compostos_ativos` ADD FOREIGN KEY (`especie_id`) REFERENCES `especies` (`id`);

ALTER TABLE `usos_tradicionais` ADD FOREIGN KEY (`especie_id`) REFERENCES `especies` (`id`);

ALTER TABLE `especies_patologias` ADD FOREIGN KEY (`especie_id`) REFERENCES `especies` (`id`);

ALTER TABLE `especies_patologias` ADD FOREIGN KEY (`patologia_id`) REFERENCES `patologias` (`id`);
