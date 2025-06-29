WITH Recall_Events AS (
	SELECT 
		e.id AS event_id, 
        m.name_normalized AS manufacturer
	FROM events AS e
	JOIN devices d ON e.device_id = d.id
	JOIN manufacturers m ON m.id = d.manufacturer_id
	WHERE e.action_summary = 'Recall'
),
Recall_Counts AS (
	SELECT 
		manufacturer,
		COUNT(*) AS recall_count
	FROM Recall_Events
	GROUP BY manufacturer
),
Total AS (
	SELECT SUM(recall_count) AS total_recalls FROM Recall_Counts
)
SELECT 
	rc.manufacturer,
	rc.recall_count,
	ROUND((rc.recall_count / t.total_recalls) * 100, 2) AS percent_of_total
FROM Recall_Counts rc, Total t
where manufacturer != 'nan'
ORDER BY rc.recall_count DESC;
