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
