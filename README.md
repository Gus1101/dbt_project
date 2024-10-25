# DBT northwind

## Visão Geral
Este projeto utiliza o **dbt** (Data Build Tool) para transformar e modelar dados de [Fonte de Dados] em um formato analítico e pronto para análise. O dbt permite criar, testar e documentar o pipeline de transformação de dados, com práticas recomendadas e versionamento de código.

## Estrutura do Projeto
Abaixo está a estrutura básica do projeto:

- `models/`: Contém os modelos dbt, que são as transformações SQL organizadas em subpastas.
  - `staging/`: Modelos de _staging_ (pré-transformação) que carregam dados brutos para o Data Warehouse.
  - `silver/`: Modelos intermediários com transformações e limpezas adicionais.
  - `gold/`: Modelos finais que fornecem dados prontos para análise.

- `seeds/`: Arquivos de dados estáticos (CSV) que podem ser carregados como tabelas.

- `snapshots/`: Configurações de _snapshots_ para capturar o histórico de alterações nos dados.

- `macros/`: Contém as macros para modularizar e reutilizar SQL.

- `tests/`: Testes de qualidade dos dados.

## Pré-requisitos
- Python 3.8+
- dbt >= 0.21.0
- Data Warehouse compatível (Ex.: Snowflake, Redshift, Postgres)