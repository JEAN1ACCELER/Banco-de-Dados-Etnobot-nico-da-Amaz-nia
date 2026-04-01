# 🌿 Banco de Dados Etnobotânico da Amazônia

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Database: PostgreSQL](https://img.shields.io/badge/Database-PostgreSQL-316192)](https://www.postgresql.org/)
[![Version: 1.0](https://img.shields.io/badge/Version-1.0-blue)]()

## 📖 Sobre o Projeto

Este projeto consiste em um banco de dados estruturado sobre espécies vegetais da Amazônia e seus usos medicinais tradicionais. O banco de dados foi desenvolvido para organizar e consolidar informações etnobotânicas, permitindo a integração com artigos científicos, compostos ativos e indicações terapêuticas.

### 📊 Dados Iniciais

O banco de dados contém inicialmente **50 espécies amazônicas** com informações detalhadas sobre:
- Nome popular e científico
- Família botânica
- Parte utilizada
- Principais indicações medicinais

## 🗂️ Estrutura do Banco de Dados

O esquema foi modelado em **DBML (Database Markup Language)** e contempla as seguintes entidades:

### Entidades Principais

| Tabela | Descrição |
|--------|-----------|
| `especies` | Espécies vegetais com dados taxonômicos e usos medicinais |
| `artigos_cientificos` | Artigos científicos relacionados às espécies |
| `compostos_ativos` | Principais compostos químicos identificados |
| `usos_tradicionais` | Usos por comunidades e métodos tradicionais |
| `patologias` | Indicações terapêuticas normalizadas |
| `especies_patologias` | Relacionamento N:N entre espécies e patologias |

### 📐 Diagrama do Banco de Dados

## 🚀 Funcionalidades

### Consultas Possíveis

O banco de dados permite responder perguntas como:

- 🔍 **Quais artigos científicos existem sobre uma determinada espécie?**
- 📊 **Quais espécies têm evidência clínica para tratamento de diabetes?**
- 🧪 **Listar todos os compostos ativos isolados de espécies da família Fabaceae**
- 🌿 **Quais espécies são utilizadas por comunidades tradicionais para inflamações?**
- 📈 **Ranking das espécies com maior número de publicações científicas**
- 🔗 **Relações entre patologias e espécies utilizadas tradicionalmente**

### Exemplos de Consultas SQL

```sql
-- Listar todas as espécies com seus artigos científicos
SELECT 
    e.nome_popular,
    e.nome_cientifico,
    a.titulo,
    a.autores,
    a.ano_publicacao
FROM especies e
LEFT JOIN artigos_cientificos a ON e.id = a.especie_id
ORDER BY e.nome_popular;

-- Encontrar espécies com evidência para diabetes
SELECT 
    e.nome_popular,
    e.nome_cientifico,
    ep.nivel_eficacia,
    ep.observacao
FROM especies e
JOIN especies_patologias ep ON e.id = ep.especie_id
JOIN patologias p ON ep.patologia_id = p.id
WHERE p.nome_patologia ILIKE '%diabetes%';

-- Compostos ativos da família Fabaceae
SELECT 
    e.nome_popular,
    e.familia_botanica,
    c.nome_composto,
    c.classe_quimica,
    c.atividade_farmacologica
FROM especies e
JOIN compostos_ativos c ON e.id = c.especie_id
WHERE e.familia_botanica = 'Fabaceae';
