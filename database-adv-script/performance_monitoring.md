EXPLAIN ANALYZE
SELECT * 
FROM Booking b
JOIN Users u ON b.user_id = u.user_id
JOIN Property p ON b.property_id = p.property_id
WHERE b.start_date >= CURRENT_DATE - INTERVAL '3 months'
ORDER BY b.start_date DESC;


"QUERY PLAN"
"Sort  (cost=58.28..58.89 rows=247 width=1948) (actual time=0.213..0.217 rows=20 loops=1)"
"  Sort Key: b.start_date DESC"
"  Sort Method: quicksort  Memory: 29kB"
"  ->  Hash Join  (cost=32.82..48.46 rows=247 width=1948) (actual time=0.129..0.149 rows=20 loops=1)"
"        Hash Cond: (b.property_id = p.property_id)"
"        ->  Hash Join  (cost=17.19..32.18 rows=247 width=1658) (actual time=0.072..0.085 rows=20 loops=1)"
"              Hash Cond: (b.user_id = u.user_id)"
"              ->  Bitmap Heap Scan on booking b  (cost=6.07..20.39 rows=247 width=82) (actual time=0.044..0.046 rows=20 loops=1)"
"                    Recheck Cond: (start_date >= (CURRENT_DATE - '3 mons'::interval))"
"                    Heap Blocks: exact=1"
"                    ->  Bitmap Index Scan on idx_booking_start_date  (cost=0.00..6.01 rows=247 width=0) (actual time=0.026..0.026 rows=20 loops=1)"
"                          Index Cond: (start_date >= (CURRENT_DATE - '3 mons'::interval))"
"              ->  Hash  (cost=10.50..10.50 rows=50 width=1576) (actual time=0.017..0.017 rows=20 loops=1)"
"                    Buckets: 1024  Batches: 1  Memory Usage: 11kB"
"                    ->  Seq Scan on users u  (cost=0.00..10.50 rows=50 width=1576) (actual time=0.012..0.013 rows=20 loops=1)"
"        ->  Hash  (cost=12.50..12.50 rows=250 width=290) (actual time=0.040..0.040 rows=20 loops=1)"
"              Buckets: 1024  Batches: 1  Memory Usage: 11kB"
"              ->  Seq Scan on property p  (cost=0.00..12.50 rows=250 width=290) (actual time=0.024..0.025 rows=20 loops=1)"
"Planning Time: 17.582 ms"
"Execution Time: 0.374 ms"


| Component                                     | Observation        | ✅ Insight                                       |
| --------------------------------------------- | ------------------ | ----------------------------------------------- |
| `Bitmap Index Scan on idx_booking_start_date` | ✅ Used your index  | Your `WHERE` clause is fast thanks to the index |
| `Execution Time: 0.374 ms`                    | ⚡ Very fast!       | Already highly optimized                        |
| `Sort Method: quicksort  Memory: 29kB`        | ✅ Small memory use | Efficient in-memory sorting                     |
| `Actual rows=20`                              | ✅ Small dataset    | No pressure on performance yet                  |
