SELECT * FROM house_rank_db.houses;
SELECT COUNT(*) FROM characters;
SELECT
    h.house_id,
    h.house_name,
    SUM(c.influence) AS sum_influence,
    SUM(c.military_strength) AS sum_military_strength,
    SUM(c.wealth) AS sum_wealth,
    SUM(CASE WHEN c.alive = 'TRUE' THEN 1 ELSE 0 END) AS alive_count,
    SUM(c.alliances) AS alliances_total,
    (
        0.5 * SUM(c.influence)
      + 0.3 * SUM(c.military_strength)
      + 0.2 * SUM(c.wealth)
      + 10 * SUM(CASE WHEN c.alive = 'TRUE' THEN 1 ELSE 0 END)
      + 5 * SUM(c.alliances)
    ) AS projected_power_score
FROM characters c
JOIN houses h
  ON c.house_id = h.house_id
GROUP BY h.house_id, h.house_name
ORDER BY projected_power_score DESC;
SELECT
    *,
    RANK() OVER (ORDER BY projected_power_score DESC) AS `rank`
FROM (
    SELECT
        h.house_id,
        h.house_name,
        SUM(c.influence) AS sum_influence,
        SUM(c.military_strength) AS sum_military_strength,
        SUM(c.wealth) AS sum_wealth,
        SUM(CASE WHEN c.alive = 'TRUE' THEN 1 ELSE 0 END) AS alive_count,

        SUM(c.alliances) AS alliances_total,
        (
            0.5 * SUM(c.influence)
          + 0.3 * SUM(c.military_strength)
          + 0.2 * SUM(c.wealth)
          + 10 * SUM(CASE WHEN c.alive = 'TRUE' THEN 1 ELSE 0 END)
          + 5 * SUM(c.alliances)
        ) AS projected_power_score
    FROM characters c
    JOIN houses h
      ON c.house_id = h.house_id
    GROUP BY h.house_id, h.house_name
) t
ORDER BY projected_power_score DESC;

SELECT alive, COUNT(*) AS cnt
FROM characters
GROUP BY alive;
SELECT
    house_id,
    COUNT(*) AS alive_count
FROM characters
WHERE alive = 'TRUE'
GROUP BY house_id
ORDER BY house_id;
SELECT
    `ï»¿character_id`,
    name,
    alive
FROM characters
WHERE house_id = 3;



