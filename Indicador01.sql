
SELECT
		DISTINCT ON (b.dt_inicial_atendimento)  b.dt_inicial_atendimento,
		b.co_seq_fat_atd_ind,
		a.co_seq_fat_cidadao_pec,
		a.nu_cpf_cidadao,
		a.nu_cns ,
		a.no_cidadao ,
		CASE 
				WHEN to_date(b.co_dim_tempo_dum::text, 'YYYYMMDD') = '3000-12-31' THEN NULL 
				ELSE to_date(b.co_dim_tempo_dum::text, 'YYYYMMDD')
		END AS "DUM" , 
		e.no_equipe,
		f.no_profissional,
		DATE (b.dt_inicial_atendimento) AS "Data Atendimento",
		b.ds_filtro_cids,
		b.ds_filtro_ciaps,
		b.ds_filtro_proced_avaliados,
		CASE 
			WHEN b.ds_filtro_proced_avaliados LIKE '%ABEX019%' 
			OR b.ds_filtro_proced_avaliados LIKE '%0202031110%'
			OR b.ds_filtro_proced_avaliados LIKE '%0202031179%'
			OR b.ds_filtro_proced_avaliados LIKE '%0214010074%'
			OR b.ds_filtro_proced_avaliados LIKE '%0214010082%'
			THEN 'Sim'
			ELSE 'Não'
			END AS "Testagem Sífilis",
		CASE 
			WHEN b.ds_filtro_proced_avaliados LIKE '%ABEX018%' 
			OR b.ds_filtro_proced_avaliados LIKE '%0202030300%'
			OR b.ds_filtro_proced_avaliados LIKE '%021401058%'
			OR b.ds_filtro_proced_avaliados LIKE '%0214010040%'
			THEN 'Sim'
			ELSE 'Não'
			END AS "Testagem HIV"
			
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

WHERE 
		c.co_dim_procedimento IN (2169) 
AND 
		d.st_ativo = 1
AND 
		b.ds_filtro_ciaps IN ('|W78|') 		
AND
		b.co_dim_tempo > 20200100

ORDER BY 
		b.dt_inicial_atendimento 

