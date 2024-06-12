-- name: FindTxnInVssNotMqt :many
WITH vssTxn_counts AS (
    SELECT amount, COUNT(*) AS cnt
    FROM vssTxn
    GROUP BY amount
),
mqtTxn_counts AS (
    SELECT purchases AS amount, COUNT(*) AS cnt
    FROM mqtTxn
    GROUP BY purchases
),
excess_in_vss AS (
    SELECT vtc.amount
    FROM vssTxn_counts vtc
    LEFT JOIN mqtTxn_counts mtc
    ON vtc.amount = -mtc.amount
    WHERE vtc.cnt > COALESCE(mtc.cnt, 0)
)
SELECT
    vt.*
FROM
    vssTxn vt
JOIN
    excess_in_vss eiv
ON
    vt.amount = eiv.amount;