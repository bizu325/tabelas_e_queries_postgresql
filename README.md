# Análise de Operações Logísticas com PostgreSQL

## Sobre o projeto
Projeto de análise de dados de operações logísticas usando PostgreSQL:
modelagem de tabelas, importação de CSV (Kaggle) e queries SQL para
gerar insights. Projeto de portfólio.

## Fonte dos dados
Dataset: **Logistics Operations Database** (Kaggle) — (https://www.kaggle.com/datasets/yogape/logistics-operations-database)  
Contém dados de rotas, motoristas, acidentes, entre outros.  
Importação:Após baixar os dados do Kaggle, importei eles para as tabelas do pgadmin usando o comando:  
COPY nome_tabela
FROM "caminho/arquivo.csv"
WITH (FORMAT csv, HEADER true, DELIMITER ',');

## Modelagem das tabelas
Para este projeto, utilizei as seguintes tabelas e colunas:
| Tabela | Colunas utilizadas | Descrição |
|---|---|---|
| safety_incidents | description, vehicle_damage_cost, preventable_flag | Dados sobre os acidentes|
| drivers | driver_id, experience_years | Motoristas e tempo de experiência |

O Dataset contém mais tabelas e colunas(trucks,trailers,customers,etc) , mas que não foram contempladas neste projeto.

## Análises

### Query 1 — Quantidade por tipo de acidente
Nesta query o objetivo era quantificar os tipos de acidentes e quantas vezes cada um tinha ocorrido. No total haviam 12 tipos de acidentes, destes os três com maior número de ocorrência foram: incidente moderado envolvendo o clima, incidente moderado envolvendo o trânsito e incidente grave envolvendo o clima. Os três somam 54 acidentes, eles são responsáveis por quase um terço(31,76%) do número total de acidentes 170.

### Query 2 — Mediana de experiência dos motoristas
Justificativa: usei a mediana em vez de média porque a distribuição de experiência é assimétrica variando de 3 a 20+ anos e a média seria distorcida pelos outliers. Mediana = 13,5 anos.

### Query 3 — Custo de acidentes evitáveis
Aqui foi realizada uma agregação somando o danos as veículos que poderiam ser evitados para cada categoria de acidente, em seguida realizamos uma outra consulta para somar o valor total dos danos(US$509.102,24)

### Query 4 — Acidentes com motoristas acima da mediana de experiência
Dos 170 acidentes ocorridos no período de 24 meses(jan- 2022 a dez-2024),100 ocorreram com motoristas que tinham mais que 13,5 anos de experiência, totalizando 58,8%. Isso acaba sugerindo que experiência sozinha não é fator protetor.

### Query 5 — Frequência e custo total por tipo de acidente
Objetivo: priorizar tipos de acidente com maior impacto financeiro.

### Query 6 — Frequência e mediana de idade por tipo de acidente
Objetivo: identificar se algum tipo está associado a faixas etárias
específicas.

## Extração dos resultados
Os resultados foram exportados do psql com:
\copy (SELECT ...) TO 'caminho/arquivo.csv' DELIMITER ',' CSV HEADER;

## Conclusão
[1–2 frases de síntese]

 
