--5- contando a quantidade de acidentes para cada categoria e seus respectivos custos:
SELECT
description, COUNT(*),SUM(vehicle_damage_cost) AS total_custo_danos
FROM safety_incidents
GROUP BY description;


-- Ordenando de forma decrescente para descobrir os três com os maiores custos
SELECT
description, COUNT(*),SUM(vehicle_damage_cost) AS total_custo_danos
FROM safety_incidents
GROUP BY description
ORDER BY total_custo_danos DESC;
