-- -----------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- -----------------------------------------------------------------------------------
DECLARE
  CURSOR c_extents IS
    SELECT d.name,
           t.block_id AS start_block,
           t.block_id + t.blocks - 1 AS end_block
    FROM   v$temp_extent_map t,
           v$tempfile d
    WHERE  t.file_id = d.file#
    AND    t.tablespace_name = Upper('&1')
    ORDER BY d.name, t.block_id;
    
  l_last_block_id  NUMBER  := 0;
  l_gaps_only      BOOLEAN := TRUE;
BEGIN
  FOR cur_rec IN c_extents LOOP
    IF cur_rec.start_block > l_last_block_id + 1 THEN
      DBMS_OUTPUT.PUT_LINE('*** GAP *** (' || l_last_block_id || ' -> ' || cur_rec.start_block || ')');
    END IF;
    l_last_block_id := cur_rec.end_block;
    IF NOT l_gaps_only THEN
      DBMS_OUTPUT.PUT_LINE(RPAD(cur_rec.name, 50, ' ') || 
                           ' (' || cur_rec.start_block || ' -> ' || cur_rec.end_block || ')');
    END IF;
  END LOOP;
END;
/

PROMPT
SET FEEDBACK ON
SET PAGESIZE 18


