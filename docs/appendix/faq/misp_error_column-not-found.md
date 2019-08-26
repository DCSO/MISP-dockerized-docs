# Errors like Error: [PDOException] SQLSTATE[42S22]: Column not found: 1054 Unknown column

##Problem

If you get errors like:

- `Error: [PDOException] SQLSTATE[42S22]: Column not found: 1054 Unknown column 'xxx' in 'where clause'` (Where xxx will be replaced through an column name)


## What happened exactly

One of the problem can be that MISP changed their database scheme, which will be changed after the first login to the page.

But the MySQL **ALTER TABLE command will copy the full table**, then it adds the column, then it will replace the new table with the old one. (This requires disk space...)

To look how much space is required please look with the MySQL cli:
`select table_name, sum((data_length+index_length)/1024/1024) AS MB from information_schema.tables where table_schema = 'misp' group by table_name;`

Compare this with your free space with your shell:
`df -h`


## Solution

1. Increase the file space
2. Clear the caches -> https://github.com/MISP/MISP/issues/5027#issuecomment-523323123
3. Try it one more time

## Known Sources

- https://github.com/MISP/MISP/issues/5027


