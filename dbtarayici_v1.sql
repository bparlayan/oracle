Prompt	
Prompt ***************************************************************** 
Prompt Oracle Database Genel Kontrol Script                            *
Prompt Hazirlayan : Bugra Parlayan - Oracle Ace Associate 	        *
Prompt https://www.bugraparlayan.com.tr                                *
Prompt https://twitter.com/BugraParlayan                               *
Prompt https://www.linkedin.com/in/bugraparlayan                       *
Prompt https://github.com/bparlayan/oracle                             *
Prompt Bu script serbestce kullanilabilir.Herhangi bir telif vb.       * 
Prompt unsuru bulunmamaktadir.		 			        *
Prompt *****************************************************************

Prompt	
Prompt *****  Oracle Database kontrolu basliyor  ******


SET TERMOUT OFF
SET RECSEP WRAPPED

SET MARKUP HTML ON SPOOL ON PREFORMAT OFF ENTMAP ON -
HEAD '<TITLE>ORACLE DATABASE 12C / 18C / 19C Kontrol Script | Bugra Parlayan</TITLE> -
<STYLE type="text/css">-
td.sev0 { -
    background-color:#00ff00; -
    border-collapse:collapse; -
    border:1px solid #8DA6B1; -
    margin:20px; -
} -
td.sev1 { -
    background-color:#cccccc; -
    border-collapse:collapse; -
    border:1px solid #8DA6B1; -
    margin:20px; -
} -
td.sev2 { -
    background-color:#00bfff; -
    border-collapse:collapse; -
    border:1px solid #8DA6B1; -
    margin:20px; -
} -
td.sev3 { -
    background-color:#ffff00; -
    border-collapse:collapse; -
    border:1px solid #8DA6B1; -
    margin:20px; -
} -
td.sev4 { -
    background-color:#ffa500; -
    border-collapse:collapse; -
    border:1px solid #8DA6B1; -
    margin:20px; -
} -
td.sev5 { -
    background-color:#f80000; -
    border-collapse:collapse; -
    border:1px solid #8DA6B1; -
    margin:20px; -
} -
table { -
    font-family: Lucida Sans Unicode, Lucida Grande, Sans-Serif; -
    font-size:14px; -
    border-collapse:collapse; -
    border:1px solid #8DA6B1; -
    margin:20px; -
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19); -
} -
} -
thead { -
    background-color: #eeeeee; -
    font-weight:normal; -
    color:black; -
    border-bottom:3px double grey; -
    padding:12px 17px -
} -
tfoot { -
    background-color: #eeeeee; -
} -
h1 { -
    font-family: Lucida Sans Unicode, Lucida Grande, Sans-Serif; -
    text-align: center; -
} -
h2 { -
    font-family: Lucida Sans Unicode, Lucida Grande, Sans-Serif; -
    text-decoration: underline; -
} -
h3 { -
    font-family: Lucida Sans Unicode, Lucida Grande, Sans-Serif; -
} -
p { -
    font-family: Lucida Sans Unicode, Lucida Grande, Sans-Serif; -
} -
pre { -
    margin: 0; -
} -
p.footnote { -
    font-size: 12px -
} -
table.finding { -
    font-family:Lucida Sans Unicode, Lucida Grande, Sans-Serif; -
    font-size:14px; -
    border-collapse:collapse; -
    border:1px solid #8DA6B1; -
    margin:20px; -
    width:1600px; -
} -
tr.ruleid { -
    font-size:10px; -
    background-color: #eeeeee; -
    border-collapse:collapse; -
    border:1px solid #8DA6B1; -
    margin:20px; -
    text-align:left; -
    font-weight:bold; -
} -
td.number { -
    text-align: right; -
} -
td.total { -
    text-align: right; -
    font-weight: bold; -
} -
td.finding_head { -
    text-align: left; -
    vertical-align: top; -
    font-weight: bold; -
    width: 100px; -
} -
td.finding_cell { -
    text-align: left; -
    vertical-align: top; -
} -
td.childrow { -
    padding-left: 20px; -
} -
a.home { -
    width: 30px; -
    height: 22px; -
    line-height:20px; -
    position: fixed; -
    text-indent: 7px; -
    z-index: 999; -
    right: 50px; -
    bottom: 25px; -
    background: #dddddd no-repeat center 43%; -
    font-family: Lucida Sans Unicode, Lucida Grande, Sans-Serif; -
    font-size:10px; -
    color: black; -
    cursor:pointer; -
    webkit-border-radius: 30px; -
    moz-border-radius: 30px; -
    border-radius: 10px; -
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19); -
} -
</STYLE>'-

column filename new_val filename
select name||'_KONTROL_'||to_char(sysdate, 'ddmmyyyy' )||'.html' filename from dual , v$database;
spool &filename

set define off

SET MARKUP HTML   OFF

prompt <table class="finding" cellpadding="4" border="0" role="presentation">
prompt <tr class="ruleid"><td></td>
prompt <td> Oracle Database Genel Durum</td>
prompt <td colspan="2">
prompt </td>
prompt </tr><tr>
prompt <td class="sev4" colspan="4"></td>
prompt </tr>
prompt <tr><td></td>
prompt <td class="finding_head">Rapor</td> <td class="finding_cell"> Oracle Database version bilgisi </td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Neyi inceliyoruz ?</td>
prompt <td class="finding_cell">Bu bölüm database sürümünü ve genel bilgileri göstermektedir. <pre>
prompt </pre></td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Detaylar</td>
prompt <td class="finding_cell">
prompt <br>
prompt <br>
prompt Oracle Database Version Bilgisi
prompt <br>

SET MARKUP HTML   ON

SELECT BANNER "DATABASE VERSION" from v$version;

SET MARKUP HTML   OFF

prompt <br>
prompt Mevcut Instance ve DB durum bilgileri
prompt <br>


SET MARKUP HTML   ON


SELECT to_char(SYSDATE,'dd-mm-yyyy hh24:mi') RAPOR_TARIHI,
       SUBSTR (host_name, 1, 20) HOSTNAME,
       name "DB NAME",
       database_role ROLE,
       SUBSTR (open_mode, 1, 10) "OPEN MODE",
       SUBSTR (db_unique_name, 1, 10) "UNIQU ENAME"
  FROM v$database, v$instance;

SET MARKUP HTML   OFF

prompt <br>
prompt Oracle Database üzerinde kurulu Companent bilgileri
prompt <br>


SET MARKUP HTML   ON

SELECT
	COMP_ID,
	COMP_NAME,
	VERSION,
	STATUS,
	MODIFIED
FROM
	DBA_REGISTRY
ORDER BY
	COMP_ID;

SET MARKUP HTML   OFF

prompt <br>
prompt Oracle Database Enterprise üzerinde yüklü olan patch bilgileri
prompt <br>


SET MARKUP HTML   ON


SELECT *
    FROM DBA_REGISTRY_HISTORY
ORDER BY action_time DESC;

SET MARKUP HTML   OFF
prompt <br>
prompt Cluster Database durum bilgisi
prompt <br>
SET MARKUP HTML   ON

select
   name,
   value
from
   v$parameter
where
   name='cluster_database';
SET MARKUP HTML   OFF

prompt <br>
prompt Oracle Database Protection Mode bilgisi
prompt <br>

SET MARKUP HTML   ON

SELECT
	PROTECTION_MODE
FROM
	V$DATABASE;

SET MARKUP HTML   OFF

prompt </td><td></td></tr>
prompt <tr><td></td>
prompt </table>

prompt <table class="finding" cellpadding="4" border="0" role="presentation">
prompt <tr class="ruleid"><td></td>
prompt <td> KULLANICI LISTELERI</td>
prompt <td colspan="2">
prompt </td>
prompt </tr><tr>
prompt <td class="sev4" colspan="4"></td>
prompt </tr>
prompt <tr><td></td>
prompt <td class="finding_head">Rapor</td> <td class="finding_cell">Oracle Database üzerindeki tüm kullanicilar </td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Neyi inceliyoruz ?</td>
prompt <td class="finding_cell">Hesaplarin nasil acildigi, standartlara uygun olup olmadigi<pre>
prompt </pre></td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Detaylar</td>
prompt <td class="finding_cell">Bu alanda Oracle Database üzerindeki hesap ve bu hesaplara durum bilgileri listelenmektedir. <b>ACCOUNT_STATUS = OPEN</b> olan hesaplar incelenmeli, eger kullanilmiyorsa <b>LOCK</b> konumuna getirilmeli yada silinmelidir.
prompt <br>
prompt <br>
prompt <br>
prompt <b>USERNAME : </b>Database üzerindeki aktif / pasif tüm kullanicilar.
prompt <br>
prompt <b>ACCOUNT_STATUS :</b>Kullanicilarin aktif durumlari.
prompt <br>
prompt <b>EXPIRY_DAT : </b>Ilgili hesaplarin son kullaným tarihi.
prompt <br>
prompt <b>CREATED : </b>Hesabin oluþturulma tarihi.
prompt <br>
prompt <b>LAST_LOGIN : </b>Hesabin son giriþ tarihi.
prompt <br>
prompt <b>LAST_CHANG : </b>Hesap üzerinde yetkili tarafindan son yapilan degisiklik.
prompt <br>
prompt <b>PASSWORD_VERSIONS : </b>Hesabin parola versionu.
prompt <br>
prompt <b>DEFAULT_TABLESPACE : </b>Hesabin kullandigi tablesapce.
prompt <br>
prompt <b>TEMPORARY_TABLESPACE : </b>Hesabin kullandigi TEMP tablespace.
prompt <br>

SET MARKUP HTML   ON

SELECT
	USERNAME,
	ACCOUNT_STATUS,
	TO_CHAR(EXPIRY_DATE,'DD-MM-YYYY') EXPIRY_DATE,
	TO_CHAR(CREATED,'DD-MM-YYYY')CREATED,
	TO_CHAR(LAST_LOGIN,'DD-MM-YYYY') LAST_LOGIN,
	TO_CHAR(PASSWORD_CHANGE_DATE,'DD-MM-YYYY') LAST_CHANGE,
	PASSWORD_VERSIONS,
	DEFAULT_TABLESPACE,
	TEMPORARY_TABLESPACE
FROM
	DBA_USERS
ORDER BY
	ACCOUNT_STATUS DESC , USERNAME ASC;

SET MARKUP HTML   OFF

prompt </td><td></td></tr>
prompt <tr><td></td>
prompt </table>


prompt <table class="finding" cellpadding="4" border="0" role="presentation">
prompt <tr class="ruleid"><td></td>
prompt <td>Son 30gün</td>
prompt <td colspan="2">
prompt </td>
prompt </tr><tr>
prompt <td class="sev4" colspan="4"></td>
prompt </tr>
prompt <tr><td></td>
prompt <td class="finding_head">Rapor</td> <td class="finding_cell">Son 30 günde giris yapmayan kullanicilar.</td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Neyi inceliyoruz ?</td>
prompt <td class="finding_cell">Bu bölüm Oracle Database üzerinde son 30 günde giris yapmayan kullanicilar listelenmektedir.<pre>
prompt </pre></td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Detaylar</td>
prompt <td class="finding_cell">Gerek yazdigimiz kurallar , gerekse sirket politikalai geregi belli bir zamandan içerisinde giris yapmayan kullanýcilarin <b>LOCK</b> konuma alinmasi gerekir. Asagida <b>Son 30 gün </b> içerisinde giris yapmayan kullanicilar listelenmektedir.
prompt <br>
prompt <br>

SET MARKUP HTML   ON

SELECT USERNAME,
       PASSWORD_VERSIONS,
       ACCOUNT_STATUS,
       LAST_LOGIN
  FROM DBA_USERS
 WHERE ACCOUNT_STATUS = 'OPEN' AND LAST_LOGIN < SYSDATE - 30;

SET MARKUP HTML   OFF

prompt </td><td></td></tr>
prompt <tr><td></td>
prompt </table>

prompt <table class="finding" cellpadding="4" border="0" role="presentation">
prompt <tr class="ruleid"><td></td>
prompt <td>Hic giris yapmayanlar</td>
prompt <td colspan="2">
prompt </td>
prompt </tr><tr>
prompt <td class="sev4" colspan="4"></td>
prompt </tr>
prompt <tr><td></td>
prompt <td class="finding_head">Rapor</td> <td class="finding_cell">Oracle Database üzerinde hic giris yapmayan kullanicilar </td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Neyi inceliyoruz ?</td>
prompt <td class="finding_cell">Bu bölüm Oracle Database üzerinde hiç giris yapmamis kullancilarin durumlarini belirlemektedir. <pre>
prompt </pre></td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Detaylar</td>
prompt <td class="finding_cell">Kullandiginiz database üzerinde hic giris yapmamis kullanicilar bulunuyorsa bunlarin <b>LOCK</b> konumuna getirilmesi yada teyit alinarak silinmesi gerekmektedir..
prompt <br>

SET MARKUP HTML   ON

SELECT USERNAME,PASSWORD_VERSIONS,ACCOUNT_STATUS,LAST_LOGIN FROM DBA_USERS WHERE ACCOUNT_STATUS ='OPEN' AND LAST_LOGIN IS NULL;

SET MARKUP HTML   OFF

prompt </td><td></td></tr>
prompt <tr><td></td>
prompt </table>

prompt <table class="finding" cellpadding="4" border="0" role="presentation">
prompt <tr class="ruleid"><td></td>
prompt <td>Oracle Database User Password Version</td>
prompt <td colspan="2">
prompt </td>
prompt </tr><tr>
prompt <td class="sev4" colspan="4"></td>
prompt </tr>
prompt <tr><td></td>
prompt <td class="finding_head">Rapor</td> <td class="finding_cell">Oracle Database üzerinde Password Version 10G olan kullanicilar </td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Neyi inceliyoruz ?</td>
prompt <td class="finding_cell">Bu bölüm Oracle Database üzerinde acilmis fakat Password Version 10G kalan kullanicilar listelenmektedir. <pre>
prompt </pre></td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Detaylar</td>
prompt <td class="finding_cell">Upgrade edilien bir database üzerinde zamanla eski hesaplarin Password Version'lari <b>10G</b> kalmis olabilir. Bunlarin <b>10G 11G 12C</b> olarak gözükmesi gerekir.
prompt <br>
prompt <br>

SET MARKUP HTML   ON

SELECT USERNAME,PASSWORD_VERSIONS,ACCOUNT_STATUS,LAST_LOGIN FROM DBA_USERS WHERE ACCOUNT_STATUS ='OPEN' AND PASSWORD_VERSIONS='10G';

SET MARKUP HTML   OFF

prompt </td><td></td></tr>
prompt <tr><td></td>
prompt </table>


prompt <table class="finding" cellpadding="4" border="0" role="presentation">
prompt <tr class="ruleid"><td></td>
prompt <td>v$controlfile</td>
prompt <td colspan="2">
prompt </td>
prompt </tr><tr>
prompt <td class="sev4" colspan="4"></td>
prompt </tr>
prompt <tr><td></td>
prompt <td class="finding_head">Rapor</td> <td class="finding_cell">Oracle Database Control File </td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Neyi inceliyoruz ?</td>
prompt <td class="finding_cell">Bu bölüm veritabani üzerindeki controlfile dosyalari listenmektedir. <pre>
prompt </pre></td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Detaylar</td>
prompt <td class="finding_cell">Oracle Database ilk baslarken <b>Veritabani adi</b> , <b>Veritabani olusturulma tarihi</b> , <b>Datafile konumlari</b> ve <b>Redolog kayitlari</b> gibi kritik bilgiler içermektedir. Veritabani kurulurken minumum <b>2</b> adet olusturulmali,yedeklilik için <b>2</b> farkli konumlarda tutulmalidir. Her iki controlfile bir aksilik olamasi için <b>STATUS=CURRENT</b> olmalidir.
prompt <br>
prompt <br>

SET MARKUP HTML   ON

SELECT name, status FROM v$controlfile;

SET MARKUP HTML   OFF

prompt </td><td></td></tr>
prompt <tr><td></td>
prompt </table>



prompt <table class="finding" cellpadding="4" border="0" role="presentation">
prompt <tr class="ruleid"><td></td>
prompt <td>Optimal Undo</td>
prompt <td colspan="2">
prompt </td>
prompt </tr><tr>
prompt <td class="sev4" colspan="4"></td>
prompt </tr>
prompt <tr><td></td>
prompt <td class="finding_head">Rapor</td> <td class="finding_cell">Optimal Undo </td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Neyi inceliyoruz ?</td>
prompt <td class="finding_cell">Bu bölüm veritabani üzerindeki optimal undo parametresini kontrol etmektedir. <pre>
prompt </pre></td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Detaylar</td>
prompt <td class="finding_cell">Veritabaninda Optimal undo ayarlari düzgün yapilmazsa UNDO_RETENTION <b>ORA-01555 (Snapshot too old)</b> hatasi döndürür asagida <b>OPTIMUM_UNDO_RETENTION</b> parametresi olmasi gereken degeri <b>UNDO_RETENTION</b> kayitli olan deðeri vermektedir. Bu deger ilk kurulumda <b>900</b> saniye olarak gelmektedir.
prompt <br>
prompt <br>

SET MARKUP HTML   ON

SELECT d.undo_size / (1024 * 1024) AS UNDO_SIZE,
       SUBSTR (e.VALUE, 1, 25)     AS UNDO_RETENTION,
       ROUND ( (d.undo_size / (TO_NUMBER (f.VALUE) * g.undo_block_per_sec)))
           AS OPTIMUM_UNDO_RETENTION
  FROM (SELECT SUM (a.bytes) undo_size
          FROM v$datafile a, v$tablespace b, dba_tablespaces c
         WHERE     c.contents = 'UNDO'
               AND c.status = 'ONLINE'
               AND b.name = c.tablespace_name
               AND a.ts# = b.ts#) d,
       v$parameter  e,
       v$parameter  f,
       (SELECT MAX (undoblks / ( (end_time - begin_time) * 3600 * 24))
                   undo_block_per_sec
          FROM v$undostat) g
 WHERE e.name = 'undo_retention' AND f.name = 'db_block_size';

SET MARKUP HTML   OFF

prompt </td><td></td></tr>
prompt <tr><td></td>
prompt </table>

prompt <table class="finding" cellpadding="4" border="0" role="presentation">
prompt <tr class="ruleid"><td></td>
prompt <td>Online Redolog</td>
prompt <td colspan="2">
prompt </td>
prompt </tr><tr>
prompt <td class="sev4" colspan="4"></td>
prompt </tr>
prompt <tr><td></td>
prompt <td class="finding_head">Rapor</td> <td class="finding_cell">Oracle Database Online Redolog Dosyalari </td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Neyi inceliyoruz ?</td>
prompt <td class="finding_cell">Bu bölümde Online Redolog dosyalari incelenmektedir. <pre>
prompt </pre></td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Detaylar</td>
prompt <td class="finding_cell">Online Redolog dosyalari veritabanimiz icin hayati önem tasir. <b>Standalone bir database icin minimum 3</b> ve <b>Cluster bir database icin node basina minimum 3 </b> adet olmasi gerekir. Redolog dosyalarinin boyutlari ayrica kontrol edilmelidir.
prompt <br>
prompt <br>

SET MARKUP HTML   ON

select GROUP#,TYPE,MEMBER from v$logfile;

SET MARKUP HTML   OFF

prompt </td><td></td></tr>
prompt <tr><td></td>
prompt </table>

prompt <table class="finding" cellpadding="4" border="0" role="presentation">
prompt <tr class="ruleid"><td></td>
prompt <td>Invalid Objeler</td>
prompt <td colspan="2">
prompt </td>
prompt </tr><tr>
prompt <td class="sev4" colspan="4"></td>
prompt </tr>
prompt <tr><td></td>
prompt <td class="finding_head">Rapor</td> <td class="finding_cell">Oracle Database invalid objeler </td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Neyi inceliyoruz ?</td>
prompt <td class="finding_cell">Bu bölüm veritabaný üzerindeki invalid objeler incelenmektedir.. <pre>
prompt </pre></td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Detaylar</td>
prompt <td class="finding_cell">Oracle Database üzerinde mümkün mertebe invalid obje olmamasi gerekir.Asagida database üzerindeki invalid objeler listelenmistir. Kullanilmayanlar kaldirilmasi  yada verdigi hatalar incelenerek tekrar compile edilmelidir.
prompt <br>
prompt <br>

SET MARKUP HTML   ON

SELECT owner,
       object_name,
       subobject_name,
       status
  FROM dba_objects
 WHERE status = 'INVALID';

SET MARKUP HTML   OFF

prompt </td><td></td></tr>
prompt <tr><td></td>
prompt </table>

prompt <table class="finding" cellpadding="4" border="0" role="presentation">
prompt <tr class="ruleid"><td></td>
prompt <td>Log Switch Frequency</td>
prompt <td colspan="2">
prompt </td>
prompt </tr><tr>
prompt <td class="sev4" colspan="4"></td>
prompt </tr>
prompt <tr><td></td>
prompt <td class="finding_head">Rapor</td> <td class="finding_cell">Redolog Log Switch Frequency</td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Neyi inceliyoruz ?</td>
prompt <td class="finding_cell">Bu bölüm Online Redolog dosyalarinin saatlik olarak Log Switch Frequency haritasini göstermektedir.. <pre>
prompt </pre></td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Detaylar</td>
prompt <td class="finding_cell">Oracle Database belli zamanlarda Redolog üzerine kayit isler. Redolog dosyalari her doldugunda yada farkli sebepler ile switch edilir. Saatlik olarak tavsiye edilen adet <b> 5 </b> olarak öngörülür.
prompt <br>
prompt <br>

SET MARKUP HTML   ON

SELECT TRUNC (first_time) "Date", inst_id, TO_CHAR (first_time, 'Dy') "Day",
 COUNT (1) "Total",
 SUM (DECODE (TO_CHAR (first_time, 'hh24'), '00', 1, 0)) "00",
 SUM (DECODE (TO_CHAR (first_time, 'hh24'), '01', 1, 0)) "01",
 SUM (DECODE (TO_CHAR (first_time, 'hh24'), '02', 1, 0)) "02",
 SUM (DECODE (TO_CHAR (first_time, 'hh24'), '03', 1, 0)) "03",
 SUM (DECODE (TO_CHAR (first_time, 'hh24'), '04', 1, 0)) "04",
 SUM (DECODE (TO_CHAR (first_time, 'hh24'), '05', 1, 0)) "05",
 SUM (DECODE (TO_CHAR (first_time, 'hh24'), '06', 1, 0)) "06",
 SUM (DECODE (TO_CHAR (first_time, 'hh24'), '07', 1, 0)) "07",
 SUM (DECODE (TO_CHAR (first_time, 'hh24'), '08', 1, 0)) "08",
 SUM (DECODE (TO_CHAR (first_time, 'hh24'), '09', 1, 0)) "09",
 SUM (DECODE (TO_CHAR (first_time, 'hh24'), '10', 1, 0)) "10",
 SUM (DECODE (TO_CHAR (first_time, 'hh24'), '11', 1, 0)) "11",
 SUM (DECODE (TO_CHAR (first_time, 'hh24'), '12', 1, 0)) "12",
 SUM (DECODE (TO_CHAR (first_time, 'hh24'), '13', 1, 0)) "13",
 SUM (DECODE (TO_CHAR (first_time, 'hh24'), '14', 1, 0)) "14",
 SUM (DECODE (TO_CHAR (first_time, 'hh24'), '15', 1, 0)) "15",
 SUM (DECODE (TO_CHAR (first_time, 'hh24'), '16', 1, 0)) "16",
 SUM (DECODE (TO_CHAR (first_time, 'hh24'), '17', 1, 0)) "17",
 SUM (DECODE (TO_CHAR (first_time, 'hh24'), '18', 1, 0)) "18",
 SUM (DECODE (TO_CHAR (first_time, 'hh24'), '19', 1, 0)) "19",
 SUM (DECODE (TO_CHAR (first_time, 'hh24'), '20', 1, 0)) "20",
 SUM (DECODE (TO_CHAR (first_time, 'hh24'), '21', 1, 0)) "21",
 SUM (DECODE (TO_CHAR (first_time, 'hh24'), '22', 1, 0)) "22",
 SUM (DECODE (TO_CHAR (first_time, 'hh24'), '23', 1, 0)) "23",
 ROUND (COUNT (1) / 24, 2) "Avg"
FROM gv$log_history
WHERE thread# = inst_id
AND first_time > sysdate -7
GROUP BY TRUNC (first_time), inst_id, TO_CHAR (first_time, 'Dy')
ORDER BY 1,2;

SET MARKUP HTML   OFF

prompt </td><td></td></tr>
prompt <tr><td></td>
prompt </table>




prompt <table class="finding" cellpadding="4" border="0" role="presentation">
prompt <tr class="ruleid"><td></td>
prompt <td> PERMANENT & TEMPORARY TABLESPACE</td>
prompt <td colspan="2">
prompt </td>
prompt </tr><tr>
prompt <td class="sev4" colspan="4"></td>
prompt </tr>
prompt <tr><td></td>
prompt <td class="finding_head">Rapor</td> <td class="finding_cell">Default olarak kullanýlan Permanent ve Temporary Tablespaces  </td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Neyi inceliyoruz ?</td>
prompt <td class="finding_cell">Bu bölüm veritabaný üzerindeki Default olarak ayarlanmis Permanent ve Temporary tablespace'leri göstermektedir. <pre>
prompt </pre></td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Detaylar</td>
prompt <td class="finding_cell">
prompt <br>
prompt <br>
prompt <b>DEFAULT_PERMANENT_TABLESPACE</b> olarak <b>SYSTEM</b> yada <b>SYSAUX</b> gibi özel tablespace'ler default olarak kullanýlmamasi gerekir. Yeni bir tablespace olusturulmali ve ayarlar bu yeni tablespace icin set edilmelidir.
prompt <br>

SET MARKUP HTML   ON

SELECT
	PROPERTY_NAME,
	PROPERTY_VALUE
FROM
	DATABASE_PROPERTIES
WHERE
	PROPERTY_NAME IN(
		'DEFAULT_PERMANENT_TABLESPACE',
		'DEFAULT_TEMP_TABLESPACE'
	);

SET MARKUP HTML   OFF

prompt </td><td></td></tr>
prompt <tr><td></td>
prompt </table>

prompt <table class="finding" cellpadding="4" border="0" role="presentation">
prompt <tr class="ruleid"><td></td>
prompt <td> PERMANENT & TEMPORARY TABLESPACE</td>
prompt <td colspan="2">
prompt </td>
prompt </tr><tr>
prompt <td class="sev4" colspan="4"></td>
prompt </tr>
prompt <tr><td></td>
prompt <td class="finding_head">Rapor</td> <td class="finding_cell">Permanent ve Temporary Tablespaces kullanan hesaplar  </td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Neyi inceliyoruz ?</td>
prompt <td class="finding_cell">Asagida SYSTEM ve SYSAUX tablespacle'leri kullanan hesaplar listelenmektedir.. <pre>
prompt </pre></td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Detaylar</td>
prompt <td class="finding_cell">
prompt <br>
prompt <br>
prompt <b>SYSTEM</b> yada <b>SYSAUX</b> gibi özel tablespace'ler veritabani icin özel tablespace'ler olup sonradan acilan hesaplarda kullanilmamasi gerekir. 
prompt <br>

SET MARKUP HTML   ON

SELECT
	USERNAME,
	DEFAULT_TABLESPACE,
	TEMPORARY_TABLESPACE
FROM
	DBA_USERS
WHERE
	(
		DEFAULT_TABLESPACE IN(
			'SYSTEM',
			'SYSAUX'
		)
		OR TEMPORARY_TABLESPACE IN(
			'SYSTEM',
			'SYSAUX'
		)
	)
	AND USERNAME NOT IN(
		'ANONYMOUS',
		'CTXSYS',
		'DBSNMP',
		'EXFSYS',
		'LBACSYS',
		'MDSYS',
		'MGMT_VIEW',
		'OLAPSYS',
		'OWBSYS',
		'ORDPLUGINS',
		'ORDSYS',
		'OUTLN',
		'SI_INFORMTN_SCHEMA',
		'SYS',
		'SYSMAN',
		'SYSTEM',
		'TSMSYS',
		'WK_TEST',
		'WKSYS',
		'WKPROXY',
		'WMSYS',
		'XDB',
		'APEX_PUBLIC_USER',
		'DIP',
		'FLOWS_30000',
		'FLOWS_FILES',
		'MDDATA',
		'ORACLE_OCM',
		'SPATIAL_CSW_ADMIN_USR',
		'SPATIAL_WFS_ADMIN_USR',
		'XS$NULL',
		'OWBSYS_AUDIT',
		'ORDDATA',
		'APEX_030200',
		'APPQOSSYS',
		'DVSYS',
		'DVF'
	)
ORDER BY
	ACCOUNT_STATUS DESC;
SET MARKUP HTML   OFF

prompt </td><td></td></tr>
prompt <tr><td></td>
prompt </table>

prompt <table class="finding" cellpadding="4" border="0" role="presentation">
prompt <tr class="ruleid"><td></td>
prompt <td> Örnek Veritabaný hesaplari</td>
prompt <td colspan="2">
prompt </td>
prompt </tr><tr>
prompt <td class="sev4" colspan="4"></td>
prompt </tr>
prompt <tr><td></td>
prompt <td class="finding_head">Rapor</td> <td class="finding_cell">Veritabani kurulurken yada sonradan açýlmýs örnek veritabani kullanicilari  </td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Neyi inceliyoruz?</td>
prompt <td class="finding_cell">Veritabani kurulurken yada sonradan HR , BI gibi örnek veritabani kullanicilari olusturulmus olabilir. Bu hesaplarin sifrelerinin mutlaka degistirilmesi yada kullanilmiyorsa <b>silinmesi yada LOCK</b> edilmesi gerekir.<pre>
prompt </pre></td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Detaylar</td>
prompt <td class="finding_cell">
prompt <br>
prompt <br>
prompt Bu kullanýcýlar örnek olduðu için production veritabaný üzerinde olmamalý yada kilitli durumda kalmalýdýr.  
prompt <br>

SET MARKUP HTML   ON

SELECT
	DISTINCT(USERNAME),
	ACCOUNT_STATUS,
	LAST_LOGIN
FROM
	DBA_USERS
WHERE
	USERNAME IN(
		'BI',
		'HR',
		'OE',
		'PM',
		'IX',
		'SH',
		'SCOTT'
	);

SET MARKUP HTML   OFF

prompt </td><td></td></tr>
prompt <tr><td></td>
prompt </table>

prompt <table class="finding" cellpadding="4" border="0" role="presentation">
prompt <tr class="ruleid"><td></td>
prompt <td> Örnek Veritabani Profilleri</td>
prompt <td colspan="2">
prompt </td>
prompt </tr><tr>
prompt <td class="sev4" colspan="4"></td>
prompt </tr>
prompt <tr><td></td>
prompt <td class="finding_head">Rapor</td> <td class="finding_cell">Veritabani üzerindeki profillerin incelenmesi  </td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Neyi inceliyoruz ?</td>
prompt <td class="finding_cell">Veritabaný profilleri , bir veritabaninda gerek yetki hiyerarsisi icin gerekse hesaplar üzerindeki kontrolün rahat saglanabilmesi icin önemlidir. Asagida veritabani üzerinde acilmis profiller listelenmistir. <pre>
prompt </pre></td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Detaylar</td>
prompt <td class="finding_cell">
prompt <br>
prompt <br>
prompt Veritabaninda aktif / pasif tüm profiller.  
prompt <br>

SET MARKUP HTML   ON

SELECT
	DISTINCT PROFILE
FROM
	DBA_PROFILES
ORDER BY
	PROFILE;

SET MARKUP HTML   OFF
prompt <br>
prompt <br>
prompt Veritabaninda kullanilmayan profller. Bir veritabaninda <b>kullanilmayan profil</b> bulunuyorsa incelenmeli ve <b>silinmelidir</b>.
prompt <br>
SET MARKUP HTML   ON

SELECT
	DISTINCT PROFILE
FROM
	DBA_PROFILES MINUS SELECT
		DISTINCT PROFILE
	FROM
		DBA_USERS;

SET MARKUP HTML   OFF
prompt <br>
prompt <br>
prompt Veritabani üzerindeki kullanicilarin bagli oldugu profiller.
prompt <br>
SET MARKUP HTML   ON


SELECT
	*
FROM
	DBA_PROFILES
ORDER BY
	PROFILE;

SELECT
	USERNAME,
	PROFILE
FROM
	DBA_USERS
ORDER BY
	PROFILE;


SET MARKUP HTML   OFF

prompt </td><td></td></tr>
prompt <tr><td></td>
prompt </table>

prompt <table class="finding" cellpadding="4" border="0" role="presentation">
prompt <tr class="ruleid"><td></td>
prompt <td> Resource limit</td>
prompt <td colspan="2">
prompt </td>
prompt </tr><tr>
prompt <td class="sev4" colspan="4"></td>
prompt </tr>
prompt <tr><td></td>
prompt <td class="finding_head">Rapor</td> <td class="finding_cell">Veritabani üzerindeki profiller  </td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Neyi inceliyoruz?</td>
prompt <td class="finding_cell">Oracle Database Resource Limit parametresi kaynak tüketimi ile ilgili ayarlarý yapabilmemize olanak tanir. <pre>
prompt </pre></td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Detaylar</td>
prompt <td class="finding_cell">
prompt <br>
prompt <br>
prompt Bir veritabaninda kaynak tüketimi ile ilgili ayarlari aktif etmek icin <b>Resource Limit = TRUE </b> olmalidir. Bu ayar <b>FALSE</b> olarak geldiginde kaynak tüketimi dikkate alinmaz.  
prompt <br>

SET MARKUP HTML   ON

SELECT
	NAME,
	VALUE
FROM
	V$PARAMETER
WHERE
	NAME = 'resource_limit';

SET MARKUP HTML   OFF
prompt <br>
prompt <br>
prompt Bu kisimda profillere bagli ayarlar verilmektedir.  
prompt <br>
prompt <b>COMPOSITE_LIMIT : </b> Hizmet birimleri cinsinden ifade edilen bir oturum için toplam kaynak maliyetini belirtir. Oracle Database, toplam hizmet birimlerini CPU_PER_SESSION, CONNECT_TIME, LOGICAL_READS_PER_SESSION ve PRIVATE_SGA agirlikli toplami olarak hesaplar.
prompt <br>
prompt <b>CONNECT_TIME : </b>Dakika cinsinden ifade edilen bir oturum için toplam geçen süre limitini belirler
prompt <br>
prompt <b>CPU_PER_CALL</b>Yüzde saniye olarak ifade edilen bir çagri (parse, execute, yada fetch) için CPU zaman limitini belirler.
prompt <br>
prompt <b>CPU_PER_SESSION : </b>Yüzde saniye olarak ifade edilen bir oturum için CPU zaman limitini belirler.
prompt <br>
prompt <b>IDLE_TIME : </b>Bir oturum sirasinda izin verilen sürekli etkin olmayan süreyi dakika cinsinden belir. Uzun süren sorgular ve diger islemler bu limite tabi degildir.
prompt <br>
prompt <b>LOGICAL_READS_PER_SESSION : </b>Memory ve diskten okunan bloklar dahil olmak üzere bir oturumda okunan izin verilen veri bloðu sayýsýný belirtir.
prompt <br>
prompt <b>PRIVATE_SGA : </b>Sistem global (SGA) paylaþýlan havuzunda bir oturumun tahsis edebileceði özel alan limitini  belirtir.
prompt <br>
prompt <b>SESSIONS_PER_USER : </b>Kullanini icin limitlemek istediðiniz eszamanli oturumlarin limitini belirtir.
prompt <br>



SET MARKUP HTML   ON


SELECT
	PROFILE,
	RESOURCE_NAME,
	LIMIT
FROM
	DBA_PROFILES
WHERE
	RESOURCE_NAME IN(
		'SESSIONS_PER_USER',
		'CPU_PER_SESSION',
		'CPU_PER_CALL',
		'CONNECT_TIME',
		'IDLE_TIME',
		'LOGICAL_READS_PER_SESSION',
		'PRIVATE_SGA',
		'COMPOSITE_LIMIT'
	)
ORDER BY
	PROFILE,
	RESOURCE_NAME;

SET MARKUP HTML   OFF

prompt </td><td></td></tr>
prompt <tr><td></td>
prompt </table>

prompt </td><td></td></tr>
prompt <tr><td></td>
prompt </table>

prompt <table class="finding" cellpadding="4" border="0" role="presentation">
prompt <tr class="ruleid"><td></td>
prompt <td> Resource Manager Plan</td>
prompt <td colspan="2">
prompt </td>
prompt </tr><tr>
prompt <td class="sev4" colspan="4"></td>
prompt </tr>
prompt <tr><td></td>
prompt <td class="finding_head">Rapor</td> <td class="finding_cell">Resource Manager Plan</td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Neyi inceliyoruz ?</td>
prompt <td class="finding_cell">Resource Manager Plan , CPU üzerindeki limitleri belirler. <pre>
prompt </pre></td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Detaylar</td>
prompt <td class="finding_cell">
prompt <br>
prompt <br>
prompt Bu plani kurum politikaniza göre sekillendirebilirsiniz. Plan <b>NULL</b> geliyorsa kullanilmiyor demektir.  
prompt <br>

SET MARKUP HTML   ON

SELECT
	NAME,
	VALUE
FROM
	V$PARAMETER
WHERE
	NAME LIKE 'resource_manager_plan';

SET MARKUP HTML   OFF

prompt </td><td></td></tr>
prompt <tr><td></td>
prompt </table>

prompt <table class="finding" cellpadding="4" border="0" role="presentation">
prompt <tr class="ruleid"><td></td>
prompt <td>Veritabani profilleri güvenlik politikalari</td>
prompt <td colspan="2">
prompt </td>
prompt </tr><tr>
prompt <td class="sev4" colspan="4"></td>
prompt </tr>
prompt <tr><td></td>
prompt <td class="finding_head">Rapor</td> <td class="finding_cell">Veritabaný üzerindeki profiller  </td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Neyi inceliyoruz ?</td>
prompt <td class="finding_cell">Profillerin güvenlik politikalari<pre>
prompt </pre></td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Detaylar</td>
prompt <td class="finding_cell">
prompt <br>
prompt <br>
prompt Oracle Database üzerinde her kullanici bir profile tanimlidir. Profiller gerek yetki gerekse kullanici davranislari icin önemlidir. Asagida veritabaninda bulunan profillerin parametrik degerleri gösterilmektedir. 
prompt <br>
prompt <br>
prompt <b>FAILED_LOGIN_ATTEMPTS : </b> Bir kullanicinin sifresini kac kez yanlis girebilecegini belirler. <b>UNLIMITED</b> olmasi tavsiye edilmez. Brute Force ataklari icin onemli bir parametredir.
prompt <br>
prompt <br>
prompt <b>PASSWORD_GRACE_TIME : </b> Kullanicinin <b>PASSWORD_LIFE_TIME</b> süresine eristikten sonra kac gün icerisinde yeni sifrelerini belirlemesi gerektigini gosteren parametredir.
prompt <br>
prompt <br>
prompt <b>PASSWORD_LOCK_TIME : </b> Kullanicinin <b>FAILED_LOGIN_ATTEMPTS</b> yani hatali sifre sayisina ulastiktan sonra kac gün kilitli kalacagini belirleyen parametredir.
prompt <br>
prompt <br>
prompt <b>PASSWORD_REUSE_MAX : </b> Kullanicinin eski paralasini tekrar kullanabilmesi icin gecmesi gereken sayiyi belirten parametredir.
prompt <br>
prompt <br>
prompt <b>PASSWORD_REUSE_TIME : </b> Kullanicinin eski paralasini tekrar kullanabilmesi icin gecmesi gereken süreyi belirten parametredir.
prompt <br>
prompt <br>
prompt <b>PASSWORD_VERIFY_FUNCTION : </b> Kullanicinin parola degisimini belli bir kuralla baglayabiliriz. DB üzerinde fonksiyonlarýn belirlendigi parametredir.
prompt <br>
prompt <br>
prompt Asagidaki parametrelerin kritik kullanicilar haric unlimited olmasi tavsiye edilmez. Ornegin DB üzerinde calisan gelistirme kullanicilari varsa bu kisilerin ayri profillerde olmasý ve bu profillerin tanimlarinin kurum politikasina uygun olarak yapilmasi önemlidir.

SET MARKUP HTML   ON

SELECT
	PROFILE,
	RESOURCE_NAME,
	LIMIT
FROM
	DBA_PROFILES
WHERE
	RESOURCE_NAME IN(
		'FAILED_LOGIN_ATTEMPTS',
		'PASSWORD_LIFE_TIME',
		'PASSWORD_LOCK_TIME',
		'PASSWORD_GRACE_TIME',
		'PASSWORD_VERIFY_FUNCTION',
		'PASSWORD_REUSE_TIME',
		'PASSWORD_REUSE_MAX'
	)
ORDER BY
	PROFILE,
	RESOURCE_NAME;

SET MARKUP HTML   OFF

prompt <br>
prompt Asagida <b>PASSWORD_VERIFY_FUNCTION</b> alani bos olan profiller listelenmektedir. Veritabani üzerinde Function olusturarak kullanicilarin parolasini belli kurallara baglayabiliriz.Bu ayarin <b>NULL</b> olmasi tavsiye edilmemektedir..

SET MARKUP HTML   ON


SELECT
	*
FROM
	DBA_PROFILES
WHERE
	RESOURCE_NAME = 'PASSWORD_VERIFY_FUNCTION'
	AND(
		LIMIT = 'DEFAULT'
		OR LIMIT IS NULL
		OR LIMIT = 'NULL'
	);

SET MARKUP HTML   OFF

prompt </td><td></td></tr>
prompt <tr><td></td>
prompt </table>

prompt <table class="finding" cellpadding="4" border="0" role="presentation">
prompt <tr class="ruleid"><td></td>
prompt <td> Kritik Kullanici Yetkileri</td>
prompt <td colspan="2">
prompt </td>
prompt </tr><tr>
prompt <td class="sev4" colspan="4"></td>
prompt </tr>
prompt <tr><td></td>
prompt <td class="finding_head">Rapor</td> <td class="finding_cell">Kritik Kullanici Yetkileri </td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Neyi inceliyoruz ?</td>
prompt <td class="finding_cell">Veritabani üzerindeki kullanicilarin kritik kullanici yetkileri <pre>
prompt </pre></td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Detaylar</td>
prompt <td class="finding_cell">
prompt <br>
prompt <br>
prompt Veritabani üzerinde bazi kritik yetkiler bulunmaktadir.Bu yetkilerin rutin olarak kontrol edilmesi ve gereksiz yetkilerin temizlenmesi gerekir.Asagida öncelikli olarak kritik yetkilerin listesi verilmistir.  
prompt <br>
prompt <br>
prompt <br>
prompt DBA Yetkisine sahip kullanici yada gruplar.  
prompt <br>
prompt <br>

SET MARKUP HTML   ON

SELECT
	DISTINCT A.GRANTEE,
	A.GRANTED_ROLE,
	'DBA' GRANTED_CRITIC_ROLE
FROM
	(
		SELECT
			DISTINCT LEVEL LEVEL_DEEP,
			GRANTEE,
			GRANTED_ROLE
		FROM
			DBA_ROLE_PRIVS START WITH GRANTED_ROLE = 'DBA' 
                                 CONNECT BY PRIOR GRANTEE = GRANTED_ROLE
	) A,
	DBA_USERS B
WHERE
	A.GRANTEE = B.USERNAME
	AND B.USERNAME NOT IN(
		'SYSTEM',
		'SYS'
	)
	AND B.ACCOUNT_STATUS = 'OPEN';

SET MARKUP HTML   OFF
prompt <br>
prompt <br>
prompt SYSDBA Yetkisine sahip kullanici yada gruplar. 
prompt <br>
prompt <br>
SET MARKUP HTML   ON


SELECT * FROM v$pwfile_users;

SET MARKUP HTML   OFF
prompt <br>
prompt <br>
prompt DATAPUMP_IMP_FULL_DATABASE Yetkisine sahip kullanici yada gruplar.
prompt <br>
prompt <br>
SET MARKUP HTML   ON


SELECT
	DISTINCT A.GRANTEE,
	A.GRANTED_ROLE,
	'IMP_FULL_DATABASE' GRANTED_CRITIC_ROLE
FROM
	(
		SELECT
			DISTINCT LEVEL LEVEL_DEEP,
			GRANTEE,
			GRANTED_ROLE
		FROM
			DBA_ROLE_PRIVS 
START WITH GRANTED_ROLE = 'IMP_FULL_DATABASE' 
CONNECT BY PRIOR GRANTEE = GRANTED_ROLE
	) A,
	DBA_USERS B
WHERE
	A.GRANTEE = B.USERNAME
	AND B.USERNAME NOT IN(
		'SYSTEM',
		'SYS'
	)
	AND B.ACCOUNT_STATUS = 'OPEN';

SET MARKUP HTML   OFF
prompt <br>
prompt <br>
prompt DATAPUMP_EXP_FULL_DATABASE Yetkisine sahip kullanici yada gruplar.  
prompt <br>
prompt <br>
SET MARKUP HTML   ON

SELECT
	DISTINCT A.GRANTEE,
	A.GRANTED_ROLE,
	'DATAPUMP_EXP_FULL_DATABASE' GRANTED_CRITIC_ROLE
FROM
	(
		SELECT
			DISTINCT LEVEL LEVEL_DEEP,
			GRANTEE,
			GRANTED_ROLE
		FROM
			DBA_ROLE_PRIVS 
START WITH GRANTED_ROLE = 'DATAPUMP_EXP_FULL_DATABASE' 
CONNECT BY PRIOR GRANTEE = GRANTED_ROLE
	) A,
	DBA_USERS B
WHERE
	A.GRANTEE = B.USERNAME
	AND B.USERNAME NOT IN(
		'SYSTEM',
		'SYS'
	)
	AND B.ACCOUNT_STATUS = 'OPEN';

SET MARKUP HTML   OFF
prompt <br>
prompt <br>
prompt SELECT_CATALOG_ROLE Yetkisine sahip kullanici yada gruplar.  
prompt <br>
prompt <br>
SET MARKUP HTML   ON

SELECT
	DISTINCT A.GRANTEE,
	GRANTED_ROLE,
	'SELECT_CATALOG_ROLE' GRANTED_CRITIC_ROLE
FROM
	(
		SELECT
			DISTINCT LEVEL LEVEL_DEEP,
			GRANTEE,
			GRANTED_ROLE
		FROM
			DBA_ROLE_PRIVS 
START WITH GRANTED_ROLE = 'SELECT_CATALOG_ROLE' 
CONNECT BY PRIOR GRANTEE = GRANTED_ROLE
	) A,
	DBA_USERS B
WHERE
	A.GRANTEE = B.USERNAME
	AND B.USERNAME NOT IN(
		'SYSTEM',
		'SYS',
		'SYSMAN'
	)
	AND B.ACCOUNT_STATUS = 'OPEN';

SET MARKUP HTML   OFF
prompt <br>
prompt <br>
prompt DELETE_CATALOG_ROLE Yetkisine sahip kullanici yada gruplar. 
prompt <br>
prompt <br>
SET MARKUP HTML   ON


SELECT
	DISTINCT A.GRANTEE,
	GRANTED_ROLE,
	'DELETE_CATALOG_ROLE' GRANTED_CRITIC_ROLE
FROM
	(
		SELECT
			DISTINCT LEVEL LEVEL_DEEP,
			GRANTEE,
			GRANTED_ROLE
		FROM
			DBA_ROLE_PRIVS 
START WITH GRANTED_ROLE = 'DELETE_CATALOG_ROLE' 
CONNECT BY PRIOR GRANTEE = GRANTED_ROLE
	) A,
	DBA_USERS B
WHERE
	A.GRANTEE = B.USERNAME
	AND B.USERNAME NOT IN(
		'SYSTEM',
		'SYS',
		'SYSMAN'
	)
	AND B.ACCOUNT_STATUS = 'OPEN';

SET MARKUP HTML   OFF
prompt <br>
prompt <br>
prompt EXECUTE_CATALOG_ROLE Yetkisine sahip kullanici yada gruplar.
prompt <br>
prompt <br>
SET MARKUP HTML   ON


SELECT
	DISTINCT A.GRANTEE,
	GRANTED_ROLE,
	'EXECUTE_CATALOG_ROLE' GRANTED_CRITIC_ROLE
FROM
	(
		SELECT
			DISTINCT LEVEL LEVEL_DEEP,
			GRANTEE,
			GRANTED_ROLE
		FROM
			DBA_ROLE_PRIVS 
			START WITH GRANTED_ROLE = 'EXECUTE_CATALOG_ROLE' 
			CONNECT BY PRIOR GRANTEE = GRANTED_ROLE
	) A,
	DBA_USERS B
WHERE
	A.GRANTEE = B.USERNAME
	AND B.USERNAME NOT IN(
		'SYSTEM',
		'SYS',
		'SYSMAN'
	)
	AND B.ACCOUNT_STATUS = 'OPEN';

SET MARKUP HTML   OFF
prompt <br>
prompt <br>
prompt Kritik ( ANY , ALTER ) Yetkisine sahip kullanici yada gruplar. 
prompt <br>
prompt <br>
SET MARKUP HTML   ON


SELECT
	A.*,
	'GRANTED TO USER' TYPE
FROM
	DBA_SYS_PRIVS A,
	DBA_USERS B
WHERE
	A.GRANTEE = B.USERNAME
	AND PRIVILEGE IN(
		'BECOME USER',
		'ALTER USER',
		'DROP USER',
		'CREATE ROLE',
		'ALTER ANY ROLE',
		'DROP ANY ROLE',
		'GRANT ANY ROLE',
		'CREATE PROFILE',
		'ALTER PROFILE',
		'DROP PROFILE',
		'CREATE ANY TABLE',
		'ALTER ANY TABLE',
		'DROP ANY TABLE',
		'INSERT ANY TABLE',
		'UPDATE ANY TABLE',
		'DELETE ANY TABLE',
		'SELECT ANY TABLE',
		'CREATE ANY PROCEDURE',
		'ALTER ANY PROCEDURE',
		'DROP ANY PROCEDURE',
		'EXECUTE ANY PROCEDURE',
		'CREATE ANY TRIGGER',
		'ALTER ANY TRIGGER',
		'DROP ANY TRIGGER',
		'CREATE TABLESPACE',
		'ALTER TABLESPACE',
		'DROP TABLESPACES',
		'ALTER DATABASE',
		'ALTER SYSTEM',
		'SELECT ANY DICTIONARY',
		'EXEMPT ACCESS POLICY',
		'CREATE ANY LIBRARY',
		'GRANT ANY OBJECT PRIVILEGE',
		'GRANT ANY PRIVILEGE',
		'AUDIT ANY'
	)
	AND GRANTEE NOT IN(
		'ANONYMOUS',
		'CTXSYS',
		'DBSNMP',
		'EXFSYS',
		'LBACSYS',
		'MDSYS',
		'MGMT_VIEW',
		'OLAPSYS',
		'OWBSYS',
		'ORDPLUGINS',
		'ORDSYS',
		'OUTLN',
		'SI_INFORMTN_SCHEMA',
		'SYS',
		'SYSMAN',
		'SYSTEM',
		'TSMSYS',
		'WK_TEST',
		'WKSYS',
		'WKPROXY',
		'WMSYS',
		'XDB',
		'APEX_PUBLIC_USER',
		'DIP',
		'FLOWS_30000',
		'FLOWS_FILES',
		'MDDATA',
		'ORACLE_OCM',
		'SPATIAL_CSW_ADMIN_USR',
		'SPATIAL_WFS_ADMIN_USR',
		'XS$NULL',
		'OWBSYS_AUDIT',
		'ORDDATA',
		'APEX_030200',
		'APPQOSSYS',
		'DVSYS',
		'DVF'
	)
UNION ALL 
SELECT
	A.*,
	'GRANTED TO ROLE' TYPE
FROM
	DBA_SYS_PRIVS A,
	DBA_ROLES B
WHERE
	A.GRANTEE = B.ROLE
	AND PRIVILEGE IN(
		'BECOME USER',
		'ALTER USER',
		'DROP USER',
		'CREATE ROLE',
		'ALTER ANY ROLE',
		'DROP ANY ROLE',
		'GRANT ANY ROLE',
		'CREATE PROFILE',
		'ALTER PROFILE',
		'DROP PROFILE',
		'CREATE ANY TABLE',
		'ALTER ANY TABLE',
		'DROP ANY TABLE',
		'INSERT ANY TABLE',
		'UPDATE ANY TABLE',
		'DELETE ANY TABLE',
		'SELECT ANY TABLE',
		'CREATE ANY PROCEDURE',
		'ALTER ANY PROCEDURE',
		'DROP ANY PROCEDURE',
		'EXECUTE ANY PROCEDURE',
		'CREATE ANY TRIGGER',
		'ALTER ANY TRIGGER',
		'DROP ANY TRIGGER',
		'CREATE TABLESPACE',
		'ALTER TABLESPACE',
		'DROP TABLESPACES',
		'ALTER DATABASE',
		'ALTER SYSTEM',
		'SELECT ANY DICTIONARY',
		'EXEMPT ACCESS POLICY',
		'CREATE ANY LIBRARY',
		'GRANT ANY OBJECT PRIVILEGE',
		'GRANT ANY PRIVILEGE',
		'AUDIT ANY'
	)
	AND GRANTEE NOT IN(
		'DBA',
		'IMP_FULL_DATABASE',
		'DATAPUMP_IMP_FULL_DATABASE',
		'OLAP_DBA',
		'EXP_FULL_DATABASE',
		'OEM_MONITOR'
	);

SET MARKUP HTML   OFF

prompt </td><td></td></tr>
prompt <tr><td></td>
prompt </table>

prompt <table class="finding" cellpadding="4" border="0" role="presentation">
prompt <tr class="ruleid"><td></td>
prompt <td> Unlimited Tablespace kullanan kullanicilar</td>
prompt <td colspan="2">
prompt </td>
prompt </tr><tr>
prompt <td class="sev4" colspan="4"></td>
prompt </tr>
prompt <tr><td></td>
prompt <td class="finding_head">Rapor</td> <td class="finding_cell">Oracle Database Tablesapce kotalari </td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Neyi inceliyoruz ?</td>
prompt <td class="finding_cell">Bu bölüm <b>UNLIMITED TABLESPACE</b> yetkisine sahip kullanicilari göstermektedir. <pre>
prompt </pre></td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Detaylar</td>
prompt <td class="finding_cell">
prompt <br>
prompt <br>
prompt Oracle Database üzerindeki her kullanýcýnýn <b>UNLIMITED TABLESPACE</b> hakký olmamasý gerekir. Asagida bu yetkiye sahip kullanicilar listelenmektedir.
prompt <br>

SET MARKUP HTML   ON

SELECT
	USERNAME,
	TABLESPACE_NAME 
FROM
	DBA_TS_QUOTAS
WHERE
	MAX_BYTES = - 1
	AND USERNAME NOT IN(
		'ANONYMOUS',
		'CTXSYS',
		'DBSNMP',
		'EXFSYS',
		'LBACSYS',
		'MDSYS',
		'MGMT_VIEW',
		'OLAPSYS',
		'OWBSYS',
		'ORDPLUGINS',
		'ORDSYS',
		'OUTLN',
		'SI_INFORMTN_SCHEMA',
		'SYS',
		'SYSMAN',
		'SYSTEM',
		'TSMSYS',
		'WK_TEST',
		'WKSYS',
		'WKPROXY',
		'WMSYS',
		'XDB',
		'APEX_PUBLIC_USER',
		'DIP',
		'FLOWS_30000',
		'FLOWS_FILES',
		'MDDATA',
		'ORACLE_OCM',
		'SPATIAL_CSW_ADMIN_USR',
		'SPATIAL_WFS_ADMIN_USR',
		'XS$NULL',
		'OWBSYS_AUDIT',
		'ORDDATA',
		'APEX_030200',
		'APPQOSSYS',
		'DVSYS',
		'DVF'
	);
SET MARKUP HTML   OFF

prompt </td><td></td></tr>
prompt <tr><td></td>
prompt </table>

prompt <table class="finding" cellpadding="4" border="0" role="presentation">
prompt <tr class="ruleid"><td></td>
prompt <td> O7_DICTIONARY_ACCESSIBILITY</td>
prompt <td colspan="2">
prompt </td>
prompt </tr><tr>
prompt <td class="sev4" colspan="4"></td>
prompt </tr>
prompt <tr><td></td>
prompt <td class="finding_head">Rapor</td> <td class="finding_cell">Oracle Database SYS semasindaki objelere karsi koruma </td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Neyi inceliyoruz ?</td>
prompt <td class="finding_cell">Bir kullanicinin <b>ALTER ANY , DROP ANY , DELETE ANY</b> yetkileri olabilir. Bu yetkiler ayni zamanda SYS semasinida etkileyebilir. <pre>
prompt </pre></td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Detaylar</td>
prompt <td class="finding_cell">
prompt <br>
prompt <br>
prompt Bu parametrenin<b>FALSE</b> olmasi gerekir.Bu sayede ANY yetkiler olsa bile erisim saglanamaz. Bu parametre <b>Oracle Database 19C</b> iptal edilmis olup direk FALSe olarak gelmektedir. 
prompt <br>
prompt <br>

SET MARKUP HTML   ON

SELECT
	NAME,
	VALUE
FROM
	V$SYSTEM_PARAMETER
WHERE
	UPPER( NAME ) = 'O7_DICTIONARY_ACCESSIBILITY';

SET MARKUP HTML   OFF

prompt </td><td></td></tr>
prompt <tr><td></td>
prompt </table>

prompt <table class="finding" cellpadding="4" border="0" role="presentation">
prompt <tr class="ruleid"><td></td>
prompt <td>OS_ROLES</td>
prompt <td colspan="2">
prompt </td>
prompt </tr><tr>
prompt <td class="sev4" colspan="4"></td>
prompt </tr>
prompt <tr><td></td>
prompt <td class="finding_head">Rapor</td> <td class="finding_cell">Oracle Database rol yönetimi </td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Neyi inceliyoruz ?</td>
prompt <td class="finding_cell">Oracle Database icin kritik olan rollerin yönetimi. <pre>
prompt </pre></td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Detaylar</td>
prompt <td class="finding_cell">
prompt <br>
prompt <br>
prompt <b>OS_ROLES</b> Oracle Database icin önemli olan rollerin isletim sistemimi yoksa veritabani tarafindan yönetilecegine karar verir. Bu degerin <b>FALSE</b> olmasi gerekir. . 
prompt <br>

SET MARKUP HTML   ON

SELECT
	NAME,
	VALUE
FROM
	V$SYSTEM_PARAMETER
WHERE
	UPPER( NAME ) = 'OS_ROLES';

SET MARKUP HTML   OFF

prompt </td><td></td></tr>
prompt <tr><td></td>
prompt </table>

prompt <table class="finding" cellpadding="4" border="0" role="presentation">
prompt <tr class="ruleid"><td></td>
prompt <td>REMOTE_LISTENER</td>
prompt <td colspan="2">
prompt </td>
prompt </tr><tr>
prompt <td class="sev4" colspan="4"></td>
prompt </tr>
prompt <tr><td></td>
prompt <td class="finding_head">Rapor</td> <td class="finding_cell">Remote Listener Bilgileri </td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Neyi inceliyoruz ?</td>
prompt <td class="finding_cell">Remote Listener bilgilerinin incelenmesi. <pre>
prompt </pre></td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Detaylar</td>
prompt <td class="finding_cell">
prompt <br>
prompt <br>
prompt <b>REMOTE_LISTENER</b> Oracle veritabaninin hali hazirda aktif oldugu sunucu haricinde baska bir sunucuda calisacak ise ( Örnegin Dataguard ) bilgiler bu alana tanimlanir.
prompt <br>

SET MARKUP HTML   ON

SELECT
	NAME,
	VALUE
FROM
	V$SYSTEM_PARAMETER
WHERE
	UPPER( NAME ) = 'REMOTE_LISTENER';

SET MARKUP HTML   OFF

prompt </td><td></td></tr>
prompt <tr><td></td>
prompt </table>

prompt <table class="finding" cellpadding="4" border="0" role="presentation">
prompt <tr class="ruleid"><td></td>
prompt <td>SEC_CASE_SENSITIVE_LOGON</td>
prompt <td colspan="2">
prompt </td>
prompt </tr><tr>
prompt <td class="sev4" colspan="4"></td>
prompt </tr>
prompt <tr><td></td>
prompt <td class="finding_head">Rapor</td> <td class="finding_cell">Kullanicilarin parolalarinda büyük / kücük harf ayrimi </td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Neyi inceliyoruz ?</td>
prompt <td class="finding_cell">Kullanicilarin parolalarinda büyük / kücük harf ayrim <pre>
prompt </pre></td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Detaylar</td>
prompt <td class="finding_cell">
prompt <br>
prompt <br>
prompt Profillerde <b>PASSWORD_VERIFY_FUNCTION</b> parametresi set edilmediyse bu <b>SEC_CASE_SENSITIVE_LOGON</b> parametresi ile parolalarda büyük kücük harf mecburiyeti saglayabiliriz. Bu parametrenin <b>TRUE</b> olmasi gerekir.
prompt <br>

SET MARKUP HTML   ON

SELECT
	NAME,
	VALUE
FROM
	V$SYSTEM_PARAMETER
WHERE
	UPPER( NAME ) = 'SEC_CASE_SENSITIVE_LOGON';

SET MARKUP HTML   OFF

prompt </td><td></td></tr>
prompt <tr><td></td>
prompt </table>


prompt <table class="finding" cellpadding="4" border="0" role="presentation">
prompt <tr class="ruleid"><td></td>
prompt <td>SEC_PROTOCOL_ERROR_FURTHER_ACTION</td>
prompt <td colspan="2">
prompt </td>
prompt </tr><tr>
prompt <td class="sev4" colspan="4"></td>
prompt </tr>
prompt <tr><td></td>
prompt <td class="finding_head">Rapor</td> <td class="finding_cell">Oracle Database Ddos ataklarina karsi savunma </td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Neyi inceliyoruz ?</td>
prompt <td class="finding_cell">Bir istemci veritabanina isteyerek yada istemeyerek hatali paketler gonderebilir.Bu parametre hatali gelen paketlere nasil cevap verilecegini duzenler. <pre>
prompt </pre></td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Detaylar</td>
prompt <td class="finding_cell">
prompt <br>
prompt <br>
prompt Bu parametrenin <b>DROP,3</b> olmasi gerekir. 
prompt <br>

SET MARKUP HTML   ON

SELECT
	NAME,
	VALUE
FROM
	V$SYSTEM_PARAMETER
WHERE
	UPPER( NAME ) = 'SEC_PROTOCOL_ERROR_FURTHER_ACTION';

SET MARKUP HTML   OFF

prompt </td><td></td></tr>
prompt <tr><td></td>
prompt </table>

prompt <table class="finding" cellpadding="4" border="0" role="presentation">
prompt <tr class="ruleid"><td></td>
prompt <td>SEC_PROTOCOL_ERROR_TRACE_ACTION</td>
prompt <td colspan="2">
prompt </td>
prompt </tr><tr>
prompt <td class="sev4" colspan="4"></td>
prompt </tr>
prompt <tr><td></td>
prompt <td class="finding_head">Rapor</td> <td class="finding_cell">Oracle Database version bilgisi </td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Neyi inceliyoruz ?</td>
prompt <td class="finding_cell">Oracle Database uzerine hatali bir paket geldiginde uretilecek log seviyesi. <pre>
prompt </pre></td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Detaylar</td>
prompt <td class="finding_cell">
prompt <br>
prompt <br>
prompt Bu parametrede istemci tarafindan gelen hatali paketlerin veritabani uzerinde nasýl kayýt edilecegi belirlenmektedir.Bu parametrenin degeri <b>LOG</b> olmalidir.
prompt <br>

SET MARKUP HTML   ON

SELECT
	NAME,
	VALUE
FROM
	V$SYSTEM_PARAMETER
WHERE
	UPPER( NAME ) = 'SEC_PROTOCOL_ERROR_TRACE_ACTION';

SET MARKUP HTML   OFF

prompt </td><td></td></tr>
prompt <tr><td></td>
prompt </table>

prompt <table class="finding" cellpadding="4" border="0" role="presentation">
prompt <tr class="ruleid"><td></td>
prompt <td>SEC_RETURN_SERVER_RELEASE_BANNER</td>
prompt <td colspan="2">
prompt </td>
prompt </tr><tr>
prompt <td class="sev4" colspan="4"></td>
prompt </tr>
prompt <tr><td></td>
prompt <td class="finding_head">Rapor</td> <td class="finding_cell">Oracle Databae banner bilgisi </td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Neyi inceliyoruz ?</td>
prompt <td class="finding_cell">Bir istemcinin talep etmesi durumunda veritabani detayli bilgisinin gonderim kosullari <pre>
prompt </pre></td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Detaylar</td>
prompt <td class="finding_cell">
prompt <br>
prompt <br>
prompt Bu parametre ile istemci tarafý sizin veritabani surumunuzu ogrenebilir. Bunun onune gecmek icin bu degerin <b>FALSE</b> olmasi gerekir. 
prompt <br>

SET MARKUP HTML   ON

SELECT
	NAME,
	VALUE
FROM
	V$SYSTEM_PARAMETER
WHERE
	UPPER( NAME ) = 'SEC_RETURN_SERVER_RELEASE_BANNER';

SET MARKUP HTML   OFF

prompt </td><td></td></tr>
prompt <tr><td></td>
prompt </table>

prompt <table class="finding" cellpadding="4" border="0" role="presentation">
prompt <tr class="ruleid"><td></td>
prompt <td>SQL92_SECURITY</td>
prompt <td colspan="2">
prompt </td>
prompt </tr><tr>
prompt <td class="sev4" colspan="4"></td>
prompt </tr>
prompt <tr><td></td>
prompt <td class="finding_head">Rapor</td> <td class="finding_cell">Oracle Database kullanici yetki kontrolu </td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Neyi inceliyoruz ?</td>
prompt <td class="finding_cell">Bir kullanicinin update ve delete gibi komutlari kullanabilmesi gerekebilir.Bu parametre ile bu komutlari kullanabilmesi icin ayný zamanda select yetkisinin mecburiyetini kosul tutar. <pre>
prompt </pre></td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Detaylar</td>
prompt <td class="finding_cell">
prompt <br>
prompt <br>
prompt Bu parametre <b>TRUE</b> olmalidir. 
prompt <br>

SET MARKUP HTML   ON

SELECT
	NAME,
	VALUE
FROM
	V$SYSTEM_PARAMETER
WHERE
	UPPER( NAME ) = 'SQL92_SECURITY';

SET MARKUP HTML   OFF

prompt </td><td></td></tr>
prompt <tr><td></td>
prompt </table>

prompt <table class="finding" cellpadding="4" border="0" role="presentation">
prompt <tr class="ruleid"><td></td>
prompt <td>RESOURCE_LIMIT</td>
prompt <td colspan="2">
prompt </td>
prompt </tr><tr>
prompt <td class="sev4" colspan="4"></td>
prompt </tr>
prompt <tr><td></td>
prompt <td class="finding_head">Rapor</td> <td class="finding_cell">Oracle Database kaynak kullanimlari </td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Neyi inceliyoruz ?</td>
prompt <td class="finding_cell">Kimi durumlarda kullanicilarin kaynak kullanimlari kontrole baglanmasi gerekebilir. <pre>
prompt </pre></td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Detaylar</td>
prompt <td class="finding_cell">
prompt <br>
prompt <br>
prompt Oracle Database üzerinde bu parametrenin <b>TRUE</b> olmasi gerekir. Bu sayede profiller duzenlenerek kaynak kullanimlari kontrol altina alinabilir. 
prompt <br>

SET MARKUP HTML   ON

SELECT
	NAME,
	VALUE
FROM
	V$SYSTEM_PARAMETER
WHERE
	UPPER( NAME ) = 'RESOURCE_LIMIT';

SET MARKUP HTML   OFF

prompt </td><td></td></tr>
prompt <tr><td></td>
prompt </table>

prompt <table class="finding" cellpadding="4" border="0" role="presentation">
prompt <tr class="ruleid"><td></td>
prompt <td>AUDIT_SYS_OPERATIONS</td>
prompt <td colspan="2">
prompt </td>
prompt </tr><tr>
prompt <td class="sev4" colspan="4"></td>
prompt </tr>
prompt <tr><td></td>
prompt <td class="finding_head">Rapor</td> <td class="finding_cell">SYS kullanicisinin denetimi </td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Neyi inceliyoruz ?</td>
prompt <td class="finding_cell">SYS kullanici <b>SYSDBA / SYSOPER</b> olarak baglandiginda denetlenip denetlenmeyecegini belirler. <pre>
prompt </pre></td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Detaylar</td>
prompt <td class="finding_cell">
prompt <br>
prompt <br>
prompt Bu parametrenin <b>TRUE</b> olmasi gerekir. 
prompt <br>

SET MARKUP HTML   ON

SELECT
	NAME,
	VALUE
FROM
	V$SYSTEM_PARAMETER
WHERE
	UPPER( NAME ) = 'AUDIT_SYS_OPERATIONS';

SET MARKUP HTML   OFF

prompt </td><td></td></tr>
prompt <tr><td></td>
prompt </table>

prompt <table class="finding" cellpadding="4" border="0" role="presentation">
prompt <tr class="ruleid"><td></td>
prompt <td>AUDIT_TRAIL</td>
prompt <td colspan="2">
prompt </td>
prompt </tr><tr>
prompt <td class="sev4" colspan="4"></td>
prompt </tr>
prompt <tr><td></td>
prompt <td class="finding_head">Rapor</td> <td class="finding_cell">Audit kayitlarinin tutulmasi </td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Neyi inceliyoruz ?</td>
prompt <td class="finding_cell">Audit kayitlari veritabani yada isletim sistemi uzerinde tutulabilir. <pre>
prompt </pre></td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Detaylar</td>
prompt <td class="finding_cell">
prompt <br>
prompt <br>
prompt Bu parametrenin <b>DB</b> olmasi gerekir. 
prompt <br>

SET MARKUP HTML   ON

SELECT
	NAME,
	VALUE
FROM
	V$SYSTEM_PARAMETER
WHERE
	UPPER( NAME ) = 'AUDIT_TRAIL';

SET MARKUP HTML   OFF

prompt </td><td></td></tr>
prompt <tr><td></td>
prompt </table>

prompt <table class="finding" cellpadding="4" border="0" role="presentation">
prompt <tr class="ruleid"><td></td>
prompt <td>GLOBAL_NAMES</td>
prompt <td colspan="2">
prompt </td>
prompt </tr><tr>
prompt <td class="sev4" colspan="4"></td>
prompt </tr>
prompt <tr><td></td>
prompt <td class="finding_head">Rapor</td> <td class="finding_cell">DB Link kontrolleri </td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Neyi inceliyoruz ?</td>
prompt <td class="finding_cell">Veritabani uzerinde olusturulan db link adreslerinin baglandigi veritabani ile ayni isimde olmasina zorlayabilirsiniz. <pre>
prompt </pre></td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Detaylar</td>
prompt <td class="finding_cell">
prompt <br>
prompt <br>
prompt Bu deger kullanim sekline gore degisebilir. Tavsiye edilen deger <b>TRUE</b> dur. 
prompt <br>

SET MARKUP HTML   ON

SELECT
	NAME,
	VALUE
FROM
	V$SYSTEM_PARAMETER
WHERE
	UPPER( NAME ) = 'GLOBAL_NAMES';

SET MARKUP HTML   OFF

prompt </td><td></td></tr>
prompt <tr><td></td>
prompt </table>

prompt <table class="finding" cellpadding="4" border="0" role="presentation">
prompt <tr class="ruleid"><td></td>
prompt <td>LOCAL_LISTENER</td>
prompt <td colspan="2">
prompt </td>
prompt </tr><tr>
prompt <td class="sev4" colspan="4"></td>
prompt </tr>
prompt <tr><td></td>
prompt <td class="finding_head">Rapor</td> <td class="finding_cell">Veritabani local listener dinlenmesi </td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Neyi inceliyoruz ?</td>
prompt <td class="finding_cell">Local listener duzgun ayarlanmadiginda tns ataklarina maruz kalinabilir. <pre>
prompt </pre></td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Detaylar</td>
prompt <td class="finding_cell">
prompt <br>
prompt <br>
prompt Bu parametrenin <b>NULL olmamasi<b> gerekir. 
prompt <br>

SET MARKUP HTML   ON

SELECT
	NAME,
	VALUE
FROM
	V$SYSTEM_PARAMETER
WHERE
	UPPER( NAME ) = 'LOCAL_LISTENER';

SET MARKUP HTML   OFF

prompt </td><td></td></tr>
prompt <tr><td></td>
prompt </table>

prompt <table class="finding" cellpadding="4" border="0" role="presentation">
prompt <tr class="ruleid"><td></td>
prompt <td>DBA_PRIV_AUDIT_OPTS</td>
prompt <td colspan="2">
prompt </td>
prompt </tr><tr>
prompt <td class="sev4" colspan="4"></td>
prompt </tr>
prompt <tr><td></td>
prompt <td class="finding_head">Rapor</td> <td class="finding_cell">Oracle Database version bilgisi </td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Neyi inceliyoruz ?</td>
prompt <td class="finding_cell">Denetlenen DDL yetkileri. <pre>
prompt </pre></td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Detaylar</td>
prompt <td class="finding_cell">
prompt <br>
prompt <br>
prompt Bu bolumde denetlenen yetkiler gorunmektedir. 
prompt <br>

SET MARKUP HTML   ON

SELECT
	*
FROM
	DBA_PRIV_AUDIT_OPTS	
ORDER BY
	USER_NAME,
	PRIVILEGE;

SET MARKUP HTML   OFF

prompt </td><td></td></tr>
prompt <tr><td></td>
prompt </table>

prompt <table class="finding" cellpadding="4" border="0" role="presentation">
prompt <tr class="ruleid"><td></td>
prompt <td>DBA_STMT_AUDIT_OPTS</td>
prompt <td colspan="2">
prompt </td>
prompt </tr><tr>
prompt <td class="sev4" colspan="4"></td>
prompt </tr>
prompt <tr><td></td>
prompt <td class="finding_head">Rapor</td> <td class="finding_cell">Oracle Database version bilgisi </td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Neyi inceliyoruz ?</td>
prompt <td class="finding_cell">Denetlenen DDL yetkileri. <pre>
prompt </pre></td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Detaylar</td>
prompt <td class="finding_cell">
prompt <br>
prompt <br>
prompt Bu bolumde denetlenen komutlar gorunmektedir. 
prompt <br>

SET MARKUP HTML   ON

SELECT
	*
FROM
	DBA_STMT_AUDIT_OPTS
ORDER BY
	USER_NAME,
	AUDIT_OPTION;

SET MARKUP HTML   OFF

prompt </td><td></td></tr>
prompt <tr><td></td>
prompt </table>

prompt <table class="finding" cellpadding="4" border="0" role="presentation">
prompt <tr class="ruleid"><td></td>
prompt <td>DBA_STMT_AUDIT_OPTS</td>
prompt <td colspan="2">
prompt </td>
prompt </tr><tr>
prompt <td class="sev4" colspan="4"></td>
prompt </tr>
prompt <tr><td></td>
prompt <td class="finding_head">Rapor</td> <td class="finding_cell">Oracle Database version bilgisi </td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Neyi inceliyoruz ?</td>
prompt <td class="finding_cell">Denetlenen DDL yetkileri. <pre>
prompt </pre></td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Detaylar</td>
prompt <td class="finding_cell">
prompt <br>
prompt <br>
prompt Bu bolumde denetlenen nesneler gorunmektedir. 
prompt <br>

SET MARKUP HTML   ON

SELECT
	*
FROM
	DBA_OBJ_AUDIT_OPTS
ORDER BY
	OWNER,
	OBJECT_NAME;

SET MARKUP HTML   OFF

prompt </td><td></td></tr>
prompt <tr><td></td>
prompt </table>


prompt <table class="finding" cellpadding="4" border="0" role="presentation">
prompt <tr class="ruleid"><td></td>
prompt <td>PUBLIC Database Links </td>
prompt <td colspan="2">
prompt </td>
prompt </tr><tr>
prompt <td class="sev4" colspan="4"></td>
prompt </tr>
prompt <tr><td></td>
prompt <td class="finding_head">Rapor</td> <td class="finding_cell">Oracle Database uzerindeki public db link adresleri </td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Neyi inceliyoruz ?</td>
prompt <td class="finding_cell">Oracle database uzerinde acilmis public db link kullanimlari. <pre>
prompt </pre></td><td></td></tr>
prompt <tr><td></td>
prompt <td class="finding_head">Detaylar</td>
prompt <td class="finding_cell">
prompt <br>
prompt <br>
prompt Oracle Database üzerinde public db link olmamasi gerekir. 
prompt <br>
prompt <br>

SET MARKUP HTML   ON

SELECT
	*
FROM
	DBA_DB_LINKS
WHERE 
	OWNER = 'PUBLIC'
ORDER BY
	HOST;

SET MARKUP HTML   OFF

prompt </td><td></td></tr>
prompt <tr><td></td>
prompt </table>




spool off

Prompt	
Prompt *****  TAMAMLANDI  ******

exit
