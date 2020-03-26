-- ------------------------------------------------------------------------------------
-- Hazırlayan       : Bugra Parlayan
-- Web              : www.bugraparlayan.com.tr
-- ------------------------------------------------------------------------------------

SELECT Sum(Decode(a.name, 'consistent gets', a.value, 0)) "Consistent Gets",
       Sum(Decode(a.name, 'db block gets', a.value, 0)) "DB Block Gets",
       Sum(Decode(a.name, 'physical reads', a.value, 0)) "Physical Reads",
       Round(((Sum(Decode(a.name, 'consistent gets', a.value, 0)) +
         Sum(Decode(a.name, 'db block gets', a.value, 0)) -
         Sum(Decode(a.name, 'physical reads', a.value, 0))  )/
           (Sum(Decode(a.name, 'consistent gets', a.value, 0)) +
             Sum(Decode(a.name, 'db block gets', a.value, 0))))
             *100,2) "Hit Ratio %"
FROM   v$sysstat a;
