SELECT DISTINCT
   ON (b.co_seq_fat_vacinacao) b.co_seq_fat_vacinacao,
   a.co_seq_fat_cidadao_pec,
   c.co_dim_imunobiologico,
   e.no_imunobiologico,
   c.co_dim_dose_imunobiologico,
   f.no_dose_imunobiologico,
   c.co_fat_vacinacao,
   a.no_cidadao,
   b.co_dim_faixa_etaria,
   g.ds_faixa_etaria,
   to_date(a.co_dim_tempo_nascimento::TEXT, 'YYYYMMDD'),
   a.nu_cns,
   a.nu_cpf_cidadao,
   c.co_dim_tempo 
FROM
   tb_fat_cidadao_pec AS a 
   INNER JOIN
      tb_fat_vacinacao AS b 
      ON (b.co_fat_cidadao_pec = a.co_seq_fat_cidadao_pec) 
   INNER JOIN
      tb_fat_vacinacao_vacina AS c 
      ON (c.co_fat_vacinacao = b.co_seq_fat_vacinacao) 
   INNER JOIN
      tb_dim_faixa_etaria AS d 
      ON (d.co_seq_dim_faixa_etaria = b.co_dim_faixa_etaria) 
   INNER JOIN
      tb_dim_imunobiologico AS e 
      ON (e.co_seq_dim_imunobiologico = c.co_dim_imunobiologico) 
   INNER JOIN
      tb_dim_dose_imunobiologico AS f 
      ON (f.co_seq_dim_dose_imunobiologico = c.co_dim_dose_imunobiologico) 
   INNER JOIN
      tb_dim_faixa_etaria AS g 
      ON(g.co_seq_dim_faixa_etaria = b.co_dim_faixa_etaria) 
WHERE
   b.co_dim_faixa_etaria IN 
   (
      1,
      2
   )
   AND c.co_dim_imunobiologico IN 
   (
      9,
      13,
      14
   )
   AND c.co_dim_tempo > 20200100