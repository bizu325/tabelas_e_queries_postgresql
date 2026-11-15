--------------------------------
--Importando os dados das tabelas:
-- nosso delimitador é a "," e o HEADER é true , pois temos o cabeçalho como primeira linha
-- quando copiar o caminho do arquivo trocar a posição das barras de "\" para "/"
--------------------------------
COPY drivers
FROM 'C:/Users/edina/Downloads/archive (1)/drivers.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');
--------------------------------
COPY trucks
FROM 'C:/Users/edina/Downloads/archive (1)/trucks.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');
--------------------------------
COPY trailers
FROM 'C:/Users/edina/Downloads/archive (1)/trailers.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');
--------------------------------
COPY customers
FROM 'C:/Users/edina/Downloads/archive (1)/customers.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');
--------------------------------
COPY facilities
FROM 'C:/Users/edina/Downloads/archive (1)/facilities.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');
--------------------------------
COPY routes
FROM 'C:/Users/edina/Downloads/archive (1)/routes.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');
--------------------------------
COPY loads
FROM 'C:/Users/edina/Downloads/archive (1)/loads.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');
--------------------------------
COPY trips
FROM 'C:/Users/edina/Downloads/archive (1)/trips.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');
--------------------------------
COPY fuel_purchases
FROM 'C:/Users/edina/Downloads/archive (1)/fuel_purchases.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');
--------------------------------
COPY delivery_events
FROM 'C:/Users/edina/Downloads/archive (1)/delivery_events.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');
--------------------------------
COPY safety_incidents
FROM 'C:/Users/edina/Downloads/archive (1)/safety_incidents.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',');
