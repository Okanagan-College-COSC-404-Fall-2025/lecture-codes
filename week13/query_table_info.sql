-- describe all_indexes;

SELECT index_name, visibility, tablespace_name, BLevel, Leaf_Blocks
FROM all_indexes
WHERE table_name = 'FACULTY';
