## Improvement

1. Add index related fields on JOIN query.
2. Add index to soft delete column 'deleted'
3. Create fulltext index on columns that need to be searched
4. Avoid using wildcards at the beginning of a predicate such as `jobcategories.NAME LIKE '​%キャビンアテンダント%'`. Using `​WHERE LIKE @キャビンアテンダント%'` is a lot faster than using `%キャビンアテンダント%`
5. Remove unused join
6. Instead of using LIMIT with offset, use final row as the starting point for next page query. For example, if the user viewed row 1 to 100, select row 101 too and select rows greater or equal to 101 limit 100.