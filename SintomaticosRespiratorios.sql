SELECT a.nu_cpf_cidadao          AS "CPF", 
       a.nu_cns                  AS "CNS", 
       b.no_cidadao              AS "Nome", 
       b.nu_telefone_residencial AS "Telefone Residencial", 
       b.nu_telefone_celular     AS "Telefone Celular", 
       b.nu_telefone_contato     AS "Telefone de Referência", 
       b.ds_logradouro           AS "Logradouro", 
       b.nu_numero               AS "Número", 
       b.ds_complemento          AS "Complemento", 
       b.no_bairro               AS "Bairro", 
       (SELECT CASE 
                 WHEN a.ds_filtro_cids LIKE '%U071%'THEN 'Sim' 
                 ELSE 'Não' 
               END AS "U07.1"), 
       (SELECT CASE 
                 WHEN a.ds_filtro_cids LIKE '%J11%'THEN 'Sim' 
                 ELSE 'Não' 
               END AS "J11"), 
       (SELECT CASE 
                 WHEN a.ds_filtro_cids LIKE '%B342%'THEN 'Sim' 
                 ELSE 'Não' 
               END AS "B34.2"), 
       (SELECT CASE 
                 WHEN a.ds_filtro_cids LIKE '%Z209%'THEN 'Sim' 
                 ELSE 'Não' 
               END AS "Z20.9"), 
       (SELECT CASE 
                 WHEN a.ds_filtro_ciaps LIKE '%R74%'THEN 'Sim' 
                 ELSE 'Não' 
               END AS "R74"), 
       dt.dt_registro            AS "Data Atendimento", 
       a.ds_filtro_cids          AS "CIDs Avaliadas", 
       a.ds_filtro_ciaps         AS "CIAPs avaliadas" 
FROM   tb_fat_atendimento_individual AS a 
       JOIN tb_dim_tempo AS dt 
         ON a.co_dim_tempo = dt.co_seq_dim_tempo 
       LEFT JOIN tb_fat_cidadao_pec AS c 
              ON a.co_fat_cidadao_pec = c.co_seq_fat_cidadao_pec 
       LEFT JOIN tb_cidadao AS b 
              ON c.co_cidadao = b.co_seq_cidadao 
WHERE  ( a.ds_filtro_cids LIKE '%U071%' 
          OR a.ds_filtro_cids LIKE '%J11%' 
          OR a.ds_filtro_cids LIKE '%B342%' 
          OR a.ds_filtro_cids LIKE '%Z209%' 
          OR a.ds_filtro_ciaps LIKE '%R74%' ) 
       AND a.co_dim_tempo > 20200300 
ORDER  BY "Nome";