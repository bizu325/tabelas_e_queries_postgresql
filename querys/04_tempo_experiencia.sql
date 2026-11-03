--4- descobrir se quanto maior o tempo de experiência(usando a mediana) menor a quantidade de acidentes

SELECT
  COUNT(*)                         AS total_acidentes,        -- acidentes
  COUNT(DISTINCT d.driver_id)      AS motoristas_distintos    -- IDs únicos
FROM drivers d
JOIN safety_incidents s ON d.driver_id = s.driver_id
WHERE d.years_experience > 13.5;
