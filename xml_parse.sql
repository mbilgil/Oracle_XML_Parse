SELECT EXTRACT      (VALUE (xml_parse), 'book/@id')           AS ID,
       EXTRACTVALUE (VALUE (xml_parse), 'book/author/text()') AS Author,
       EXTRACTVALUE (VALUE (xml_parse), 'book/title/text()')  AS Title,
       EXTRACTVALUE (VALUE (xml_parse), 'book/price/text()')  AS Price      
  FROM TABLE (
           XMLSEQUENCE (
               EXTRACT (
                   (SELECT XMLType.createXML ([your_column_name])
                      FROM [your_table_name] ),
                   '/catalog/book'))) AS xml_parse
