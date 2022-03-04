SELECT

DISTINCT ON (b.co_seq_fat_atd_ind) b.co_seq_fat_atd_ind,
b.co_dim_tempo,
		b.co_seq_fat_atd_ind,
		a.co_seq_fat_cidadao_pec,
		a.nu_cpf_cidadao,
		a.nu_cns ,
		a.no_cidadao ,
		e.no_equipe,
		f.no_profissional,
		DATE (b.dt_inicial_atendimento) AS "Data Atendimento",
		b.ds_filtro_cids,
		b.ds_filtro_ciaps,
		b.ds_filtro_proced_avaliados,
		CASE 
			WHEN b.ds_filtro_proced_solicitados LIKE '%ABPG010%' 
			OR b.ds_filtro_proced_solicitados LIKE '%0201020033%'
			THEN 'Sim'
			ELSE 'Não'
			END AS "Coleta de Citopatológico"
			
FROM tb_fat_cidadao_pec AS a 
		INNER JOIN tb_fat_atendimento_individual AS b 
				ON b.co_fat_cidadao_pec = a.co_seq_fat_cidadao_pec 
		INNER JOIN tb_fat_proced_atend_proced AS c 
				ON c.co_fat_cidadao_pec = b.co_fat_cidadao_pec 
		INNER JOIN tb_cidadao AS d 
				ON d.co_seq_cidadao = a.co_cidadao
		INNER JOIN tb_dim_equipe AS e 
				ON b.co_dim_equipe_1 = e.co_seq_dim_equipe 
		INNER JOIN tb_dim_profissional AS f 
				ON b.co_dim_profissional_1 = f.co_seq_dim_profissional 

 
AND 
		d.st_ativo = 1
/*
		AND 
		b.ds_filtro_ciaps IN ('|W78|') 	*/	
AND 
		a.co_dim_sexo = 2 
AND
		b.co_dim_tempo > 20180400
AND 
		b.co_dim_faixa_etaria BETWEEN 10 AND 17 
AND 
		b.ds_filtro_proced_solicitados LIKE ANY (ARRAY['%ABPG010%', '%0201020033%']) 
		

ORDER BY 
		b.co_seq_fat_atd_ind