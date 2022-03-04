
SELECT
	DISTINCT ON (c.co_seq_fat_atd_odnt) c.co_seq_fat_atd_odnt ,
	a.nu_cns AS "CNS",
	a.no_cidadao AS "Nome do Cidadão",
	CASE 
				WHEN to_date(b.co_dim_tempo_dum::TEXT, 'YYYYMMDD') = '3000-12-31' THEN NULL 
				ELSE to_date(b.co_dim_tempo_dum::TEXT, 'YYYYMMDD')
		END AS "DUM" , 
	TO_DATE(a.co_dim_tempo_nascimento::TEXT, 'YYYYMMDD') AS "Data de Nascimento",
	d.no_profissional AS "Nome do Profissional",
	e.no_equipe AS "Equipe do Profissional",
	TO_DATE (c.co_dim_tempo::TEXT, 'YYYYMMDD') AS "Data do Atendimento" ,
	f.ds_tipo_consulta_odonto AS "Tipo de Consulta Odontológica"
FROM 
	tb_fat_cidadao_pec AS a 
	INNER JOIN tb_fat_atendimento_individual AS b 
	ON a.co_seq_fat_cidadao_pec = b.co_fat_cidadao_pec 
	
	INNER JOIN tb_fat_atendimento_odonto AS c
	ON c.co_fat_cidadao_pec = b.co_fat_cidadao_pec  
	
	INNER JOIN tb_dim_profissional AS d 
	ON c.co_dim_profissional_1 = d.co_seq_dim_profissional 
	
	INNER JOIN tb_dim_equipe AS e 
	ON c.co_dim_equipe_1 = e.co_seq_dim_equipe 
	
	INNER JOIN tb_dim_tipo_consulta_odonto AS f 
	ON c.co_dim_tipo_consulta = f.co_seq_dim_tipo_cnsulta_odonto 

WHERE 
	a.co_cidadao IS NOT NULL 
AND 
	b.ds_filtro_ciaps IN ('|W78|')
AND 
	c.co_dim_tempo > 20200100

