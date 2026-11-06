# Análise de Operações Logísticas com PostgreSQL(17.5)

## Sobre o projeto
Projeto de análise de dados de operações logísticas usando PostgreSQL: modelagem de tabelas, importação de CSV (Kaggle) e queries SQL para gerar insights. Projeto de portfólio.

## Fonte dos dados
Dataset: **Logistics Operations Database** (Kaggle) — (https://www.kaggle.com/datasets/yogape/logistics-operations-database)  
Contém dados de rotas, motoristas, acidentes, entre outros.  
Importação: Após baixar os dados do Kaggle, importei eles para as tabelas do pgAdmin usando o seguinte comando no query tool:  
COPY nome_tabela
FROM 'caminho/arquivo.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');

## Modelagem das tabelas
Para este projeto, utilizei as seguintes tabelas e colunas:
| Tabela | Colunas utilizadas | Descrição |
|---|---|---|
| safety_incidents | description, driver_id, vehicle_damage_cost, preventable_flag | Dados sobre os acidentes|
| drivers | driver_id, experience_years | Motoristas e tempo de experiência |

O Dataset contém mais tabelas e colunas(trucks,trailers,customers,etc), mas que não foram contempladas neste projeto.

## Análises

### Query 1 — Quantidade por tipo de acidente
Nesta query o objetivo era quantificar os tipos de acidentes e quantas vezes cada um tinha ocorrido. No total haviam 12 tipos de acidentes, destes os três com maior número de ocorrência foram: incidente moderado envolvendo o clima, incidente moderado envolvendo o trânsito e incidente grave envolvendo o clima. Os três somam 54 acidentes, eles são responsáveis por quase um terço(31,76%) do número total de 170.

### Query 2 — Mediana de experiência dos motoristas
Justificativa: usei a mediana em vez da média porque a distribuição de experiência é assimétrica, variando de 3 a 20+ anos e a média seria distorcida pelos outliers. Mediana = 13,5 anos.

### Query 3 — Custo dos acidentes evitáveis
Aqui foi realizada uma agregação somando os danos aos veículos que poderiam ser evitados para cada categoria de acidente, em seguida realizamos uma subquery para somar o valor total dos custos(US$ 509.102,24)

### Query 4 — Acidentes com motoristas acima da mediana de experiência
Dos 169 acidentes(um sem o id do motorista,não contado) ocorridos no período de 36 meses(Jan-2022 a Dez-2024, período que o conjunto de dados observa),97 ocorreram com motoristas que tinham 13,5 ou mais anos de experiência, totalizando 57,40%. Isso acaba sugerindo que experiência sozinha não é fator suficiente para evitar acidentes.

### Query 5 — Frequência e custo total por tipo de acidente
Os três tipos de acidentes que tiveram maior impacto financeiro(**Severe incident involving weather, Moderate incident involving equipment e Moderate incident involving weather**),dentre as 12 categorias somam juntos um gasto de  US$ 534.383,07, superando o custo total gastos com os acidentes evitáveis(lembrando que aqui contamos todos os tipos e não somente os evitáveis). As suas frequências foram respectivamente 18, 16 e 18 para cada tipo de acidente.

### Query 6 — Frequência e mediana de experiência por tipo de acidente
Novamente, utilizei a mediana para que não ocorresse distorção pelos outliers. Como utilizei um Join para juntar os dados das tabelas drivers e safety_incidents, um dos acidentes não havia dados do motoristas, fazendo com que ele não fosse contado pelo Join na categoria **Severe incident involving weather**.  
A query agrupa os acidentes por tipo, conta a quantidade de ocorrências em cada e traz uma mediana da experiência dos motoristas dessa categoria. 
Dos  12 tipos de acidentes, apenas quatro possuem mediana de experiência inferior a mediana geral(13,5),esses 4 tipos de acidentes foram responsáveis por 45 acidentes, totalizando 26,47% do total de acidentes.
| Tipo de acidente | Acidentes | Mediana |
|----|----|----|
| Minor incident involving traffic |	11 |	11 |
| Minor incident involving weather	| 10	| 12 |
| Severe incident involving equipment	| 12	| 11.5 |
| Severe incident involving traffic	| 12	| 10.5 |  

Os motoristas dos acidentes graves(Severe incident involving traffic),somam 12 acidentes e possuem uma mediana menor, o que nos permite afirmar que acidentes mais graves se concentram em motoristas menos experiêntes.

## Extração dos resultados
Os resultados foram exportados do psql com:  
\copy (SELECT ...) TO 'caminho/arquivo.csv' DELIMITER ',' CSV HEADER;

## Conclusão
Com base nos achados desta análise, conseguimos deduzir que duas das principais causas de acidentes foram as condições climáticas e que profissionais menos experiêntes estão envolvidos em mais acidentes graves. O que nos permite supor que são necessárias estratégias para mitigar os danos com os eventos climáticos e que é preciso aumentar o treinamentos com os profissionais menos experientes

 
