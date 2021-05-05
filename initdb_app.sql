create table export_estrazione_riferimento
(
	id bigserial not null
		constraint export_estrazione_riferimento_pkey
			primary key,
	data_creazione timestamp,
	data_modifica timestamp,
	deleted char,
	amministrazione varchar(255),
	articolazione_programma_id bigint,
	attachment_id bigint,
	protocollo varchar(255),
	user_id bigint,
	ticket bigint,
	id_amministrazione_igrue varchar(255),
	id_sistema_igrue varchar(255),
	modalita varchar(255),
	data_trasmissione varchar(50),
	scadenza_mon_id bigint,
	txt_estratto char default 'N'::bpchar not null,
	controlli_effettuati char default 'N'::bpchar not null,
	tipo_export varchar(255) default 'DELTA'::character varying,
	codice_programma varchar(255),
	den_programma varchar(1000)
);


create index export_estrazione_riferimento_user_id
	on export_estrazione_riferimento (user_id);

create index ix_eer_art_prog_id
	on export_estrazione_riferimento (articolazione_programma_id);

create index ix_eer_id_amm_igrue
	on export_estrazione_riferimento (id_amministrazione_igrue);

create index ix_eer_id_sis_igrue
	on export_estrazione_riferimento (id_sistema_igrue);


create table if not exists export_ap00
(
	id bigserial not null
		constraint export_ap00_pkey
			primary key,
	cod_locale_progetto varchar(60),
	codice_proc_att_orig varchar(30),
	cup varchar(15),
	data_fine_effettiva varchar(10),
	data_fine_prevista varchar(10),
	data_inizio varchar(10),
	flg_cancellazione char,
	sintesi_prg varchar(1300),
	tip_proc_att_orig varchar(2),
	tipo_aiuto varchar(2),
	tipo_operazione varchar(11),
	titolo_progetto varchar(500),
	estrazione_riferimento_id bigint,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char,
	valido char default 'Y'::bpchar not null,
	scartato char default 'N'::bpchar not null
);

create index ap00_prog_rifid_ix
	on export_ap00 (cod_locale_progetto, estrazione_riferimento_id);

create index ix_eap00_cod_loc_prog
	on export_ap00 (cod_locale_progetto);

create index ix_eap00_e_rif_id
	on export_ap00 (estrazione_riferimento_id);

create index ix_eap00_tpao
	on export_ap00 (tip_proc_att_orig);

create table if not exists export_ap01
(
	id bigserial not null
		constraint export_ap01_pkey
			primary key,
	cod_locale_progetto varchar(60),
	cod_proc_att varchar(30),
	flg_cancellazione char,
	estrazione_riferimento_id bigint,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char
);

create index ap01_prog_rifid_ix
	on export_ap01 (cod_locale_progetto, estrazione_riferimento_id);

create index ix_eap01_cod_loc
	on export_ap01 (cod_locale_progetto);

create index ix_eap01_cod_proc
	on export_ap01 (cod_proc_att);

create index ix_eap01_e_rif_id
	on export_ap01 (estrazione_riferimento_id);

create table if not exists export_ap02
(
	id bigserial not null
		constraint export_ap02_pkey
			primary key,
	cod_locale_progetto varchar(60),
	cod_prg_complesso varchar(30),
	cod_vulnerabili varchar(3),
	flg_cancellazione char,
	fondo_di_fondi char,
	generatore_entrate char,
	grande_progetto varchar(50),
	liv_istituzione_str_fin varchar(3),
	tipo_localizzazione varchar(5),
	estrazione_riferimento_id bigint,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char
);

create index ap02_prog_rifid_ix
	on export_ap02 (cod_locale_progetto, estrazione_riferimento_id);

create index ix_eap02_cod_loc
	on export_ap02 (cod_locale_progetto);

create index ix_eap02_e_rif_id
	on export_ap02 (estrazione_riferimento_id);

create table if not exists export_ap03
(
	id bigserial not null
		constraint export_ap03_pkey
			primary key,
	cod_classificazione varchar(200),
	cod_locale_progetto varchar(60),
	cod_programma varchar(50),
	flg_cancellazione char,
	tipo_class varchar(10),
	estrazione_riferimento_id bigint,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char
);


create index ap03_prog_rifid_ix
	on export_ap03 (cod_locale_progetto, estrazione_riferimento_id);

create index ix_eap03_cod_cls
	on export_ap03 (cod_classificazione);

create index ix_eap03_cod_loc
	on export_ap03 (cod_locale_progetto);

create index ix_eap03_cod_pr
	on export_ap03 (cod_programma);

create index ix_eap03_e_rif_id
	on export_ap03 (estrazione_riferimento_id);

create index ix_eap03_tc
	on export_ap03 (tipo_class);

create table if not exists export_ap04
(
	id bigserial not null
		constraint export_ap04_pkey
			primary key,
	cod_locale_progetto varchar(60),
	cod_programma varchar(50),
	specifica_stato varchar(10),
	stato varchar(1),
	estrazione_riferimento_id bigint,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char
);

create index ap04_prog_rifid_ix
	on export_ap04 (cod_locale_progetto, estrazione_riferimento_id);

create index ix_e04_cod_loc_prog
	on export_ap04 (cod_locale_progetto);

create index ix_eap04_cod_pr
	on export_ap04 (cod_programma);

create index ix_eap04_e_rif_id
	on export_ap04 (estrazione_riferimento_id);

create index ix_eap04_stato
	on export_ap04 (stato);

create table if not exists export_ap05
(
	id bigserial not null
		constraint export_ap05_pkey
			primary key,
	cod_locale_progetto varchar(60),
	cod_stru_att varchar(10),
	flg_cancellazione char,
	estrazione_riferimento_id bigint,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char
);

create index ap05_prog_rifid_ix
	on export_ap05 (cod_locale_progetto, estrazione_riferimento_id);

create index ix_eap05_cod_loc
	on export_ap05 (cod_locale_progetto);

create index ix_eap05_cod_pr
	on export_ap05 (cod_stru_att);

create index ix_eap05_e_rif_id
	on export_ap05 (estrazione_riferimento_id);

create table if not exists export_ap06
(
	id bigserial not null
		constraint export_ap06_pkey
			primary key,
	cap varchar(5),
	cod_comune varchar(3),
	cod_locale_progetto varchar(60),
	cod_provincia varchar(3),
	cod_regione varchar(3),
	flg_cancellazione char,
	indirizzo varchar(1000),
	estrazione_riferimento_id bigint,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char
);

create index ap06_prog_rifid_ix
	on export_ap06 (cod_locale_progetto, estrazione_riferimento_id);

create index ix_eap06_cod_cap
	on export_ap06 (cap);

create index ix_eap06_cod_cc
	on export_ap06 (cod_comune);

create index ix_eap06_cod_cp
	on export_ap06 (cod_provincia);

create index ix_eap06_cod_cr
	on export_ap06 (cod_regione);

create index ix_eap06_cod_loc
	on export_ap06 (cod_locale_progetto);

create index ix_eap06_e_rif_id
	on export_ap06 (estrazione_riferimento_id);


create table if not exists export_fn00
(
	id bigserial not null
		constraint export_fn00_pkey
			primary key,
	cf_cofinanz varchar(16),
	cod_del_cipe varchar(6),
	cod_fondo varchar(10),
	cod_locale_progetto varchar(60),
	cod_localizzazione varchar(9),
	cod_norma varchar(5),
	flg_cancellazione char,
	importo varchar(20),
	estrazione_riferimento_id bigint,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char
);

create index fn00_prog_rifid_ix
	on export_fn00 (cod_locale_progetto, estrazione_riferimento_id);

create index ix_efn00_cf
	on export_fn00 (cod_fondo);

create index ix_efn00_cod_loc_prog
	on export_fn00 (cod_locale_progetto);

create index ix_efn00_e_rif_id
	on export_fn00 (estrazione_riferimento_id);

create table if not exists export_fn01
(
	id bigserial not null
		constraint export_fn01_pkey
			primary key,
	cod_liv_gerarchico varchar(100),
	cod_locale_progetto varchar(60),
	cod_programma varchar(50),
	flg_cancellazione char,
	importo_ammesso varchar(20),
	estrazione_riferimento_id bigint,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char
);

create index fn01_prog_rifid_ix
	on export_fn01 (cod_locale_progetto, estrazione_riferimento_id);

create index ix_efn01_clg
	on export_fn01 (cod_liv_gerarchico);

create index ix_efn01_cod_loc_prog
	on export_fn01 (cod_locale_progetto);

create index ix_efn01_e_rif_id
	on export_fn01 (estrazione_riferimento_id);

create table if not exists export_fn02
(
	id bigserial not null
		constraint export_fn02_pkey
			primary key,
	cod_locale_progetto varchar(60),
	flg_cancellazione char,
	importo varchar(20),
	voce_spesa varchar(10),
	estrazione_riferimento_id bigint,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char
);

create index fn02_prog_rifid_ix
	on export_fn02 (cod_locale_progetto, estrazione_riferimento_id);

create index ix_efn02_cod_loc_prog
	on export_fn02 (cod_locale_progetto);

create index ix_efn02_vs
	on export_fn02 (voce_spesa);

create index ix_efn02e_rif_id
	on export_fn02 (estrazione_riferimento_id);

create table if not exists export_fn03
(
	id bigserial not null
		constraint export_fn03_pkey
			primary key,
	anno_piano varchar(4),
	cod_locale_progetto varchar(60),
	flg_cancellazione char,
	imp_da_realizzare varchar(20),
	imp_realizzato varchar(20),
	estrazione_riferimento_id bigint,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char
);

create index fn03_prog_rifid_ix
	on export_fn03 (cod_locale_progetto, estrazione_riferimento_id);

create index ix_efn03_cod_loc_prog
	on export_fn03 (cod_locale_progetto);

create index ix_efn03e_rif_id
	on export_fn03 (estrazione_riferimento_id);

create table if not exists export_fn04
(
	id bigserial not null
		constraint export_fn04_pkey
			primary key,
	causale_disimpegno varchar(3),
	cod_impegno varchar(20),
	cod_locale_progetto varchar(60),
	data_impegno varchar(10),
	flg_cancellazione char,
	importo_impegno varchar(20),
	note_impegno varchar(1000),
	tipologia_impegno varchar(5),
	estrazione_riferimento_id bigint,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char
);

create index fn04_prog_rifid_ix
	on export_fn04 (cod_locale_progetto, estrazione_riferimento_id);

create index ix_efn04_cod_loc_prog
	on export_fn04 (cod_locale_progetto);

create index ix_efn04_di
	on export_fn04 (data_impegno);

create index ix_efn04_fc
	on export_fn04 (flg_cancellazione);

create index ix_efn04_ti
	on export_fn04 (tipologia_impegno);

create index ix_efn04e_rif_id
	on export_fn04 (estrazione_riferimento_id);

create table if not exists export_fn05
(
	id bigserial not null
		constraint export_fn05_pkey
			primary key,
	causale_disimpegno_amm varchar(3),
	cod_impegno varchar(20),
	cod_liv_gerarchico varchar(100),
	cod_locale_progetto varchar(60),
	cod_programma varchar(50),
	data_imp_amm varchar(10),
	data_impegno varchar(10),
	flg_cancellazione char,
	importo_imp_amm varchar(20),
	note_imp varchar(1000),
	tipologia_imp_amm varchar(5),
	tipologia_impegno varchar(5),
	estrazione_riferimento_id bigint,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char
);

create index fn05_prog_rifid_ix
	on export_fn05 (cod_locale_progetto, estrazione_riferimento_id);

create index ix_efn05_clg
	on export_fn05 (cod_liv_gerarchico);

create index ix_efn05_cod_loc_prog
	on export_fn05 (cod_locale_progetto);

create index ix_efn05_dia
	on export_fn05 (data_imp_amm);

create index ix_efn05_tia
	on export_fn05 (tipologia_imp_amm);

create index ix_efn05e_rif_id
	on export_fn05 (estrazione_riferimento_id);

create table if not exists export_fn06
(
	id bigserial not null
		constraint export_fn06_pkey
			primary key,
	causale_pagamento varchar(3),
	cod_locale_progetto varchar(60),
	cod_pagamento varchar(20),
	data_pagamento varchar(10),
	flg_cancellazione char,
	importo_pag varchar(20),
	note_pag varchar(1000),
	tipologia_pag varchar(5),
	estrazione_riferimento_id bigint,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char
);

create index fn06_prog_rifid_ix
	on export_fn06 (cod_locale_progetto, estrazione_riferimento_id);

create index ix_efn06_cod_loc_prog
	on export_fn06 (cod_locale_progetto);

create index ix_efn06_data_pag
	on export_fn06 (data_pagamento);

create index ix_efn06_fc
	on export_fn06 (flg_cancellazione);

create index ix_efn06_tp
	on export_fn06 (tipologia_pag);

create index ix_efn06e_rif_id
	on export_fn06 (estrazione_riferimento_id);

create table if not exists export_fn07
(
	id bigserial not null
		constraint export_fn07_pkey
			primary key,
	causale_pag_amm varchar(3),
	cod_liv_gerarchico varchar(100),
	cod_locale_progetto varchar(60),
	cod_pagamento varchar(20),
	cod_programma varchar(50),
	data_pag_amm varchar(10),
	data_pagamento varchar(10),
	flg_cancellazione char,
	importo_pag_amm varchar(20),
	note_pag varchar(1000),
	tipologia_pag varchar(5),
	tipologia_pag_amm varchar(5),
	estrazione_riferimento_id bigint,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char
);

create index fn07_prog_rifid_ix
	on export_fn07 (cod_locale_progetto, estrazione_riferimento_id);

create index ix_efn07_clg
	on export_fn07 (cod_liv_gerarchico);

create index ix_efn07_cod_loc_prog
	on export_fn07 (cod_locale_progetto);

create index ix_efn07_cp
	on export_fn07 (cod_programma);

create index ix_efn07_dpa
	on export_fn07 (data_pag_amm);

create index ix_efn07_fc
	on export_fn07 (flg_cancellazione);

create index ix_efn07_tpa
	on export_fn07 (tipologia_pag_amm);

create index ix_efn07e_rif_id
	on export_fn07 (estrazione_riferimento_id);

create table if not exists export_fn08
(
	id bigserial not null
		constraint export_fn08_pkey
			primary key,
	cod_locale_progetto varchar(60),
	cod_pagamento varchar(20),
	codice_fiscale varchar(16),
	data_pagamento varchar(10),
	flag_soggetto_pubblico char,
	flg_cancellazione char,
	importo varchar(20),
	tipo_percettore varchar(3),
	tipologia_pag varchar(5),
	estrazione_riferimento_id bigint,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char
);

create index fn08_prog_rifid_ix
	on export_fn08 (cod_locale_progetto, estrazione_riferimento_id);

create index ix_efn08_cod_loc_prog
	on export_fn08 (cod_locale_progetto);

create index ix_efn08_tp
	on export_fn08 (tipologia_pag);

create index ix_efn08e_rif_id
	on export_fn08 (estrazione_riferimento_id);

create table if not exists export_fn09
(
	id bigserial not null
		constraint export_fn09_pkey
			primary key,
	cod_liv_gerarchico varchar(100) not null,
	cod_locale_progetto varchar(60),
	data_domanda varchar(10),
	flg_cancellazione char,
	id_domanda_pagamento varchar(100),
	importo_spesa_pub varchar(20),
	importo_spesa_tot varchar(20),
	tipologia_importo varchar(1),
	estrazione_riferimento_id bigint,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char
);

create index fn09_prog_rifid_ix
	on export_fn09 (cod_locale_progetto, estrazione_riferimento_id);

create index ix_efn09_cod_loc_prog
	on export_fn09 (cod_locale_progetto);

create index ix_efn09e_rif_id
	on export_fn09 (estrazione_riferimento_id);

create table if not exists export_fn10
(
	id bigserial not null
		constraint export_fn10_pkey
			primary key,
	cod_fondo varchar(10),
	cod_locale_progetto varchar(60),
	flg_cancellazione char,
	importo varchar(20),
	estrazione_riferimento_id bigint,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char
);

create index fn10_prog_rifid_ix
	on export_fn10 (cod_locale_progetto, estrazione_riferimento_id);

create index ix_efn10_cod_loc_prog
	on export_fn10 (cod_locale_progetto);

create index ix_efn10e_rif_id
	on export_fn10 (estrazione_riferimento_id);


create table if not exists export_fo00
(
	id bigserial not null
		constraint export_fo00_pkey
			primary key,
	cod_attestazione_finale varchar(3),
	cod_contenuto_formativo varchar(10),
	cod_corso varchar(60),
	cod_criteri_selezione varchar(3),
	cod_locale_progetto varchar(60),
	cod_modalita_formativa varchar(10),
	cod_qualifica varchar(15),
	data_avvio varchar(10),
	data_conclusione varchar(10),
	docenti_tutor varchar(5),
	durata_aula varchar(5),
	durata_laboratorio varchar(5),
	durata_we varchar(5),
	esame_finale char,
	flag_voucher char,
	flg_cancellazione char,
	indice_annualita varchar(2),
	numero_annualita varchar(2),
	stage_tirocini char,
	titolo_corso varchar(1000),
	estrazione_riferimento_id bigint,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char
);

create index fo00_prog_rifid_ix
	on export_fo00 (cod_locale_progetto, estrazione_riferimento_id);

create index ix_efo00_cod_loc
	on export_fo00 (cod_locale_progetto);

create index ix_efo00_cod_pr
	on export_fo00 (cod_corso);

create index ix_efo00_e_rif_id
	on export_fo00 (estrazione_riferimento_id);

create table if not exists export_in00
(
	id bigserial not null
		constraint export_in00_pkey
			primary key,
	cod_indicatore varchar(80),
	cod_locale_progetto varchar(60),
	flg_cancellazione char,
	tipo_indicatore_di_risultato varchar(3),
	estrazione_riferimento_id bigint,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char
);

create index in00_prog_rifid_ix
	on export_in00 (cod_locale_progetto, estrazione_riferimento_id);

create index ix_ein00_cod_loc_prog
	on export_in00 (cod_locale_progetto);

create index ix_ein00_tir
	on export_in00 (tipo_indicatore_di_risultato);

create index ix_ein00e_rif_id
	on export_in00 (estrazione_riferimento_id);

create table if not exists export_in01
(
	id bigserial not null
		constraint export_in01_pkey
			primary key,
	cod_indicatore varchar(80),
	cod_locale_progetto varchar(60),
	flg_cancellazione char,
	tipo_indicatore_di_output varchar(3),
	val_programmato varchar(20),
	valore_realizzato varchar(20),
	estrazione_riferimento_id bigint,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char
);

create index in01_prog_rifid_ix
	on export_in01 (cod_locale_progetto, estrazione_riferimento_id);

create index ix_ein01_cod_loc_prog
	on export_in01 (cod_locale_progetto);

create index ix_ein01_vr
	on export_in01 (valore_realizzato);

create index ix_ein01e_rif_id
	on export_in01 (estrazione_riferimento_id);

create index ix_ein01tio
	on export_in01 (tipo_indicatore_di_output);

create table if not exists export_pa00
(
	id bigserial not null
		constraint export_pa00_pkey
			primary key,
	cod_aiuto_rna varchar(30),
	cod_proc_att varchar(30),
	cod_proc_att_locale varchar(30),
	cod_tipo_resp_proc varchar(2),
	data_avvio_procedura varchar(10),
	data_fine_procedura varchar(10),
	denom_resp_proc varchar(255),
	descr_procedura_att varchar(255),
	flag_aiuti char,
	flg_cancellazione char,
	tip_procedura_att varchar(2),
	estrazione_riferimento_id bigint,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char
);

create index ix_epa00_cod_loc_prog
	on export_pa00 (cod_proc_att);

create index ix_epa00_e_rif_id
	on export_pa00 (estrazione_riferimento_id);

create table if not exists export_pa01
(
	id bigserial not null
		constraint export_pa01_pkey
			primary key,
	cod_proc_att varchar(30),
	cod_programma varchar(50),
	flg_cancellazione char,
	importo varchar(20),
	estrazione_riferimento_id bigint,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char
);

create index ix_epa01_cod_proc
	on export_pa01 (cod_proc_att);

create index ix_epa01_e_rif_id
	on export_pa01 (estrazione_riferimento_id);

create table if not exists export_pg00
(
	id bigserial not null
		constraint export_pg00_pkey
			primary key,
	cig varchar(10),
	cod_locale_progetto varchar(60),
	cod_proc_agg varchar(30),
	data_aggiudicazione varchar(10),
	data_pubblicazione varchar(10),
	descr_procedura_agg varchar(1500),
	flg_cancellazione char,
	importo_aggiudicato varchar(20),
	importo_procedura_agg varchar(20),
	motivo_assenza_cig varchar(3),
	tipo_proc_agg varchar(10),
	estrazione_riferimento_id bigint,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char
);

create index ix_epg00_cod_loc
	on export_pg00 (cod_locale_progetto);

create index ix_epg00_cod_pr
	on export_pg00 (cod_proc_agg);

create index ix_epg00_e_rif_id
	on export_pg00 (estrazione_riferimento_id);

create index pg00_prog_rifid_ix
	on export_pg00 (cod_locale_progetto, estrazione_riferimento_id);

create table if not exists export_pr00
(
	id bigserial not null
		constraint export_pr00_pkey
			primary key,
	cod_fase varchar(10),
	cod_locale_progetto varchar(60),
	data_fine_effettiva varchar(10),
	data_fine_prevista varchar(10),
	data_inizio_effettiva varchar(10),
	data_inizio_prevista varchar(10),
	flg_cancellazione char,
	estrazione_riferimento_id bigint,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char
);

create index ix_epr00_cod_f
	on export_pr00 (cod_fase);

create index ix_epr00_cod_loc_prog
	on export_pr00 (cod_locale_progetto);

create index ix_epr00e_rif_id
	on export_pr00 (estrazione_riferimento_id);

create index pr00_prog_rifid_ix
	on export_pr00 (cod_locale_progetto, estrazione_riferimento_id);

create table if not exists export_pr01
(
	id bigserial not null
		constraint export_pr01_pkey
			primary key,
	cod_locale_progetto varchar(60),
	data_riferimento varchar(10),
	flg_cancellazione char,
	stato_progetto varchar(3),
	estrazione_riferimento_id bigint,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char
);

create index ix_epr01_cod_loc_prog
	on export_pr01 (cod_locale_progetto);

create index ix_epr01_dr
	on export_pr01 (data_riferimento);

create index ix_epr01e_rif_id
	on export_pr01 (estrazione_riferimento_id);

create index pr01_prog_rifid_ix
	on export_pr01 (cod_locale_progetto, estrazione_riferimento_id);

create table if not exists export_progetto_info
(
	id bigserial not null
		constraint export_progetto_info_pkey
			primary key,
	cod_locale_progetto varchar(60),
	titolo varchar(500),
	cup varchar(15),
	tipologia varchar(255),
	beneficiario varchar(255),
	valido char,
	cod_patt varchar(60),
	str_attuativo varchar(255),
	cod_articolazione_operativa varchar(255),
	cod_asse varchar(255),
	patt_id bigint,
	str_attuativo_id bigint,
	articolazione_operativa_id bigint,
	asse_id bigint,
	cod_gerarchico varchar(100),
	costo_ammesso varchar(20),
	pagamenti_ammessi varchar(20),
	impegni_ammessi varchar(20),
	totale_certificato varchar(20),
	estrazione_riferimento_id bigint,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char,
	id_progetto bigint,
	scartato char default 'N'::bpchar not null,
	is_pluriincluso char
);

create table if not exists export_sc00
(
	id bigserial not null
		constraint export_sc00_pkey
			primary key,
	cod_locale_progetto varchar(60),
	cod_ruolo_sog varchar(3),
	cod_uni_ipa varchar(10),
	codice_fiscale varchar(16),
	denominazione_sog varchar(255),
	flag_soggetto_pubblico char,
	flg_cancellazione char,
	forma_giuridica varchar(10),
	note varchar(1000),
	sett_att_economica varchar(120),
	estrazione_riferimento_id bigint,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char
);

create index ix_esc00_cod_loc_prog
	on export_sc00 (cod_locale_progetto);

create index ix_esc00_crs
	on export_sc00 (cod_ruolo_sog);

create index ix_esc00_e_rif_id
	on export_sc00 (estrazione_riferimento_id);

create index sc00_prog_rifid_ix
	on export_sc00 (cod_locale_progetto, estrazione_riferimento_id);

create table if not exists export_sc01
(
	id bigserial not null
		constraint export_sc01_pkey
			primary key,
	cittadinanza varchar(3),
	cod_istat_dom varchar(9),
	cod_istat_res varchar(9),
	cod_locale_progetto varchar(60),
	codice_corso varchar(60),
	codice_fiscale varchar(16),
	codice_vulnerabile_pa varchar(3),
	cond_mercato_ingresso varchar(3),
	data_nascita varchar(10),
	data_uscita varchar(10),
	durata_ricerca varchar(3),
	flg_cancellazione char,
	sesso varchar(1),
	stato_partecipante varchar(3),
	titolo_studio varchar(3),
	estrazione_riferimento_id bigint,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char
);

create index ix_esc01_cod_corso
	on export_sc01 (codice_corso);

create index ix_esc01_cod_fis
	on export_sc01 (codice_fiscale);

create index ix_esc01_cod_loc_prog
	on export_sc01 (cod_locale_progetto);

create index ix_esc01_e_rif_id
	on export_sc01 (estrazione_riferimento_id);

create index sc01_prog_rifid_ix
	on export_sc01 (cod_locale_progetto, estrazione_riferimento_id);

create table if not exists export_tr00
(
	id bigserial not null
		constraint export_tr00_pkey
			primary key,
	causale_trasferimento varchar(3),
	cf_sog_ricevente varchar(16),
	cod_programma varchar(50),
	cod_trasferimento varchar(60),
	data_trasferimento varchar(10),
	flag_soggetto_pubblico char,
	flg_cancellazione char,
	importo_trasferimento varchar(20),
	estrazione_riferimento_id bigint,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char
);

create index ix_etr00_cp
	on export_tr00 (cod_programma);

create index ix_etr00_ct
	on export_tr00 (cod_trasferimento);

create index ix_etr00_dt
	on export_tr00 (data_trasferimento);

create table errori_monitoraggio_progetto
(
	id bigserial not null
		constraint errori_monitoraggio_pkey
			primary key,
	codice_locale_progetto varchar(255) not null,
	controllo_id bigint not null,
	estrazione_id bigint not null,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char
);

create table controlli_igrue
(
	id bigserial not null
		constraint controlli_igrue_pkey
			primary key,
	cod_controllo varchar(255),
	dati_interessati varchar(255),
	tipologia varchar(255),
	dettaglio_controllo varchar(1000),
	dettaglio_errore varchar(1000),
	note varchar(1000),
	script_controllo text,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char
);

INSERT INTO public.controlli_igrue (id, cod_controllo, dati_interessati, tipologia, dettaglio_controllo, dettaglio_errore, note, script_controllo, data_creazione, data_modifica, deleted) VALUES (1, '001', 'ANAGRAFICA DEI PROGETTI E CLASSIFICAZIONI ', 'Presenza struttura ', 'Il controllo verifica se per il progetto è assente la classificazione Risultato Atteso (TC 12.7) nella struttura AP03-Classificazioni. Non può essere validato un progetto per cui è assente la Classificazione relativa al Risultato Atteso. ', 'E'' assente il Risultato Atteso', '', 'SELECT id AS export_ap00_id, cod_locale_progetto, estrazione_riferimento_id, ''N'' AS valid
FROM export_ap00
WHERE estrazione_riferimento_id = ${estrazione_id}
AND cod_locale_progetto NOT IN
    (

      SELECT DISTINCT cod_locale_progetto
      FROM export_ap03
      WHERE estrazione_riferimento_id = ${estrazione_id}
            AND tipo_class = ''RA''
    )', '2018-03-26 00:00:00.000000', '2018-03-26 00:00:00.000000', 'N');
INSERT INTO public.controlli_igrue (id, cod_controllo, dati_interessati, tipologia, dettaglio_controllo, dettaglio_errore, note, script_controllo, data_creazione, data_modifica, deleted) VALUES (2, '002', 'ANAGRAFICA DEI PROGETTI E CLASSIFICAZIONI ', 'Presenza struttura ', 'Il controllo verifica se per il progetto è assente la struttura AP05-Strumento attuativo. Non può essere validato un progetto per cui è assente l''associazione ad uno Strumento attuativo. ', 'E'' assente lo Strumento Attuativo.', '', 'SELECT id AS export_ap00_id, cod_locale_progetto, estrazione_riferimento_id, ''N'' AS valid
FROM export_ap00
WHERE estrazione_riferimento_id = ${estrazione_id}
AND cod_locale_progetto NOT IN
    (

      SELECT DISTINCT cod_locale_progetto
      FROM export_ap05
      WHERE estrazione_riferimento_id = ${estrazione_id}
    )', '2018-03-26 00:00:00.000000', '2018-03-26 00:00:00.000000', 'N');
INSERT INTO public.controlli_igrue (id, cod_controllo, dati_interessati, tipologia, dettaglio_controllo, dettaglio_errore, note, script_controllo, data_creazione, data_modifica, deleted) VALUES (3, '003', 'ANAGRAFICA DEI PROGETTI E CLASSIFICAZIONI ', 'Presenza struttura ', 'Il controllo verifica se per il progetto è assente la struttura AP06-Localizzazione Geografica. Non può essere validato un progetto per cui è assente la Localizzazione geografica. ', 'E'' assente una Localizzazione Geografica. ', '', 'SELECT id AS export_ap00_id, cod_locale_progetto, estrazione_riferimento_id, ''N'' AS valid
FROM export_ap00
WHERE estrazione_riferimento_id = ${estrazione_id}
AND cod_locale_progetto NOT IN
    (

      SELECT DISTINCT cod_locale_progetto
      FROM export_ap06
      WHERE estrazione_riferimento_id = ${estrazione_id}
    )', '2018-03-26 00:00:00.000000', '2018-03-26 00:00:00.000000', 'N');
INSERT INTO public.controlli_igrue (id, cod_controllo, dati_interessati, tipologia, dettaglio_controllo, dettaglio_errore, note, script_controllo, data_creazione, data_modifica, deleted) VALUES (4, '004', 'ANAGRAFICA DEI SOGGETTI CORRELATI AL PROGETTO ', 'Presenza struttura ', 'Il controllo verifica se per il progetto sono assenti soggetti correlati con ruolo di Programmatore o Beneficiario nella struttura SC00-Soggetti collegati (coinvolti nell''attuazione). Non può essere validato un progetto per cui risultano non valorizzati entrambi i ruoli di Programmatore e Beneficiario. ', 'E'' assente un Soggetto Collegato al progetto con ruolo di Programmatore o Beneficiario. ', '', 'SELECT id AS export_ap00_id, cod_locale_progetto, estrazione_riferimento_id, ''N'' AS valid
FROM export_ap00
WHERE estrazione_riferimento_id = ${estrazione_id}
AND cod_locale_progetto NOT IN
    (

      SELECT cod_locale_progetto
      FROM export_sc00
      WHERE estrazione_riferimento_id = ${estrazione_id}
      AND cod_ruolo_sog IN (''1'',''2'')
      GROUP BY cod_locale_progetto
      HAVING COUNT(cod_ruolo_sog) >= 2
    )', '2018-03-26 00:00:00.000000', '2018-03-26 00:00:00.000000', 'N');
INSERT INTO public.controlli_igrue (id, cod_controllo, dati_interessati, tipologia, dettaglio_controllo, dettaglio_errore, note, script_controllo, data_creazione, data_modifica, deleted) VALUES (5, '005', 'SEZIONE FINANZIARIA ', 'Presenza struttura ', 'Il controllo verifica se per il progetto è assente la struttura FN00-Finanziamento. Non può essere validato un progetto per cui è assente la valorizzazione del Finanziamento', 'E'' assente il Finanziamento', '', 'SELECT id AS export_ap00_id, cod_locale_progetto, estrazione_riferimento_id, ''N'' AS valid
FROM export_ap00
WHERE estrazione_riferimento_id = ${estrazione_id}
AND cod_locale_progetto NOT IN
    (
      SELECT DISTINCT cod_locale_progetto
      FROM export_fn00
      WHERE estrazione_riferimento_id = ${estrazione_id}
    )', '2018-03-26 00:00:00.000000', '2018-03-26 00:00:00.000000', 'N');
INSERT INTO public.controlli_igrue (id, cod_controllo, dati_interessati, tipologia, dettaglio_controllo, dettaglio_errore, note, script_controllo, data_creazione, data_modifica, deleted) VALUES (6, '006', 'SEZIONE FINANZIARIA ', 'Presenza struttura ', 'Il controllo verifica se per il progetto è assente la struttura FN01-Costo ammesso. Non può essere validato un progetto per cui è assente la valorizzazione del Costo ammesso', 'E'' assente il Costo ammesso', '', 'SELECT id AS export_ap00_id, cod_locale_progetto, estrazione_riferimento_id, ''N'' AS valid
FROM export_ap00
WHERE estrazione_riferimento_id = ${estrazione_id}
AND cod_locale_progetto NOT IN
    (
      SELECT DISTINCT cod_locale_progetto
      FROM export_fn01
      WHERE estrazione_riferimento_id = ${estrazione_id}
    )
', '2018-03-26 00:00:00.000000', '2018-03-26 00:00:00.000000', 'N');
INSERT INTO public.controlli_igrue (id, cod_controllo, dati_interessati, tipologia, dettaglio_controllo, dettaglio_errore, note, script_controllo, data_creazione, data_modifica, deleted) VALUES (7, '007', 'SEZIONE INDICATORI DI RISULTATO E FISICI ', 'Presenza struttura ', 'Il controllo verifica se per il progetto è assente la struttura IN00-Indicatori di risultato con almeno un Indicatore di Risultato valorizzato di tipologia: COM = Comune nazionale/comunitario oppure DPR = Definito dal Programma. Secondo i valori definiti nelle rispettive Tabelle di Contesto TC42-TC43. Non può essere validato un progetto per cui è assente l’associazione ad un Indicatore di Risultato (Comune o di Programma). ', 'E'' assente un Indicatore di Risultato.', '', 'SELECT id AS export_ap00_id, cod_locale_progetto, estrazione_riferimento_id, ''N'' AS valid
FROM export_ap00
WHERE estrazione_riferimento_id = ${estrazione_id}
AND cod_locale_progetto NOT IN
    (
      SELECT DISTINCT cod_locale_progetto
      FROM export_in00
      WHERE estrazione_riferimento_id = ${estrazione_id}
      AND tipo_indicatore_di_risultato IN (''COM'', ''DPR'')
    )', '2018-03-26 00:00:00.000000', '2018-03-26 00:00:00.000000', 'N');
INSERT INTO public.controlli_igrue (id, cod_controllo, dati_interessati, tipologia, dettaglio_controllo, dettaglio_errore, note, script_controllo, data_creazione, data_modifica, deleted) VALUES (8, '008', 'SEZIONE INDICATORI DI RISULTATO E FISICI ', 'Presenza struttura ', 'Il controllo verifica se per il progetto è assente la struttura IN01-Indicatori di Output con almeno un Indicatore di Output Comune valorizzato di tipologia: COM = Comune nazionale/comunitario, Secondo i valori definiti nella Tabella di Contesto TC44). Non può essere validato un progetto per cui è assente la valorizzazione di un Indicatore di Output Comune. ', 'E'' assente un Indicatore di Output comune. ', '', 'SELECT id AS export_ap00_id, cod_locale_progetto, estrazione_riferimento_id, ''N'' AS valid
FROM export_ap00
WHERE estrazione_riferimento_id = ${estrazione_id}
AND cod_locale_progetto NOT IN
    (
      SELECT DISTINCT cod_locale_progetto
      FROM export_in01
      WHERE estrazione_riferimento_id = ${estrazione_id}
      AND tipo_indicatore_di_output = ''COM''
    )', '2018-03-26 00:00:00.000000', '2018-03-26 00:00:00.000000', 'N');
INSERT INTO public.controlli_igrue (id, cod_controllo, dati_interessati, tipologia, dettaglio_controllo, dettaglio_errore, note, script_controllo, data_creazione, data_modifica, deleted) VALUES (9, '009', 'SEZIONE PROCEDURALE ', 'Presenza struttura ', 'Il controllo verifica se per il progetto sono assenti record della struttura PR00-Iter di progetto per specifiche fasi collegate alla Natura CUP del Tipo Operazione indicato nella struttura AP00-Anagrafica Progetti (secondo i valori definiti nella Tabella di Contesto TC5). Per la Natura CUP ''Realizzazione di lavori pubblici - opere ed impiantistica'': assenza di record per le specifiche fasi 0305 - Stipula Contratto; 0306 - Esecuzione; Per le altre Nature CUP: assenza di record per tutte le fasi previste dall’iter di progetto. Non può essere validato un progetto per cui è assente la valorizzazione di specifiche fasi procedurali dell’iter di progetto. ', 'E'' assente nell''Iter di progetto una fase obbligatoria', '', 'SELECT DISTINCT a0.id AS export_ap00_id, a0.cod_locale_progetto, a0.estrazione_riferimento_id, ''N'' AS valid
FROM export_ap00 a0
WHERE estrazione_riferimento_id = ${estrazione_id}
  AND a0.cod_locale_progetto IN
      (
        SELECT cod_locale_progetto
        FROM export_pr00
        WHERE estrazione_riferimento_id = ${estrazione_id}
        AND cod_fase IN (''0305'',''0306'')
        GROUP BY cod_locale_progetto
        HAVING COUNT(cod_locale_progetto) < 2
      )
UNION ALL
 SELECT DISTINCT a0.id AS export_ap00_id, a0.cod_locale_progetto, a0.estrazione_riferimento_id, ''N'' AS valid
FROM export_ap00 a0
WHERE estrazione_riferimento_id = ${estrazione_id}
  AND a0.cod_locale_progetto IN
      (
        SELECT cod_locale_progetto
        FROM export_pr00
        WHERE estrazione_riferimento_id = ${estrazione_id}
        AND cod_fase IN (''0101'',''0102'', ''0201'',''0202'', ''0305'',''0306'', ''0601'',''0602'', ''0701'',''0702'', ''0801'',''0802'')
        GROUP BY cod_locale_progetto
        HAVING COUNT(DISTINCT cod_fase) < 2
      )', '2018-03-26 00:00:00.000000', '2018-03-26 00:00:00.000000', 'N');
INSERT INTO public.controlli_igrue (id, cod_controllo, dati_interessati, tipologia, dettaglio_controllo, dettaglio_errore, note, script_controllo, data_creazione, data_modifica, deleted) VALUES (10, '010', 'SEZIONE PROCEDURALE', 'Presenza struttura ', 'Il controllo verifica se per il progetto è assente la struttura PR01 - Stato di attuazione del Progetto. Non può essere validato un progetto per cui è assente la valorizzazione dello Stato di Attuazione.', 'E'' assente valorizzazione per lo Stato di Attuazione del Progetto. ', '', 'SELECT id AS export_ap00_id, cod_locale_progetto, estrazione_riferimento_id, ''N'' AS valid
FROM export_ap00
WHERE estrazione_riferimento_id = ${estrazione_id}
AND cod_locale_progetto NOT IN
    (
      SELECT DISTINCT cod_locale_progetto
      FROM export_pr01
      WHERE estrazione_riferimento_id = ${estrazione_id}
    )', '2018-03-26 00:00:00.000000', '2018-03-26 00:00:00.000000', 'N');
INSERT INTO public.controlli_igrue (id, cod_controllo, dati_interessati, tipologia, dettaglio_controllo, dettaglio_errore, note, script_controllo, data_creazione, data_modifica, deleted) VALUES (11, '011', 'SEZIONE FINANZIARIA ', 'Presenza struttura ', 'Il controllo verifica se per il progetto è assente la struttura FN03 - Piano dei Costi. Non può essere validato un progetto per cui è assente la valorizzazione del Piano dei Costi', 'E'' assente valorizzazione del Piano dei Costi. ', '', 'SELECT id AS export_ap00_id, cod_locale_progetto, estrazione_riferimento_id, ''N'' AS valid
FROM export_ap00
WHERE estrazione_riferimento_id =  ${estrazione_id}
AND cod_locale_progetto NOT IN
    (
      SELECT DISTINCT cod_locale_progetto
      FROM export_fn03
      WHERE estrazione_riferimento_id = ${estrazione_id}
      ORDER BY cod_locale_progetto
    )', '2018-03-26 00:00:00.000000', '2018-03-26 00:00:00.000000', 'N');
INSERT INTO public.controlli_igrue (id, cod_controllo, dati_interessati, tipologia, dettaglio_controllo, dettaglio_errore, note, script_controllo, data_creazione, data_modifica, deleted) VALUES (16, '016', 'ANAGRAFICA DEI PROGETTI E CLASSIFICAZIONI', 'Coerenza fra dati ', 'Il controllo verifica se per un progetto che risulta con STATO = 1 (‘Attivo’) rispetto a un Programma del Fondo  YEI-Iniziativa Occupazione Giovani (struttura AP04-Programma), sono assenti le pertinenti classificazioni in AP03-Classificazioni (Campo Intervento, Forme di Finanziamento, Tipo di Territorio, Meccanismi di Erogazione Territoriale, Attività Economica, Dimensione Tematica  Secondaria). Non può essere validato un progetto per cui non siano presenti tutte le classificazioni pertinenti allo specifico Fondo relativo al Programma a cui il progetto risulta associato con STATO = 1 (‘Attivo’) nella struttura AP04Programma. ', 'Sono assenti per il progetto delle classificazioni obbligatorie.', '', 'SELECT DISTINCT a0.id AS export_ap00_id, a0.cod_locale_progetto, a0.estrazione_riferimento_id, ''N'' AS valid
FROM export_ap00 a0
  INNER JOIN export_fn00 f0 ON a0.estrazione_riferimento_id = f0.estrazione_riferimento_id
        AND a0.cod_locale_progetto = f0.cod_locale_progetto
  INNER JOIN export_ap04 a4 ON a0.estrazione_riferimento_id = a4.estrazione_riferimento_id
WHERE f0.cod_fondo = ''YEI''
      AND a0.estrazione_riferimento_id = ${estrazione_id}
      AND a4.stato = ''1''
      AND a4.cod_locale_progetto NOT IN
          (
            SELECT DISTINCT cod_locale_progetto
            FROM export_ap03
            WHERE estrazione_riferimento_id = ${estrazione_id}
              AND tipo_class IN (''CI'',''FF'',''TT'',''MET'',''AE'',''DTS'')
          )', '2018-03-26 00:00:00.000000', '2018-03-26 00:00:00.000000', 'N');
INSERT INTO public.controlli_igrue (id, cod_controllo, dati_interessati, tipologia, dettaglio_controllo, dettaglio_errore, note, script_controllo, data_creazione, data_modifica, deleted) VALUES (12, '012', 'SEZIONE ANAGRAFICA ', 'Coerenza con basi dati esterne ', 'Il controllo verifica se il CUP del progetto (in AP00-Anagrafica Progetti) risulta inesistente oppure non valido (cancellato o revocato), in base ai CUP censiti nel Sistema CUP. Non può essere validato un progetto il cui CUP risulta inesistente oppure non valido. ', 'Il CUP è assente all''interno del sistema CUP. oppure Il CUP risulta cancellato all''interno del sistema CUP. oppure Il CUP risulta revocato all''interno del sistema CUP.', '', 'SELECT id AS export_ap00_id, cod_locale_progetto, estrazione_riferimento_id, ''N'' AS valid
FROM export_ap00
WHERE estrazione_riferimento_id = ${estrazione_id}
AND cup IS NULL', '2018-03-26 00:00:00.000000', '2018-03-26 00:00:00.000000', 'N');
INSERT INTO public.controlli_igrue (id, cod_controllo, dati_interessati, tipologia, dettaglio_controllo, dettaglio_errore, note, script_controllo, data_creazione, data_modifica, deleted) VALUES (17, '017', 'ANAGRAFICA DEI PROGETTI E CLASSIFICAZIONI ', 'Coerenza fra dati ', 'Il controllo verifica se per un progetto che risulta con STATO = 1 (‘Attivo’) rispetto a un Programma del Fondo FEASR (struttura AP04-Programma) , sono assenti le pertinenti classificazioni in AP03Classificazioni (Tipologia Intervento FEASR). Non può essere validato un progetto per cui non siano presenti tutte le classificazioni pertinenti allo specifico Fondo relativo al Programma a cui il progetto risulta associato con STATO = 1 (‘Attivo’) nella struttura AP04Programma.', 'E'' assente per il progetto una classificazione obbligatoria. ', '', 'SELECT DISTINCT a0.id AS export_ap00_id, a0.cod_locale_progetto, a0.estrazione_riferimento_id, ''N'' AS valid
FROM export_ap00 a0
  INNER JOIN export_fn00 f0 ON a0.estrazione_riferimento_id = f0.estrazione_riferimento_id
        AND a0.cod_locale_progetto = f0.cod_locale_progetto
  INNER JOIN export_ap04 a4 ON a0.estrazione_riferimento_id = a4.estrazione_riferimento_id
WHERE f0.cod_fondo = ''EAFRD''
      AND a0.estrazione_riferimento_id = ${estrazione_id}
      AND a4.stato = ''1''
      AND a4.cod_locale_progetto NOT IN
          (
            SELECT DISTINCT cod_locale_progetto
            FROM export_ap03
            WHERE estrazione_riferimento_id = ${estrazione_id}
              AND tipo_class IN (''TI'')
          )', '2018-03-26 00:00:00.000000', '2018-03-26 00:00:00.000000', 'N');
INSERT INTO public.controlli_igrue (id, cod_controllo, dati_interessati, tipologia, dettaglio_controllo, dettaglio_errore, note, script_controllo, data_creazione, data_modifica, deleted) VALUES (18, '018', 'SEZIONE FINANZIARIA/SEZIONE ANAGRAFICA ', 'Coerenza fra dati ', 'Il controllo verifica se per i progetti di Realizzazione di lavori pubblici - opere ed impiantistica (valore del campo Tipo Operazione della TC5 nella struttura AP00Anagrafica progetti corrispondente a Codice Natura CUP=03) e Concessione di incentivi ad unità produttive (valore del campo Tipo Operazione della TC5 nella struttura AP00Anagrafica progetti corrispondente a Codice Natura CUP=07) è assente la struttura FN02Quadro Economico. ', 'E'' assente il Quadro Economico per il progetto', '', 'SELECT DISTINCT a0.id AS export_ap00_id, a0.cod_locale_progetto, a0.estrazione_riferimento_id, ''N'' AS valid
FROM export_ap00 a0
WHERE estrazione_riferimento_id = ${estrazione_id}
  AND a0.cod_locale_progetto NOT IN
      (
        SELECT DISTINCT cod_locale_progetto
        FROM export_ap00
        WHERE estrazione_riferimento_id = ${estrazione_id}
      )', '2018-03-26 00:00:00.000000', '2018-03-26 00:00:00.000000', 'N');
INSERT INTO public.controlli_igrue (id, cod_controllo, dati_interessati, tipologia, dettaglio_controllo, dettaglio_errore, note, script_controllo, data_creazione, data_modifica, deleted) VALUES (19, '019', 'SEZIONE FINANZIARIA ', 'Coerenza fra dati ', 'Il controllo verifica, in presenza di FN06Pagamenti, se sono assenti Impegni (FN04Impegni). ', 'Il progetto ha Pagamenti di tipologia (P,R), ma sono assenti i relativi valori di Impegni. Il progetto ha Pagamenti di tipologia (P-TR,R-TR), ma sono assenti i relativi valori di Impegni', 'I Pagamenti sono considerati al netto di eventuali Rettifiche. Gli Impegni sono considerati al netto di eventuali Disimpegni. Con riferimento alle Tipologie di Pagamento e Impegno, il controllo verifica: i valori P e R rispetto ai valori I e D; i valori P-TR e R-TR rispetto ai valori I-TR e D-TR.', 'SELECT id AS export_ap00_id, cod_locale_progetto, estrazione_riferimento_id, ''N'' AS valid
FROM export_ap00
WHERE estrazione_riferimento_id = ${estrazione_id}
AND cod_locale_progetto IN
(
  SELECT DISTINCT cod_locale_progetto
  FROM export_fn06
  WHERE estrazione_riferimento_id = ${estrazione_id}
  AND cod_locale_progetto NOT IN
                ( SELECT DISTINCT export_fn04.cod_locale_progetto
                  FROM export_fn04
                  WHERE export_fn04.estrazione_riferimento_id = ${estrazione_id}
                )
)', '2018-03-26 00:00:00.000000', '2018-03-26 00:00:00.000000', 'N');
INSERT INTO public.controlli_igrue (id, cod_controllo, dati_interessati, tipologia, dettaglio_controllo, dettaglio_errore, note, script_controllo, data_creazione, data_modifica, deleted) VALUES (20, '020', 'SEZIONE FINANZIARIA/ANAGRAFICA DEI PROGETTI E CLASSIFICAZIONI', 'Coerenza fra dati ', 'Il controllo verifica se per il progetto, in presenza di record della struttura FN01 Costo ammesso relativo a uno specifico Programma e Livello Gerarchico, è assente una corrispondente associazione del progetto con STATO = 1 ‘Attivo’ rispetto al medesimo Programma (nella struttura AP04Programma).', 'Sono presenti Costi Ammessi associati a Programma su cui il progetto non è attivo.', '', 'SELECT id AS export_ap00_id, cod_locale_progetto, estrazione_riferimento_id, ''N'' AS valid
FROM export_ap00
WHERE estrazione_riferimento_id = ${estrazione_id}
AND cod_locale_progetto IN
    (
      SELECT DISTINCT f1.cod_locale_progetto
      FROM export_fn01 f1
      WHERE f1.estrazione_riferimento_id = ${estrazione_id}
      AND NOT EXISTS (SELECT 1 FROM export_ap04 a4
                      WHERE a4.stato = ''1''
                        AND a4.estrazione_riferimento_id = f1.estrazione_riferimento_id
                        AND a4.cod_locale_progetto = f1.cod_locale_progetto
                        AND a4.cod_programma = f1.cod_programma)
    )', '2018-03-26 00:00:00.000000', '2018-03-26 00:00:00.000000', 'N');
INSERT INTO public.controlli_igrue (id, cod_controllo, dati_interessati, tipologia, dettaglio_controllo, dettaglio_errore, note, script_controllo, data_creazione, data_modifica, deleted) VALUES (21, '021', 'SEZIONE FINANZIARIA/ANAGRAFICA DEI PROGETTI E CLASSIFICAZIONI ', 'Coerenza fra dati ', 'Il controllo verifica se per il progetto, in presenza di record della struttura FN05Impegno ammesso relativo a uno specifico Programma e Livello Gerarchico, è assente una corrispondente associazione del progetto con STATO = 1 ‘Attivo’ rispetto al medesimo Programma (nella struttura AP04Programma). ', 'Sono presenti Impegni Ammessi associati a Programma su cui il progetto non è attivo.', '', 'SELECT id AS export_ap00_id, cod_locale_progetto, estrazione_riferimento_id, ''N'' AS valid
FROM export_ap00
WHERE estrazione_riferimento_id = ${estrazione_id}
AND cod_locale_progetto IN
    (
      SELECT DISTINCT f5.cod_locale_progetto
      FROM export_fn05 f5
      WHERE f5.estrazione_riferimento_id = ${estrazione_id}
      AND NOT EXISTS (SELECT 1 FROM export_ap04 a4
                      WHERE a4.stato = ''1''
                        AND a4.estrazione_riferimento_id = f5.estrazione_riferimento_id
                        AND a4.cod_locale_progetto = f5.cod_locale_progetto
                        AND a4.cod_programma = f5.cod_programma)
    )', '2018-03-26 00:00:00.000000', '2018-03-26 00:00:00.000000', 'N');
INSERT INTO public.controlli_igrue (id, cod_controllo, dati_interessati, tipologia, dettaglio_controllo, dettaglio_errore, note, script_controllo, data_creazione, data_modifica, deleted) VALUES (22, '022', 'SEZIONE FINANZIARIA/ANAGRAFICA DEI PROGETTI E CLASSIFICAZIONI ', 'Coerenza fra dati ', 'Il controllo verifica se per il progetto, in presenza di record della struttura FN07Pagamento ammesso relativo a uno specifico Programma e Livello Gerarchico, è assente una corrispondente associazione del progetto con STATO = 1 ‘Attivo’ rispetto al medesimo Programma (nella struttura AP04Programma). ', 'Sono presenti Pagamenti Ammessi associati a Programma su cui il progetto non è attivo.', '', 'SELECT id AS export_ap00_id, cod_locale_progetto, estrazione_riferimento_id, ''N'' AS valid
FROM export_ap00
WHERE estrazione_riferimento_id = ${estrazione_id}
AND cod_locale_progetto IN
    (
      SELECT DISTINCT f7.cod_locale_progetto
      FROM export_fn07 f7
      WHERE f7.estrazione_riferimento_id = ${estrazione_id}
      AND NOT EXISTS (SELECT 1 FROM export_ap04 a4
                      WHERE a4.stato = ''1''
                        AND a4.estrazione_riferimento_id = f7.estrazione_riferimento_id
                        AND a4.cod_locale_progetto = f7.cod_locale_progetto
                        AND a4.cod_programma = f7.cod_programma)
    )', '2018-03-26 00:00:00.000000', '2018-03-26 00:00:00.000000', 'N');
INSERT INTO public.controlli_igrue (id, cod_controllo, dati_interessati, tipologia, dettaglio_controllo, dettaglio_errore, note, script_controllo, data_creazione, data_modifica, deleted) VALUES (23, '023', 'SEZIONE FINANZIARIA/ANAGRAFICA DEI PROGETTI E CLASSIFICAZIONI', 'Coerenza fra dati ', 'Il controllo verifica se per il progetto, in presenza di record della struttura FN09Spese certificate relativo a uno specifico Livello Gerarchico, è assente una corrispondente associazione del progetto con STATO = 1 ‘Attivo’ rispetto al medesimo Programma (nella struttura AP04Programma)', 'Sono presenti Spese certificate associate a un livello gerarchico relativo a Programma su cui il progetto non è attivo.', '', 'SELECT id AS export_ap00_id, cod_locale_progetto, estrazione_riferimento_id, ''N'' AS valid
FROM export_ap00
WHERE estrazione_riferimento_id = ${estrazione_id}
AND cod_locale_progetto IN
    (
      SELECT DISTINCT f9.cod_locale_progetto
      FROM export_fn09 f9
      WHERE f9.estrazione_riferimento_id = ${estrazione_id}
      AND NOT EXISTS (SELECT 1 FROM export_ap04 a4
                      WHERE a4.stato = ''1''
                        AND a4.estrazione_riferimento_id = f9.estrazione_riferimento_id
                       AND a4.cod_locale_progetto = f9.cod_locale_progetto)
    )', '2018-03-26 00:00:00.000000', '2018-03-26 00:00:00.000000', 'N');
INSERT INTO public.controlli_igrue (id, cod_controllo, dati_interessati, tipologia, dettaglio_controllo, dettaglio_errore, note, script_controllo, data_creazione, data_modifica, deleted) VALUES (33, '033', 'SEZIONE FINANZIARIA ', 'Coerenza fra dati ', 'Il controllo verifica se la data del singolo Pagamento (in FN06-Pagamenti) è successiva alla data di Validazione. Non può essere validato un progetto per cui la data del Pagamento è successiva alla data di Validazione', 'E'' presente per il progetto almeno un Pagamento con data successiva a quella di Validazione (o PreValidazione).', '', 'SELECT id AS export_ap00_id, cod_locale_progetto, estrazione_riferimento_id, ''N'' AS valid
FROM export_ap00
WHERE estrazione_riferimento_id = ${estrazione_id}
AND cod_locale_progetto IN
(
  SELECT cod_locale_progetto
  FROM export_fn06 f6
  WHERE estrazione_riferimento_id = 0
            
)', '2018-03-26 00:00:00.000000', '2018-03-26 00:00:00.000000', 'N');
INSERT INTO public.controlli_igrue (id, cod_controllo, dati_interessati, tipologia, dettaglio_controllo, dettaglio_errore, note, script_controllo, data_creazione, data_modifica, deleted) VALUES (32, '032', 'SEZIONE FINANZIARIA ', 'Coerenza fra dati ', 'Il controllo verifica se la data del singolo Impegno (in FN04-Impegni) è successiva alla data di Validazione. Non può essere validato un progetto per cui la data dell’Impegno è successiva alla data di Validazione.', 'E'' presente per il progetto almeno un Impegno con data successiva a quella di Validazione (o PreValidazione).', '', 'SELECT id AS export_ap00_id, cod_locale_progetto, estrazione_riferimento_id, ''N'' AS valid
FROM export_ap00
WHERE estrazione_riferimento_id = ${estrazione_id}
AND cod_locale_progetto IN
(
  SELECT cod_locale_progetto
  FROM export_fn04 f4
  WHERE estrazione_riferimento_id = 0
)', '2018-03-26 00:00:00.000000', '2018-03-26 00:00:00.000000', 'N');

INSERT INTO public.controlli_igrue (id, cod_controllo, dati_interessati, tipologia, dettaglio_controllo, dettaglio_errore, note, script_controllo, data_creazione, data_modifica, deleted) VALUES (34, '034', 'SEZIONE FINANZIARIA ', 'Coerenza fra dati ', 'Il controllo verifica se la data del singolo Impegno Ammesso (in FN05-Impegni Ammessi) è successiva alla data di Validazione. Non può essere validato un progetto per cui la data dell’Impegno Ammesso è successiva alla data di Validazione. ', 'E'' presente per il progetto almeno un Impegno Ammesso con data successiva a quella di Validazione (o PreValidazione).', '', 'SELECT id AS export_ap00_id, cod_locale_progetto, estrazione_riferimento_id, ''N'' AS valid
FROM export_ap00
WHERE estrazione_riferimento_id = ${estrazione_id}
AND cod_locale_progetto IN
(
  SELECT cod_locale_progetto
  FROM export_fn05 f5
  WHERE estrazione_riferimento_id = 0
)', '2018-03-26 00:00:00.000000', '2018-03-26 00:00:00.000000', 'N');
INSERT INTO public.controlli_igrue (id, cod_controllo, dati_interessati, tipologia, dettaglio_controllo, dettaglio_errore, note, script_controllo, data_creazione, data_modifica, deleted) VALUES (35, '035', 'SEZIONE FINANZIARIA ', 'Coerenza fra dati ', 'Il controllo verifica se la data del singolo Pagamento Ammesso (in FN07-Pagamenti Ammessi) è successiva alla data di Validazione. Non può essere validato un progetto per cui la data del Pagamento Ammesso è successiva alla data di Validazione. ', 'E'' presente per il progetto almeno un Pagamento Ammesso con data successiva a quella di Validazione (o PreValidazione).', '', 'SELECT id AS export_ap00_id, cod_locale_progetto, estrazione_riferimento_id, ''N'' AS valid
FROM export_ap00
WHERE estrazione_riferimento_id = ${estrazione_id}
AND cod_locale_progetto IN
(
  SELECT cod_locale_progetto
  FROM export_fn07 f7
  WHERE estrazione_riferimento_id = 0
)', '2018-03-26 00:00:00.000000', '2018-03-26 00:00:00.000000', 'N');
INSERT INTO public.controlli_igrue (id, cod_controllo, dati_interessati, tipologia, dettaglio_controllo, dettaglio_errore, note, script_controllo, data_creazione, data_modifica, deleted) VALUES (36, '036', 'SEZIONE PROCEDURALE ', 'Coerenza fra dati ', 'Il controllo verifica se la data alla quale si riferisce lo Stato di attuazione del progetto (in PR01-Stato di Attuazione del Progetto) è successiva alla data di Validazione. Non può essere validato un progetto per cui la data del suo Stato di attuazione è successiva alla data di Validazione', 'E'' presente per il progetto uno stato di attuazione con data successiva a quella di Validazione (o PreValidazione).', '', 'SELECT id AS export_ap00_id, cod_locale_progetto, estrazione_riferimento_id, ''N'' AS valid
FROM export_ap00
WHERE estrazione_riferimento_id = ${estrazione_id}
AND cod_locale_progetto IN
(
  SELECT cod_locale_progetto
  FROM export_pr01 p1
  WHERE estrazione_riferimento_id = 0
)', '2018-03-26 00:00:00.000000', '2018-03-26 00:00:00.000000', 'N');
INSERT INTO public.controlli_igrue (id, cod_controllo, dati_interessati, tipologia, dettaglio_controllo, dettaglio_errore, note, script_controllo, data_creazione, data_modifica, deleted) VALUES (38, '038', 'SEZIONE FINANZIARIA', 'Coerenza fra dati ', 'Il controllo verifica se per una Economia valorizzata su uno specifico Fondo (per COD_FONDO e IMPORTO in FN10-Economie) è assente un importo del Finanziamento maggiore di essa, per lo stesso Fondo (per COD_FONDO e IMPORTO in FN00Finanziamento). Non può essere validato un progetto per cui l’importo di una Economia associata a uno specifico Fondo è maggiore o uguale all’importo del Finanziamento sullo stesso Fondo.', 'Sono presenti Economie a valere su specifico Fondo, maggiori dei Finanziamenti totali a valere sullo stesso Fondo.', '', 'SELECT id AS export_ap00_id, cod_locale_progetto, estrazione_riferimento_id, ''N'' AS valid
FROM export_ap00
WHERE estrazione_riferimento_id = ${estrazione_id}
AND cod_locale_progetto IN
    (
      SELECT DISTINCT economie.cod_locale_progetto
      FROM
        (
          SELECT
            cod_locale_progetto,
            cod_fondo,
            SUM(importo::NUMERIC) AS importo
          FROM export_fn10
          WHERE estrazione_riferimento_id = ${estrazione_id}
          GROUP BY cod_locale_progetto, cod_fondo
        ) economie LEFT JOIN
        (
          SELECT
            cod_locale_progetto,
            cod_fondo,
            SUM(importo::NUMERIC) AS importo
          FROM export_fn00
          WHERE estrazione_riferimento_id = ${estrazione_id}
          GROUP BY cod_locale_progetto, cod_fondo
        ) finanziamento ON economie.cod_fondo = finanziamento.cod_fondo
                           AND economie.cod_locale_progetto = finanziamento.cod_locale_progetto
      WHERE economie.importo > finanziamento.importo
    )', '2018-03-26 00:00:00.000000', '2018-03-26 00:00:00.000000', 'N');
INSERT INTO public.controlli_igrue (id, cod_controllo, dati_interessati, tipologia, dettaglio_controllo, dettaglio_errore, note, script_controllo, data_creazione, data_modifica, deleted) VALUES (39, '039', 'SEZIONE FINANZIARIA ', 'Coerenza fra dati ', 'Il controllo verifica se per uno specifico progetto la Sommatoria fra il valore totale degli Importi Realizzati e degli Importi da Realizzare del Piano dei Costi (Sommatoria importi nella struttura FN03-Piano dei Costi) e il valore totale degli importi delle Economie (Sommatoria importi nella struttura FN10-Economie) è diversa dal valore totale dei Finanziamenti (Sommatoria importi nella struttura FN00-Finanziamento). Non può essere validato un progetto per cui la sommatoria degli importi del Piano dei Costi e delle Economie è differente dall’importo Finanziamento totale. ', 'L''importo totale del Piano dei Costi (più eventuali Economie) è diverso dall''importo totale del Finanziamento.', '', 'SELECT id AS export_ap00_id, cod_locale_progetto, estrazione_riferimento_id, ''N'' AS valid
FROM export_ap00
WHERE estrazione_riferimento_id = ${estrazione_id}
AND cod_locale_progetto IN
    ( 
      SELECT DISTINCT realizzato.cod_locale_progetto
      FROM
        (
          SELECT
            cod_locale_progetto,
            SUM(importo::NUMERIC) AS importo
          FROM (
                 SELECT
                   cod_locale_progetto,
                   imp_da_realizzare AS importo
                 FROM export_fn03
                 WHERE estrazione_riferimento_id = ${estrazione_id}
                 UNION ALL
                 SELECT
                   cod_locale_progetto,
                   imp_realizzato AS importo
                 FROM export_fn03
                 WHERE estrazione_riferimento_id = ${estrazione_id}
                 UNION ALL
                 SELECT
                   cod_locale_progetto,
                   importo
                 FROM export_fn10
                 WHERE estrazione_riferimento_id = ${estrazione_id}
               ) A
          GROUP BY cod_locale_progetto
        ) realizzato LEFT JOIN
        (
          SELECT
            cod_locale_progetto,
            SUM(importo::NUMERIC) AS importo
          FROM export_fn00
          WHERE estrazione_riferimento_id = ${estrazione_id}
          GROUP BY cod_locale_progetto
        ) finanziamento ON realizzato.cod_locale_progetto = finanziamento.cod_locale_progetto
      WHERE realizzato.importo <> finanziamento.importo
	  
    )
', '2018-03-26 00:00:00.000000', '2018-03-26 00:00:00.000000', 'N');
INSERT INTO public.controlli_igrue (id, cod_controllo, dati_interessati, tipologia, dettaglio_controllo, dettaglio_errore, note, script_controllo, data_creazione, data_modifica, deleted) VALUES (41, '041', 'SEZIONE PROCEDURALE ', 'Coerenza fra dati ', 'Il controllo verifica se, a conclusione di una fase dell''iter di progetto (Data Fine Effettiva valorizzata per COD_FASE=0102;0202;0302 o successiva;0602;0702;0802 nella struttura PR00-Iter di Progetto) sono assenti le date effettive di inizio e fine relative a una fase precedente valorizzata. Non può essere validato un progetto per il quale non venga rispettata la propedeuticità della conclusione delle relative Fasi Procedurali. ', 'Per Fase procedurale con data di fine effettiva valorizzata, è assente data d''inizio e/o fine effettiva per una Fase precedente valorizzata.', '', 'SELECT id AS export_ap00_id, cod_locale_progetto, estrazione_riferimento_id, ''N'' AS valid
FROM export_ap00
WHERE estrazione_riferimento_id = ${estrazione_id}
AND cod_locale_progetto IN
    (
      SELECT DISTINCT A.cod_locale_progetto
      FROM
        (
          SELECT
            cod_locale_progetto,
            cod_fase,
            CAST(SUBSTR(cod_fase, 4, 1) AS INT) AS ordine,
            data_fine_effettiva
          FROM export_pr00 p0
          WHERE data_fine_effettiva IS NOT NULL
                AND estrazione_riferimento_id = ${estrazione_id}
                AND cod_fase IN (''0102'', ''0202'', ''0302'', ''0303'', ''0304'', ''0305'', ''0306'', ''0307'', ''0602'', ''0702'', ''0802'')
        ) A INNER JOIN
        (
          SELECT
            cod_locale_progetto,
            cod_fase,
            CAST(SUBSTR(cod_fase, 4, 1) AS INT)     AS ordine,
            CAST(SUBSTR(cod_fase, 4, 1) AS INT) + 1 AS ordine_sup,
            data_fine_effettiva
          FROM export_pr00 p0
          WHERE data_fine_effettiva IS NULL
                AND estrazione_riferimento_id = ${estrazione_id}
                AND cod_fase IN (''0101'', ''0201'', ''0301'', ''0302'', ''0303'', ''0304'', ''0305'', ''0306'', ''0601'', ''0701'', ''0801'')
        ) B ON A.cod_locale_progetto = B.cod_locale_progetto
               AND A.ordine = B.ordine_sup
    )', '2018-03-26 00:00:00.000000', '2018-03-26 00:00:00.000000', 'N');
INSERT INTO public.controlli_igrue (id, cod_controllo, dati_interessati, tipologia, dettaglio_controllo, dettaglio_errore, note, script_controllo, data_creazione, data_modifica, deleted) VALUES (42, '042', 'SEZIONE PROCEDURALE', 'Coerenza fra dati ', 'Il controllo verifica se, per la singola fase conclusa nella struttura PR00-Iter di Progetto (Data Fine Effettiva valorizzata per singola fase) è assente data effettiva di inizio della stessa fase. Non può essere validato un progetto per il quale non venga rispettata la propedeuticità delle date effettive di inizio e fine fase. ', 'Per Fase procedurale con data di fine effettiva valorizzata, è assente data d''inizio effettiva della stessa Fase.', '', 'SELECT id AS export_ap00_id, cod_locale_progetto, estrazione_riferimento_id, ''N'' AS valid
FROM export_ap00
WHERE estrazione_riferimento_id = ${estrazione_id}
AND cod_locale_progetto IN
(
  SELECT cod_locale_progetto
  FROM export_pr00
  WHERE estrazione_riferimento_id = ${estrazione_id}
  AND data_fine_effettiva IS NOT NULL
  AND data_inizio_effettiva IS NULL
)', '2018-03-26 00:00:00.000000', '2018-03-26 00:00:00.000000', 'N');
INSERT INTO public.controlli_igrue (id, cod_controllo, dati_interessati, tipologia, dettaglio_controllo, dettaglio_errore, note, script_controllo, data_creazione, data_modifica, deleted) VALUES (43, '043', 'SEZIONE INDICATORI DI RISULTATO E FISICI/SEZIONE ANAGRAFICA ', 'Coerenza fra dati ', 'Il controllo verifica se per un progetto risulta presente un Indicatore di Risultato Di Programma (nella struttura IN00-Indicatori di Risultato) non relativo al/ai Programma/i cui il progetto è associato con STATO= 1 ‘Attivo’ (nella struttura AP04). Non può essere validato un progetto per il quale non ci sia coerenza tra Indicatore di Risultato di Programma utilizzato e il Programma di riferimento. ', 'Sono valorizzati Indicatori di risultato relativi a Programma non attivo sul progetto.', '', 'SELECT id AS export_ap00_id, cod_locale_progetto, estrazione_riferimento_id, ''N'' AS valid
FROM export_ap00
WHERE estrazione_riferimento_id = ${estrazione_id}
AND cod_locale_progetto IN
(
  SELECT cod_locale_progetto
  FROM export_in00
  WHERE estrazione_riferimento_id = ${estrazione_id}
  AND cod_locale_progetto NOT IN
              (
              SELECT cod_locale_progetto
              FROM export_ap04
              WHERE export_ap04.estrazione_riferimento_id = ${estrazione_id}
              AND stato = ''1''
              )
)', '2018-03-26 00:00:00.000000', '2018-03-26 00:00:00.000000', 'N');
INSERT INTO public.controlli_igrue (id, cod_controllo, dati_interessati, tipologia, dettaglio_controllo, dettaglio_errore, note, script_controllo, data_creazione, data_modifica, deleted) VALUES (55, '055', 'SEZIONE FINANZIARIA ', 'Coerenza fra dati ', 'Il controllo verifica se, per il singolo progetto, il valore totale dei Pagamenti Ammessi nella struttura FN07-Pagamenti Ammessi (al netto di rettifiche) è maggiore del valore totale dei Pagamenti nella struttura FN06-Pagamenti (al netto di rettifiche). Non può essere validato un progetto per cui il totale dei Pagamenti Ammessi è maggiore del totale dei Pagamenti', 'Per il progetto l’importo totale dei Pagamenti Ammessi è maggiore dell’importo totale dei Pagamenti.', '', 'SELECT id AS export_ap00_id, cod_locale_progetto, estrazione_riferimento_id, ''N'' AS valid
FROM export_ap00
WHERE estrazione_riferimento_id = ${estrazione_id}
AND cod_locale_progetto IN
    (
      SELECT DISTINCT ammessi.cod_locale_progetto
      FROM
        (
          SELECT
            A.cod_locale_progetto,
            pagamento - COALESCE(rettifica, 0) AS importo
          FROM
            (
              SELECT
                cod_locale_progetto,
                SUM(importo_pag_amm::NUMERIC) AS pagamento
              FROM export_fn07
              WHERE estrazione_riferimento_id = ${estrazione_id}
                    AND tipologia_pag_amm IN (''P'', ''P-TR'')
              GROUP BY cod_locale_progetto,tipologia_pag
            ) A LEFT JOIN
            (
              SELECT
                cod_locale_progetto,
                SUM(importo_pag_amm::NUMERIC) AS rettifica
              FROM export_fn07
              WHERE estrazione_riferimento_id = ${estrazione_id}
                    AND tipologia_pag_amm IN (''R'', ''R-TR'')
              GROUP BY cod_locale_progetto
            ) B ON A.cod_locale_progetto = B.cod_locale_progetto
        ) ammessi LEFT JOIN
        (
          SELECT
            A.cod_locale_progetto,
            pagamento - COALESCE(rettifica, 0) AS importo
          FROM
            (
              SELECT
                cod_locale_progetto,
                SUM(importo_pag::NUMERIC) AS pagamento
              FROM export_fn06
              WHERE estrazione_riferimento_id = ${estrazione_id}
                    AND tipologia_pag IN (''P'', ''P-TR'')
              GROUP BY cod_locale_progetto
            ) A LEFT JOIN
            (
              SELECT
                cod_locale_progetto,
                SUM(importo_pag::NUMERIC) AS rettifica
              FROM export_fn06
              WHERE estrazione_riferimento_id = ${estrazione_id}
                    AND tipologia_pag IN (''R'', ''R-TR'')
              GROUP BY cod_locale_progetto
            ) B ON A.cod_locale_progetto = B.cod_locale_progetto
        ) pagamenti ON ammessi.cod_locale_progetto = pagamenti.cod_locale_progetto
      WHERE ammessi.importo > pagamenti.importo
    )', '2018-03-26 00:00:00.000000', '2018-03-26 00:00:00.000000', 'N');
INSERT INTO public.controlli_igrue (id, cod_controllo, dati_interessati, tipologia, dettaglio_controllo, dettaglio_errore, note, script_controllo, data_creazione, data_modifica, deleted) VALUES (44, '044', 'SEZIONE INDICATORI DI RISULTATO E FISICI/SEZIONE ANAGRAFICA ', 'Coerenza fra dati ', 'Il controllo verifica se per un progetto risulta presente un Indicatore di Output Di Programma (nella struttura IN01-Indicatori di Output) non relativo al/ai Programma/i cui il progetto è associato con STATO = 1 ‘Attivo’ (nella struttura AP04). Non può essere validato un progetto per il quale non ci sia coerenza tra Indicatore di Output di Programma utilizzato e il Programma di riferimento. ', 'Sono valorizzati Indicatori di output relativi a Programma non attivo sul progetto.', '', 'SELECT id AS export_ap00_id, cod_locale_progetto, estrazione_riferimento_id, ''N'' AS valid
FROM export_ap00
WHERE estrazione_riferimento_id = ${estrazione_id}
AND cod_locale_progetto IN
(
  SELECT cod_locale_progetto
  FROM export_in01
  WHERE estrazione_riferimento_id = ${estrazione_id}
  AND cod_locale_progetto NOT IN
              (
              SELECT cod_locale_progetto
              FROM export_ap04
              WHERE export_ap04.estrazione_riferimento_id = ${estrazione_id}
              AND stato = ''1''
              )
)', '2018-03-26 00:00:00.000000', '2018-03-26 00:00:00.000000', 'N');
INSERT INTO public.controlli_igrue (id, cod_controllo, dati_interessati, tipologia, dettaglio_controllo, dettaglio_errore, note, script_controllo, data_creazione, data_modifica, deleted) VALUES (50, '050', 'SEZIONE FINANZIARIA ', 'Coerenza fra dati ', 'Il controllo verifica se per il singolo progetto, in presenza di dati nella struttura FN04Impegni, il saldo degli Impegni al netto dei Disimpegni ha valore negativo. Il controllo verifica i saldi per valori del campo IMPORTO_IMPEGNO della struttura FN04Impegni: differenza tra la Sommatoria degli importi con TIPOLOGIA_IMPEGNO= I e la Sommatoria degli importi con TIPOLOGIA_IMPEGNO= D; oppure differenza tra la Sommatoria degli importi con TIPOLOGIA_IMPEGNO= I-TR e la Sommatoria degli importi con TIPOLOGIA_IMPEGNO= D-TR. Non può essere validato un progetto per cui la differenza tra Impegni e Disimpegni ha valore negativo (deve avere valore positivo o zero). ', 'Saldo negativo Impegni e Disimpegni per il progetto.', '', 'SELECT id AS export_ap00_id, cod_locale_progetto, estrazione_riferimento_id, ''N'' AS valid
FROM export_ap00
WHERE estrazione_riferimento_id = ${estrazione_id}
AND cod_locale_progetto IN
    (
      SELECT DISTINCT A.cod_locale_progetto
      FROM
        (
          SELECT
            cod_locale_progetto,
            SUM(importo_impegno::NUMERIC) AS impegno
          FROM export_fn04
          WHERE estrazione_riferimento_id = ${estrazione_id}
                AND tipologia_impegno = ''I''
          GROUP BY cod_locale_progetto
        ) A INNER JOIN
        (
          SELECT
            cod_locale_progetto,
            SUM(importo_impegno::NUMERIC) AS disimpegno
          FROM export_fn04
          WHERE estrazione_riferimento_id = ${estrazione_id}
                AND tipologia_impegno = ''D''
          GROUP BY cod_locale_progetto
        ) B ON A.cod_locale_progetto = B.cod_locale_progetto
      WHERE A.impegno - B.disimpegno < 0

      UNION

      SELECT DISTINCT A.cod_locale_progetto
      FROM
        (
          SELECT
            cod_locale_progetto,
            SUM(importo_impegno::NUMERIC) AS impegno
          FROM export_fn04
          WHERE estrazione_riferimento_id = ${estrazione_id}
                AND tipologia_impegno = ''I-TR''
          GROUP BY cod_locale_progetto
        ) A INNER JOIN
        (
          SELECT
            cod_locale_progetto,
            SUM(importo_impegno::NUMERIC) AS disimpegno
          FROM export_fn04
          WHERE estrazione_riferimento_id = ${estrazione_id}
                AND tipologia_impegno = ''D-TR''
          GROUP BY cod_locale_progetto
        ) B ON A.cod_locale_progetto = B.cod_locale_progetto
      WHERE A.impegno - B.disimpegno < 0
    )', '2018-03-26 00:00:00.000000', '2018-03-26 00:00:00.000000', 'N');
INSERT INTO public.controlli_igrue (id, cod_controllo, dati_interessati, tipologia, dettaglio_controllo, dettaglio_errore, note, script_controllo, data_creazione, data_modifica, deleted) VALUES (45, '045', 'SEZIONE FINANZIARIA/ SEZIONE ANAGRAFICA ', 'Coerenza fra dati ', 'Il controllo verifica se per un progetto risulta valorizzata una voce di spesa del Quadro Economico (nella struttura FN02-Quadro Economico) non applicabile al Tipo Operazione indicato per il progetto (TIPO_OPERAZIONE nella struttura AP00Anagrafica progetti e specifico Codice Natura CUP associato nella Tabella di Contesto TC5). Non può essere validato un progetto per il quale non ci sia coerenza tra Voce di Spesa del Quadro economico e Natura CUP. ', 'Sono valorizzate Voci di spesa non applicabili alla tipologia di operazione.', '', 'SELECT id AS export_ap00_id, cod_locale_progetto, estrazione_riferimento_id, ''N'' AS valid
FROM export_ap00
WHERE estrazione_riferimento_id = ${estrazione_id}
AND cod_locale_progetto IN
    (
      SELECT DISTINCT qe.cod_locale_progetto
      FROM
        (
          SELECT DISTINCT
            f2.cod_locale_progetto
          FROM export_fn02 f2
          WHERE estrazione_riferimento_id = ${estrazione_id}
        ) qe INNER JOIN
        (
          SELECT
            cod_locale_progetto

          FROM export_ap00 a0
          WHERE estrazione_riferimento_id = ${estrazione_id}
        ) ap00 ON ap00.cod_locale_progetto = qe.cod_locale_progetto
      WHERE qe.cod_locale_progetto <> ap00.cod_locale_progetto
    )', '2018-03-26 00:00:00.000000', '2018-03-26 00:00:00.000000', 'N');
INSERT INTO public.controlli_igrue (id, cod_controllo, dati_interessati, tipologia, dettaglio_controllo, dettaglio_errore, note, script_controllo, data_creazione, data_modifica, deleted) VALUES (46, '046', 'SEZIONE PROCEDURALE/ SEZIONE ANAGRAFICA ', 'Coerenza fra dati ', 'Il controllo verifica se per un progetto risulta valorizzata una fase dell''Iter di progetto (in PR00-Iter di progetto) non applicabile al Tipo Operazione indicato per il progetto (TIPO_OPERAZIONE in AP00-Anagrafica progetti e specifico Codice Natura CUP associato nella Tabella di Contesto TC5). Non può essere validato un progetto per il quale non ci sia coerenza tra Iter di Progetto e Natura CUP', 'Sono valorizzate Fasi procedurali non applicabili alla tipologia di operazione e relativo Iter di progetto.', '', 'SELECT id AS export_ap00_id, cod_locale_progetto, estrazione_riferimento_id, ''N'' AS valid
FROM export_ap00
WHERE estrazione_riferimento_id = ${estrazione_id}
AND cod_locale_progetto IN
    (
      SELECT DISTINCT qe.cod_locale_progetto
      FROM
        (
          SELECT DISTINCT p0.cod_locale_progetto
          FROM export_pr00 p0
          WHERE p0.estrazione_riferimento_id = ${estrazione_id}
        ) qe INNER JOIN
        (
          SELECT
            cod_locale_progetto
          FROM export_ap00 a0
          WHERE estrazione_riferimento_id = ${estrazione_id}
        ) ap00 ON ap00.cod_locale_progetto = qe.cod_locale_progetto
      WHERE qe.cod_locale_progetto <> ap00.cod_locale_progetto
    )', '2018-03-26 00:00:00.000000', '2018-03-26 00:00:00.000000', 'N');
INSERT INTO public.controlli_igrue (id, cod_controllo, dati_interessati, tipologia, dettaglio_controllo, dettaglio_errore, note, script_controllo, data_creazione, data_modifica, deleted) VALUES (47, '047', 'SEZIONE FINANZIARIA ', 'Coerenza fra dati ', 'Il controllo verifica se per un Impegno Ammesso associato a uno specifico Impegno (nella struttura FN05-Impegni Ammessi), il relativo Impegno (nella struttura FN04Impegni) è cancellato. Non può essere validato un progetto per il quale risulti un Impegno Ammesso associato a un Impegno cancellato.', 'Sono presenti Impegni Ammessi associati a Impegno padre cancellato.', 'Il Sistema Nazionale di Monitoraggio verifica in fase di acquisizione dei dati l’esistenza dell''Impegno ''padre'' associato all''Impegno Ammesso. In caso di cancellazione dell''Impegno ''padre'', tuttavia, può rimanere un''associazione nell''impegno Ammesso ''figlio'', generando un''incoerenza. Il controllo è volto a scartare i progetti per cui si verifica tale casistica. ', 'SELECT id AS export_ap00_id, cod_locale_progetto, estrazione_riferimento_id, ''N'' AS valid
FROM export_ap00
WHERE estrazione_riferimento_id =  ${estrazione_id}
AND cod_locale_progetto IN
    (
      SELECT DISTINCT f4.cod_locale_progetto
      FROM export_fn05 f5
        INNER JOIN export_fn04 f4 ON f4.estrazione_riferimento_id = f5.estrazione_riferimento_id
                                     AND f5.cod_locale_progetto = f4.cod_locale_progetto
                                     AND f5.estrazione_riferimento_id = ${estrazione_id}
                                     AND f4.flg_cancellazione = ''S''
    )', '2018-03-26 00:00:00.000000', '2018-03-26 00:00:00.000000', 'N');
INSERT INTO public.controlli_igrue (id, cod_controllo, dati_interessati, tipologia, dettaglio_controllo, dettaglio_errore, note, script_controllo, data_creazione, data_modifica, deleted) VALUES (48, '048', 'SEZIONE FINANZIARIA', 'Coerenza fra dati ', 'Il controllo verifica se per un Pagamento Ammesso associato a uno specifico Pagamento (nella struttura FN07-Pagamenti Ammessi), il relativo Pagamento (nella struttura FN06-Pagamenti) è cancellato. Non può essere validato un progetto per il quale risulti un Pagamento Ammesso associato a un Pagamento cancellato.', 'Sono presenti Pagamenti Ammessi associati a Pagamento padre cancellato.', 'Il Sistema Nazionale di Monitoraggio verifica in fase di acquisizione dei dati l''esistenza del pagamento ''padre'' associato al Pagamento Ammesso. In caso di cancellazione del pagamento ''padre'', tuttavia, può rimanere un''associazione  nel Pagamento Ammesso ''figlio'', generando un''incoerenza. Il controllo è volto a scartare i progetti per cui si verifica tale casistica. ', 'SELECT id AS export_ap00_id, cod_locale_progetto, estrazione_riferimento_id, ''N'' AS valid
FROM export_ap00
WHERE estrazione_riferimento_id =  ${estrazione_id}
AND cod_locale_progetto IN
    (
      SELECT DISTINCT f6.cod_locale_progetto
      FROM export_fn07 f7
        INNER JOIN export_fn06 f6 ON f6.estrazione_riferimento_id = f7.estrazione_riferimento_id
                                     AND f7.cod_locale_progetto = f6.cod_locale_progetto
                                     AND f7.estrazione_riferimento_id = ${estrazione_id}
                                     AND f6.flg_cancellazione = ''S''
    )', '2018-03-26 00:00:00.000000', '2018-03-26 00:00:00.000000', 'N');
INSERT INTO public.controlli_igrue (id, cod_controllo, dati_interessati, tipologia, dettaglio_controllo, dettaglio_errore, note, script_controllo, data_creazione, data_modifica, deleted) VALUES (49, '049', 'SEZIONE FINANZIARIA ', 'Coerenza fra dati ', 'Il controllo verifica se, per inserimento di un Percettore associato a uno specifico Pagamento (nella struttura FN08-Percettori), il relativo Pagamento (nella struttura FN06Pagamenti) è cancellato. Non può essere validato un progetto per il quale risulti un Percettore associato a un Pagamento cancellato', 'Sono presenti Percettori associati a Pagamento padre cancellato.', 'Il Sistema Nazionale di Monitoraggio verifica in fase di acquisizione dei dati l''esistenza del pagamento ''padre'' associato ai Percettori. In caso di cancellazione del pagamento ‘padre’, tuttavia, può rimanere un''associazione nei Percettori ''figli'', generando un''incoerenza. Il controllo è volto a scartare i progetti per cui si verifica tale casistica', 'SELECT id AS export_ap00_id, cod_locale_progetto, estrazione_riferimento_id, ''N'' AS valid
FROM export_ap00
WHERE estrazione_riferimento_id = ${estrazione_id}
AND cod_locale_progetto IN
    (
      SELECT DISTINCT f6.cod_locale_progetto
      FROM export_fn08 f8
        INNER JOIN export_fn06 f6 ON f6.estrazione_riferimento_id = f8.estrazione_riferimento_id
                                     AND f8.cod_locale_progetto = f6.cod_locale_progetto
                                     AND f8.estrazione_riferimento_id = ${estrazione_id}
                                     AND f6.flg_cancellazione = ''S''
    )', '2018-03-26 00:00:00.000000', '2018-03-26 00:00:00.000000', 'N');
INSERT INTO public.controlli_igrue (id, cod_controllo, dati_interessati, tipologia, dettaglio_controllo, dettaglio_errore, note, script_controllo, data_creazione, data_modifica, deleted) VALUES (51, '051', 'SEZIONE FINANZIARIA ', 'Coerenza fra dati ', 'Il controllo verifica se per il singolo progetto, in presenza di dati nella struttura FN05Impegni Ammessi e per stesso codice Livello Gerarchico, il saldo degli Impegni Ammessi al netto dei Disimpegni Ammessi ha valore negativo. Il controllo verifica i saldi per valori del campo  IMPORTO_IMP_AMM della struttura FN05Impegni Ammessi: differenza tra la Sommatoria degli importi con TIPOLOGIA_IMP_AMM =I e la Sommatori degli importi con TIPOLOGIA_IMP_AMM=D; oppure differenza tra la Sommatoria degli importi con TIPOLOGIA_IMP_AMM =I-TR e la Sommatoria degli importi con TIPOLOGIA_IMP_AMM=D-TR). Non può essere validato un progetto per cui la differenza tra Impegni Ammessi e Disimpegni Ammessi per stesso Livello Gerarchico ha valore negativo (deve avere valore positivo o zero). ', 'Saldo negativo Impegni Ammessi e Disimpegni Ammessi per il progetto, su specifico livello gerarchico.', '', 'SELECT id AS export_ap00_id, cod_locale_progetto, estrazione_riferimento_id, ''N'' AS valid
FROM export_ap00
WHERE estrazione_riferimento_id = ${estrazione_id}
AND cod_locale_progetto IN
    (
      SELECT DISTINCT A.cod_locale_progetto
      FROM
        (
          SELECT
            cod_locale_progetto,
            cod_liv_gerarchico,
            SUM(importo_imp_amm::NUMERIC) AS impegno
          FROM export_fn05
          WHERE estrazione_riferimento_id = ${estrazione_id}
                AND tipologia_imp_amm = ''I''
          GROUP BY cod_locale_progetto, cod_liv_gerarchico
        ) A INNER JOIN
        (
          SELECT
            cod_locale_progetto,
            cod_liv_gerarchico,
            SUM(importo_imp_amm::NUMERIC) AS disimpegno
          FROM export_fn05
          WHERE estrazione_riferimento_id = ${estrazione_id}
                AND tipologia_imp_amm = ''D''
          GROUP BY cod_locale_progetto, cod_liv_gerarchico
        ) B ON A.cod_liv_gerarchico = B.cod_liv_gerarchico
               AND A.cod_locale_progetto = B.cod_locale_progetto
      WHERE A.impegno - B.disimpegno < 0

      UNION

      SELECT DISTINCT A.cod_locale_progetto
      FROM
        (
          SELECT
            cod_locale_progetto,
            cod_liv_gerarchico,
            SUM(importo_imp_amm::NUMERIC) AS impegno
          FROM export_fn05
          WHERE estrazione_riferimento_id = ${estrazione_id}
                AND tipologia_imp_amm = ''I-TR''
          GROUP BY cod_locale_progetto, cod_liv_gerarchico
        ) A INNER JOIN
        (
          SELECT
            cod_locale_progetto,
            cod_liv_gerarchico,
            SUM(importo_imp_amm::NUMERIC) AS disimpegno
          FROM export_fn05
          WHERE estrazione_riferimento_id = ${estrazione_id}
                AND tipologia_imp_amm = ''D-TR''
          GROUP BY cod_locale_progetto, cod_liv_gerarchico
        ) B ON A.cod_liv_gerarchico = B.cod_liv_gerarchico
               AND A.cod_locale_progetto = B.cod_locale_progetto
      WHERE A.impegno - B.disimpegno < 0
    )', '2018-03-26 00:00:00.000000', '2018-03-26 00:00:00.000000', 'N');
INSERT INTO public.controlli_igrue (id, cod_controllo, dati_interessati, tipologia, dettaglio_controllo, dettaglio_errore, note, script_controllo, data_creazione, data_modifica, deleted) VALUES (52, '052', 'SEZIONE FINANZIARIA ', 'Coerenza fra dati ', 'Il controllo verifica se per il singolo progetto, in presenza di dati nella struttura FN06Pagamenti, il saldo dei Pagamenti al netto delle Rettifiche ha valore negativo. Il controllo verifica i saldi per valori del campo IMPORTO_PAG della struttura FN06Pagamenti: differenza tra la Sommatoria degli importi con TIPOLOGIA_PAG=P e la Sommatoria degli importi con TIPOLOGIA_PAG=R; oppure differenza tra la Sommatoria degli importi con TIPOLOGIA_PAG=P-TR e la Sommatoria degli importi con TIPOLOGIA_PAG=R-TR. Non può essere validato un progetto per cui la differenza tra Pagamenti e Rettifiche ha valore negativo (deve avere valore positivo o zero). ', 'Saldo negativo Pagamenti e Rettifiche per il progetto.', '', 'SELECT id AS export_ap00_id, cod_locale_progetto, estrazione_riferimento_id, ''N'' AS valid
FROM export_ap00
WHERE estrazione_riferimento_id = ${estrazione_id}
AND cod_locale_progetto IN
    (
      SELECT DISTINCT A.cod_locale_progetto
      FROM
        (
          SELECT
            cod_locale_progetto,
            SUM(importo_pag::NUMERIC) AS pagamento
          FROM export_fn06
          WHERE estrazione_riferimento_id = ${estrazione_id}
                AND tipologia_pag = ''P''
          GROUP BY cod_locale_progetto
        ) A INNER JOIN
        (
          SELECT
            cod_locale_progetto,
            SUM(importo_pag::NUMERIC) AS rettifica
          FROM export_fn06
          WHERE estrazione_riferimento_id = ${estrazione_id}
                AND tipologia_pag = ''R''
          GROUP BY cod_locale_progetto
        ) B ON A.cod_locale_progetto = B.cod_locale_progetto
      WHERE A.pagamento - B.rettifica < 0

      UNION

      SELECT DISTINCT A.cod_locale_progetto
      FROM
        (
          SELECT
            cod_locale_progetto,
            SUM(importo_pag::NUMERIC) AS pagamento
          FROM export_fn06
          WHERE estrazione_riferimento_id = ${estrazione_id}
                AND tipologia_pag = ''P-TR''
          GROUP BY cod_locale_progetto
        ) A INNER JOIN
        (
          SELECT
            cod_locale_progetto,
            SUM(importo_pag::NUMERIC) AS rettifica
          FROM export_fn06
          WHERE estrazione_riferimento_id = ${estrazione_id}
                AND tipologia_pag = ''R-TR''
          GROUP BY cod_locale_progetto
        ) B ON A.cod_locale_progetto = B.cod_locale_progetto
      WHERE A.pagamento - B.rettifica < 0

    )', '2018-03-26 00:00:00.000000', '2018-03-26 00:00:00.000000', 'N');
INSERT INTO public.controlli_igrue (id, cod_controllo, dati_interessati, tipologia, dettaglio_controllo, dettaglio_errore, note, script_controllo, data_creazione, data_modifica, deleted) VALUES (53, '053', 'SEZIONE FINANZIARIA ', 'Coerenza fra dati ', 'Il controllo verifica se per il singolo progetto, in presenza di dati nella struttura FN07Pagamenti Ammessi e per lo stesso codice Livello Gerarchico, il saldo dei Pagamenti Ammessi al netto delle Rettifiche Ammesse ha valore negativo. Il controllo verifica i saldi per valori del campo IMPORTO_PAG_AMM della struttura FN07Pagamenti Ammessi: differenza tra la Sommatoria degli importi con TIPOLOGIA_PAG_AMM =P e la Sommatoria degli importi con TIPOLOGIA_PAG_AMM=R; oppure differenza tra la Sommatoria degli importi con TIPOLOGIA_PAG=P-TR e la Sommatoria degli importi con TIPOLOGIA_PAG=R-TR. Non può essere validato un progetto per cui la differenza tra Pagamenti Ammessi e Rettifiche Ammesse per lo stesso Livello Gerarchico ha valore negativo (deve avere valore positivo o zero). ', 'Saldo negativo Pagamenti Ammessi e Rettifiche Ammesse per il progetto, su specifico livello gerarchico.', '', 'SELECT id AS export_ap00_id, cod_locale_progetto, estrazione_riferimento_id, ''N'' AS valid
FROM export_ap00
WHERE estrazione_riferimento_id = ${estrazione_id}
AND cod_locale_progetto IN
    (
      SELECT DISTINCT A.cod_locale_progetto
      FROM
        (
          SELECT
            cod_locale_progetto,
            cod_liv_gerarchico,
            SUM(importo_pag_amm::NUMERIC) AS pagamento
          FROM export_fn07
          WHERE estrazione_riferimento_id = ${estrazione_id}
                AND tipologia_pag_amm = ''P''
          GROUP BY cod_locale_progetto, cod_liv_gerarchico
        ) A INNER JOIN
        (
          SELECT
            cod_locale_progetto,
            cod_liv_gerarchico,
            SUM(importo_pag_amm::NUMERIC) AS rettifica
          FROM export_fn07
          WHERE estrazione_riferimento_id = ${estrazione_id}
                AND tipologia_pag_amm = ''R''
          GROUP BY cod_locale_progetto, cod_liv_gerarchico
        ) B ON A.cod_liv_gerarchico = B.cod_liv_gerarchico
               AND A.cod_locale_progetto = B.cod_locale_progetto
      WHERE A.pagamento - B.rettifica < 0

      UNION

      SELECT DISTINCT A.cod_locale_progetto
      FROM
        (
          SELECT
            cod_locale_progetto,
            cod_liv_gerarchico,
            SUM(importo_pag_amm::NUMERIC) AS pagamento
          FROM export_fn07
          WHERE estrazione_riferimento_id = ${estrazione_id}
                AND tipologia_pag_amm = ''P-TR''
          GROUP BY cod_locale_progetto, cod_liv_gerarchico
        ) A INNER JOIN
        (
          SELECT
            cod_locale_progetto,
            cod_liv_gerarchico,
            SUM(importo_pag_amm::NUMERIC) AS rettifica
          FROM export_fn07
          WHERE estrazione_riferimento_id = ${estrazione_id}
                AND tipologia_pag_amm = ''R-TR''
          GROUP BY cod_locale_progetto, cod_liv_gerarchico
        ) B ON A.cod_liv_gerarchico = B.cod_liv_gerarchico
               AND A.cod_locale_progetto = B.cod_locale_progetto
      WHERE A.pagamento - B.rettifica < 0
    )', '2018-03-26 00:00:00.000000', '2018-03-26 00:00:00.000000', 'N');
INSERT INTO public.controlli_igrue (id, cod_controllo, dati_interessati, tipologia, dettaglio_controllo, dettaglio_errore, note, script_controllo, data_creazione, data_modifica, deleted) VALUES (54, '054', 'SEZIONE FINANZIARIA', 'Coerenza fra dati ', 'Il controllo verifica se, per il singolo progetto, il valore totale degli Impegni Ammessi nella struttura FN05-Impegni  Ammessi (al netto di disimpegni) è maggiore del valore totale degli Impegni nella struttura FN04-Impegni (al netto di disimpegni). Non può essere validato un progetto per cui il totale degli Impegni Ammessi è maggiore del totale degli Impegni. ', 'Per il progetto l’importo totale degli Impegni Ammessi è maggiore dell’importo totale degli Impegni.', '', 'SELECT id AS export_ap00_id, cod_locale_progetto, estrazione_riferimento_id, ''N'' AS valid
FROM export_ap00
WHERE estrazione_riferimento_id = ${estrazione_id}
AND cod_locale_progetto IN
    (
      SELECT DISTINCT ammessi.cod_locale_progetto
      FROM
        (
          SELECT
            A.cod_locale_progetto,
            impegno - COALESCE(disimpegno, 0) AS importo
          FROM
            (
              SELECT
                cod_locale_progetto,
                SUM(importo_imp_amm::NUMERIC) AS impegno
              FROM export_fn05
              WHERE estrazione_riferimento_id = ${estrazione_id}
                    AND tipologia_imp_amm IN (''I'', ''I-TR'')
              GROUP BY cod_locale_progetto
            ) A LEFT JOIN
            (
              SELECT
                cod_locale_progetto,
                SUM(importo_imp_amm::NUMERIC) AS disimpegno
              FROM export_fn05
              WHERE estrazione_riferimento_id = ${estrazione_id}
                    AND tipologia_imp_amm IN (''D'', ''D-TR'')
              GROUP BY cod_locale_progetto
            ) B ON A.cod_locale_progetto = B.cod_locale_progetto
        ) ammessi LEFT JOIN
        (
          SELECT
            A.cod_locale_progetto,
            impegno - COALESCE(disimpegno, 0) AS importo
          FROM
            (
              SELECT
                cod_locale_progetto,
                SUM(importo_impegno::NUMERIC) AS impegno
              FROM export_fn04
              WHERE estrazione_riferimento_id =  ${estrazione_id}
                    AND tipologia_impegno IN (''I'', ''I-TR'')
              GROUP BY cod_locale_progetto
            ) A LEFT JOIN
            (
              SELECT
                cod_locale_progetto,
                SUM(importo_impegno::NUMERIC) AS disimpegno
              FROM export_fn04
              WHERE estrazione_riferimento_id =  ${estrazione_id}
                    AND tipologia_impegno IN (''D'', ''D-TR'')
              GROUP BY cod_locale_progetto
            ) B ON A.cod_locale_progetto = B.cod_locale_progetto
        ) impegni ON ammessi.cod_locale_progetto = impegni.cod_locale_progetto
      WHERE ammessi.importo > impegni.importo
    )', '2018-03-26 00:00:00.000000', '2018-03-26 00:00:00.000000', 'N');
INSERT INTO public.controlli_igrue (id, cod_controllo, dati_interessati, tipologia, dettaglio_controllo, dettaglio_errore, note, script_controllo, data_creazione, data_modifica, deleted) VALUES (13, '013', 'ANAGRAFICA DEI PROGETTI E CLASSIFICAZIONI ', 'Coerenza fra dati ', 'Il controllo verifica se per il progetto - ad eccezione del caso in cui sia relativo a una Procedura di Attivazione Originaria - è assente la struttura AP01-Associazione Progetti Procedura, con associazione a una Procedura di Attivazione che risulti non cancellata (ossia con il campo FLG_CANCELLAZIONE diverso da ‘S’ nella struttura PA00-Procedure di Attivazione). Salvo i casi di progetti relativi a una Procedura di Attivazione Originaria, non può essere validato un progetto per cui è assente l''associazione con una Procedura di Attivazione (che risulti non cancellata). ', 'E'' assente una Procedura di Attivazione collegata al progetto', '', 'SELECT DISTINCT id AS export_ap00_id, cod_locale_progetto, estrazione_riferimento_id, ''N'' AS valid
FROM export_ap00
WHERE estrazione_riferimento_id = ${estrazione_id}
AND export_ap00.tip_proc_att_orig NOT IN (''1'',''2'',''3'',''4'')
AND cod_locale_progetto NOT IN (
        SELECT DISTINCT cod_locale_progetto
        FROM export_ap01
        WHERE estrazione_riferimento_id = ${estrazione_id}
              AND flg_cancellazione IS NULL
      )', '2018-03-26 00:00:00.000000', '2018-03-26 00:00:00.000000', 'N');
INSERT INTO public.controlli_igrue (id, cod_controllo, dati_interessati, tipologia, dettaglio_controllo, dettaglio_errore, note, script_controllo, data_creazione, data_modifica, deleted) VALUES (40, '040', 'SEZIONE PROCEDURALE/ INDICATORI DI RISULTATO E FISICI ', 'Coerenza fra dati ', 'Il controllo verifica se, a conclusione della fase di esecuzione nell''iter di progetto (Data Fine Effettiva valorizzata per il rispettivo COD_FASE=0102;0202;0306;0602;0702;0802 nella struttura PR00-Iter di Progetto) è assente il valore realizzato per ciascun Indicatore di Output associato al progetto (VALORE REALIZZATO nella struttura IN01Indicatori di Output). Non può essere validato un progetto per il quale non sia stato quantificato il valore a conclusione degli Indicatori di Output alla fine della fase di Esecuzione. ', 'Per Fase procedurale di esecuzione con data fine effettiva valorizzata, sono assenti valori realizzati di Indicatori di Output associati al progetto.', '', 'SELECT id AS export_ap00_id, cod_locale_progetto, estrazione_riferimento_id, ''N'' AS valid
FROM export_ap00
WHERE estrazione_riferimento_id = ${estrazione_id}
      AND cod_locale_progetto IN
          (
            SELECT DISTINCT cod_locale_progetto
            FROM export_pr00
            WHERE estrazione_riferimento_id = ${estrazione_id}
                  AND cod_fase IN (''0102'', ''0202'', ''0306'', ''0602'', ''0702'', ''0802'')
                  AND data_fine_effettiva IS NOT NULL
                  AND cod_locale_progetto IN (
              SELECT DISTINCT cod_locale_progetto
              FROM export_in01
              WHERE estrazione_riferimento_id = ${estrazione_id}
                    AND valore_realizzato::NUMERIC < 0 OR valore_realizzato IS NULL
            )
          )', '2018-03-26 00:00:00.000000', '2018-03-26 00:00:00.000000', 'N');
INSERT INTO public.controlli_igrue (id, cod_controllo, dati_interessati, tipologia, dettaglio_controllo, dettaglio_errore, note, script_controllo, data_creazione, data_modifica, deleted) VALUES (26, '026', 'SEZIONE FINANZIARIA ', 'Coerenza fra dati ', 'Il controllo verifica se il valore totale dei Pagamenti Ammessi associati a un Pagamento è maggiore dell''importo del Pagamento corrispondente (per le parti di chiave in comune nella struttura FN06Pagamenti). Non può essere validato un progetto per cui il totale dei Pagamenti Ammessi a valere su un singolo Pagamento è maggiore del Pagamento associato. ', 'Sono presenti Pagamenti Ammessi con importo totale maggiore dell''importo del Pagamento associato.', 'I Pagamenti sono considerati al netto di eventuali Rettifiche. Con riferimento alle Tipologie di Pagamento Ammesso e Pagamento, il controllo verifica: gli importi Pagamento Ammesso di tipologie P e R rispetto agli importi Pagamento di tipologie P e R; gli importi Pagamento Ammesso P-TR e R-TR rispetto agli importi Pagamento P-TR e RTR. ', 'SELECT id AS export_ap00_id, cod_locale_progetto, estrazione_riferimento_id, ''N'' AS valid
FROM export_ap00
WHERE estrazione_riferimento_id = ${estrazione_id}
AND cod_locale_progetto IN
    (
      SELECT DISTINCT ammessi.cod_locale_progetto
      FROM
        (
          SELECT
            A.cod_locale_progetto,
            A.tipo,
            pagamento - COALESCE(rettifica, 0) AS importo
          FROM
            (
              SELECT
                cod_locale_progetto,
                CASE WHEN tipologia_pag_amm = ''P'' THEN 1 ELSE 2 END tipo,
                SUM(importo_pag_amm::NUMERIC) AS pagamento
              FROM export_fn07
              WHERE estrazione_riferimento_id = ${estrazione_id}
                    AND tipologia_pag_amm IN (''P'')
              GROUP BY cod_locale_progetto, CASE WHEN tipologia_pag_amm = ''P'' THEN 1 ELSE 2 END
            ) A LEFT JOIN
            (
              SELECT
                cod_locale_progetto,
                CASE WHEN tipologia_pag_amm = ''R'' THEN 1 ELSE 2 END tipo ,
                SUM(importo_pag_amm::NUMERIC) AS rettifica
              FROM export_fn07
              WHERE estrazione_riferimento_id = ${estrazione_id}
                    AND tipologia_pag_amm IN (''R'')
              GROUP BY cod_locale_progetto, CASE WHEN tipologia_pag_amm = ''R'' THEN 1 ELSE 2 END
            ) B ON A.cod_locale_progetto = B.cod_locale_progetto
                  AND A.tipo = B.tipo
        ) ammessi INNER JOIN
        (
          SELECT
            A.cod_locale_progetto,
            A.tipo,
            pagamento - COALESCE(rettifica, 0) AS importo
          FROM
            (
              SELECT
                cod_locale_progetto,
                CASE WHEN tipologia_pag = ''P'' THEN 1 ELSE 2 END tipo,
                SUM(importo_pag::NUMERIC) AS pagamento
              FROM export_fn06
              WHERE estrazione_riferimento_id = ${estrazione_id}
                    AND tipologia_pag IN (''P'')
              GROUP BY cod_locale_progetto, CASE WHEN tipologia_pag = ''P'' THEN 1 ELSE 2 END
            ) A LEFT JOIN
            (
              SELECT
                cod_locale_progetto,
                CASE WHEN tipologia_pag = ''R'' THEN 1 ELSE 2 END tipo,
                SUM(importo_pag::NUMERIC) AS rettifica
              FROM export_fn06
              WHERE estrazione_riferimento_id = ${estrazione_id}
                    AND tipologia_pag IN (''R'')
              GROUP BY cod_locale_progetto, CASE WHEN tipologia_pag = ''R'' THEN 1 ELSE 2 END
            ) B ON A.cod_locale_progetto = B.cod_locale_progetto
                AND A.tipo = B.tipo
        ) pagamenti ON ammessi.cod_locale_progetto = pagamenti.cod_locale_progetto

      WHERE ammessi.importo > pagamenti.importo
    )
UNION
SELECT id AS export_ap00_id, cod_locale_progetto, estrazione_riferimento_id, ''N'' AS valid
FROM export_ap00
WHERE estrazione_riferimento_id = ${estrazione_id}
AND cod_locale_progetto IN
    (
      SELECT DISTINCT ammessi.cod_locale_progetto
      FROM
        (
          SELECT
            A.cod_locale_progetto,
            A.tipo,
            pagamento - COALESCE(rettifica, 0) AS importo
          FROM
            (
              SELECT
                cod_locale_progetto,
                CASE WHEN tipologia_pag_amm = ''P-TR'' THEN 1 ELSE 2 END tipo,
                SUM(importo_pag_amm::NUMERIC) AS pagamento
              FROM export_fn07
              WHERE estrazione_riferimento_id = ${estrazione_id}
                    AND tipologia_pag_amm IN (''P-TR'')
              GROUP BY cod_locale_progetto, CASE WHEN tipologia_pag_amm = ''P-TR'' THEN 1 ELSE 2 END
            ) A LEFT JOIN
            (
              SELECT
                cod_locale_progetto,
                CASE WHEN tipologia_pag_amm = ''R-TR'' THEN 1 ELSE 2 END tipo ,
                SUM(importo_pag_amm::NUMERIC) AS rettifica
              FROM export_fn07
              WHERE estrazione_riferimento_id = ${estrazione_id}
                    AND tipologia_pag_amm IN (''R-TR'')
              GROUP BY cod_locale_progetto, CASE WHEN tipologia_pag_amm = ''R-TR'' THEN 1 ELSE 2 END
            ) B ON A.cod_locale_progetto = B.cod_locale_progetto
                  AND A.tipo = B.tipo
        ) ammessi INNER JOIN
        (
          SELECT
            A.cod_locale_progetto,
            A.tipo,
            pagamento - COALESCE(rettifica, 0) AS importo
          FROM
            (
              SELECT
                cod_locale_progetto,
                CASE WHEN tipologia_pag = ''P-TR'' THEN 1 ELSE 2 END tipo,
                SUM(importo_pag::NUMERIC) AS pagamento
              FROM export_fn06
              WHERE estrazione_riferimento_id = ${estrazione_id}
                    AND tipologia_pag IN (''P-TR'')
              GROUP BY cod_locale_progetto, CASE WHEN tipologia_pag = ''P-TR'' THEN 1 ELSE 2 END
            ) A LEFT JOIN
            (
              SELECT
                cod_locale_progetto,
                CASE WHEN tipologia_pag = ''R-TR'' THEN 1 ELSE 2 END  tipo,
                SUM(importo_pag::NUMERIC) AS rettifica
              FROM export_fn06
              WHERE estrazione_riferimento_id = ${estrazione_id}
                    AND tipologia_pag IN (''R-TR'')
              GROUP BY cod_locale_progetto, CASE WHEN tipologia_pag = ''R-TR'' THEN 1 ELSE 2 END
            ) B ON A.cod_locale_progetto = B.cod_locale_progetto
                AND A.tipo = B.tipo
        ) pagamenti ON ammessi.cod_locale_progetto = pagamenti.cod_locale_progetto

      WHERE ammessi.importo > pagamenti.importo
    )', '2018-03-26 00:00:00.000000', '2018-03-26 00:00:00.000000', 'N');
INSERT INTO public.controlli_igrue (id, cod_controllo, dati_interessati, tipologia, dettaglio_controllo, dettaglio_errore, note, script_controllo, data_creazione, data_modifica, deleted) VALUES (25, '025', 'SEZIONE FINANZIARIA ', 'Coerenza fra dati ', 'Il controllo verifica se il valore totale degli Impegni Ammessi associati a un Impegno è maggiore dell''importo dell''impegno corrispondente (per le parti di chiave in comune nella struttura FN04-Impegni). Non può essere validato un progetto per cui il totale degli Impegni Ammessi a valere su un singolo Impegno è maggiore dell''Impegno associato. ', 'Sono presenti Impegni Ammessi con importo totale maggiore dell''importo dell''Impegno associato.', 'Gli Impegni sono considerati al netto di eventuali Disimpegni. Con riferimento alle Tipologie di Impegno Ammesso e Impegno, il controllo verifica: gli importi Impegno Ammesso di tipologie I e D rispetto agli importi Impegno di tipologie I e D; gli importi Impegno Ammesso I-TR e D-TR rispetto agli importi Impegno I-TR e D-TR', 'SELECT id AS export_ap00_id, cod_locale_progetto, estrazione_riferimento_id, ''N'' AS valid
FROM export_ap00
WHERE estrazione_riferimento_id = ${estrazione_id}
AND cod_locale_progetto IN
    (
      SELECT DISTINCT ammessi.cod_locale_progetto
      FROM
        (
          SELECT
            A.cod_locale_progetto,
            A.tipo,
            impegno - COALESCE(disimpegno, 0) AS importo
          FROM
            (
              SELECT
                cod_locale_progetto,
                CASE WHEN tipologia_imp_amm = ''I'' THEN 1  ELSE 2 END  tipo,
                SUM(importo_imp_amm::NUMERIC) AS impegno
              FROM export_fn05
              WHERE estrazione_riferimento_id = ${estrazione_id}
                    AND tipologia_imp_amm IN (''I'', ''I-TR'')
              GROUP BY cod_locale_progetto,
                        CASE WHEN tipologia_imp_amm = ''I'' THEN 1  ELSE 2 END
            ) A LEFT JOIN
            (
              SELECT
                cod_locale_progetto,
                CASE WHEN tipologia_imp_amm = ''D'' THEN 1  ELSE 2 END  tipo,
                SUM(importo_imp_amm::NUMERIC) AS disimpegno
              FROM export_fn05
              WHERE estrazione_riferimento_id = ${estrazione_id}
                    AND tipologia_imp_amm IN (''D'', ''D-TR'')
              GROUP BY cod_locale_progetto,
                        CASE WHEN tipologia_imp_amm = ''D'' THEN 1  ELSE 2 END
            ) B ON A.cod_locale_progetto = B.cod_locale_progetto
                    AND A.tipo = B.tipo
        ) ammessi INNER JOIN
        (
         SELECT
          A.cod_locale_progetto,
          A.tipo,
          impegno - COALESCE(disimpegno, 0) AS importo
          FROM
            (
              SELECT
                cod_locale_progetto,
                CASE WHEN tipologia_impegno = ''I'' THEN 1 ELSE 2 END tipo,
                SUM(importo_impegno::NUMERIC) AS impegno
              FROM export_fn04
              WHERE estrazione_riferimento_id = ${estrazione_id}
                    AND tipologia_impegno IN (''I'', ''I-TR'')
              GROUP BY cod_locale_progetto,
                        CASE WHEN tipologia_impegno = ''I'' THEN 1  ELSE 2 END
            ) A LEFT JOIN
            (
              SELECT
                cod_locale_progetto,
                CASE WHEN tipologia_impegno = ''D'' THEN 1  ELSE 2 END  tipo,
                SUM(importo_impegno::NUMERIC) AS disimpegno
              FROM export_fn04
              WHERE estrazione_riferimento_id = ${estrazione_id}
                    AND tipologia_impegno IN (''D'', ''D-TR'')
              GROUP BY cod_locale_progetto,
                        CASE WHEN tipologia_impegno = ''D'' THEN 1  ELSE 2 END
            ) B ON A.cod_locale_progetto = B.cod_locale_progetto
                    AND A.tipo = B.tipo
        ) impegni ON ammessi.cod_locale_progetto = impegni.cod_locale_progetto
                  AND ammessi.tipo = impegni.tipo
      WHERE ammessi.importo > impegni.importo
    )', '2018-03-26 00:00:00.000000', '2018-03-26 00:00:00.000000', 'N');
INSERT INTO public.controlli_igrue (id, cod_controllo, dati_interessati, tipologia, dettaglio_controllo, dettaglio_errore, note, script_controllo, data_creazione, data_modifica, deleted) VALUES (28, '028', 'SEZIONE FINANZIARIA ', 'Coerenza fra dati ', 'Il controllo verifica se per il singolo progetto il valore totale dei Pagamenti (Sommatoria importi nella struttura FN06-Pagamenti) è maggiore del valore totale degli Impegni (Sommatoria importi nella struttura FN04Impegni). Non può essere validato un progetto per cui i Pagamenti totali del progetto sono maggiori degli Impegni totali. ', 'L''importo totale dei Pagamenti di tipologia (P,R) è maggiore dell''importo totale degli Impegni di tipologia (I,D). L''importo totale dei Pagamenti di tipologia (PTR,R-TR) è maggiore dell''importo totale degli Impegni di tipologia (I-TR,DTR).', 'I Pagamenti sono considerati al netto di eventuali Rettifiche. Gli Impegni sono considerati al netto di eventuali Disimpegni. Con riferimento alle tipologie di Impegno e Pagamento, il controllo verifica: gli importi Pagamenti delle tipologie Pe R rispetto agli importi Impegni delle tipologie I e D; gli importi Pagamenti delle tipologie P-TR e R-TR rispetto agli importi Impegni delle tipologie I-ITR e DTR. ', 'SELECT id AS export_ap00_id, cod_locale_progetto, estrazione_riferimento_id, ''N'' AS valid
FROM export_ap00
WHERE estrazione_riferimento_id = ${estrazione_id}
AND cod_locale_progetto IN
    (
      SELECT DISTINCT pagamenti.cod_locale_progetto
      FROM
        (
          SELECT
            A.cod_locale_progetto,
            pagamento - COALESCE(rettifica, 0) AS importo
          FROM
            (
              SELECT
                cod_locale_progetto,
                SUM(importo_pag::NUMERIC) AS pagamento
              FROM export_fn06
              WHERE estrazione_riferimento_id = ${estrazione_id}
                    AND tipologia_pag IN (''P'')
              GROUP BY cod_locale_progetto
            ) A LEFT JOIN
            (
              SELECT
                cod_locale_progetto,
                SUM(importo_pag::NUMERIC) AS rettifica
              FROM export_fn06
              WHERE estrazione_riferimento_id = ${estrazione_id}
                    AND tipologia_pag IN (''R'')
              GROUP BY cod_locale_progetto
            ) B ON A.cod_locale_progetto = B.cod_locale_progetto
        ) pagamenti INNER JOIN
        (
         SELECT
          A.cod_locale_progetto,
          impegno - COALESCE(disimpegno, 0) AS importo
          FROM
            (
              SELECT
                cod_locale_progetto,
                SUM(importo_impegno::NUMERIC) AS impegno
              FROM export_fn04
              WHERE estrazione_riferimento_id = ${estrazione_id}
                    AND tipologia_impegno IN (''I'')
              GROUP BY cod_locale_progetto
            ) A LEFT JOIN
            (
              SELECT
                cod_locale_progetto,
                SUM(importo_impegno::NUMERIC) AS disimpegno
              FROM export_fn04
              WHERE estrazione_riferimento_id = ${estrazione_id}
                    AND tipologia_impegno IN (''D'')
              GROUP BY cod_locale_progetto
            ) B ON A.cod_locale_progetto = B.cod_locale_progetto
        ) impegni ON pagamenti.cod_locale_progetto = impegni.cod_locale_progetto
      WHERE pagamenti.importo > impegni.importo
    )
UNION
SELECT id AS export_ap00_id, cod_locale_progetto, estrazione_riferimento_id, ''N'' AS valid
FROM export_ap00
WHERE estrazione_riferimento_id = ${estrazione_id}
AND cod_locale_progetto IN
    (
      SELECT DISTINCT pagamenti.cod_locale_progetto
      FROM
        (
          SELECT
            A.cod_locale_progetto,
            pagamento - COALESCE(rettifica, 0) AS importo
          FROM
            (
              SELECT
                cod_locale_progetto,
                SUM(importo_pag::NUMERIC) AS pagamento
              FROM export_fn06
              WHERE estrazione_riferimento_id = ${estrazione_id}
                    AND tipologia_pag IN (''P-TR'')
              GROUP BY cod_locale_progetto
            ) A LEFT JOIN
            (
              SELECT
                cod_locale_progetto,
                SUM(importo_pag::NUMERIC) AS rettifica
              FROM export_fn06
              WHERE estrazione_riferimento_id = ${estrazione_id}
                    AND tipologia_pag IN (''R-TR'')
              GROUP BY cod_locale_progetto
            ) B ON A.cod_locale_progetto = B.cod_locale_progetto
        ) pagamenti INNER JOIN
        (
         SELECT
          A.cod_locale_progetto,
          impegno - COALESCE(disimpegno, 0) AS importo
          FROM
            (
              SELECT
                cod_locale_progetto,
                SUM(importo_impegno::NUMERIC) AS impegno
              FROM export_fn04
              WHERE estrazione_riferimento_id = ${estrazione_id}
                    AND tipologia_impegno IN (''I-TR'')
              GROUP BY cod_locale_progetto
            ) A LEFT JOIN
            (
              SELECT
                cod_locale_progetto,
                SUM(importo_impegno::NUMERIC) AS disimpegno
              FROM export_fn04
              WHERE estrazione_riferimento_id = ${estrazione_id}
                    AND tipologia_impegno IN (''D-TR'')
              GROUP BY cod_locale_progetto
            ) B ON A.cod_locale_progetto = B.cod_locale_progetto
        ) impegni ON pagamenti.cod_locale_progetto = impegni.cod_locale_progetto
      WHERE pagamenti.importo > impegni.importo
    )', '2018-03-26 00:00:00.000000', '2018-03-26 00:00:00.000000', 'N');
INSERT INTO public.controlli_igrue (id, cod_controllo, dati_interessati, tipologia, dettaglio_controllo, dettaglio_errore, note, script_controllo, data_creazione, data_modifica, deleted) VALUES (30, '030', 'SEZIONE FINANZIARIA ', 'Coerenza fra dati ', 'Il controllo verifica se per il singolo progetto e per lo stesso Livello Gerarchico il valore totale dei pagamenti ammessi (Sommatoria importi nella struttura FN07-Pagamenti Ammessi) è maggiore del valore totale degli impegni ammessi (Sommatoria importi nella struttura FN05-Impegni Ammessi). Non può essere validato un progetto per cui, a parità di Livello Gerarchico, i Pagamenti Ammessi totali del progetto sono maggiori degli Impegni Ammessi totali. ', 'Sono presenti, per stesso livello gerarchico, Pagamenti Ammessi maggiori degli Impegni Ammessi.', 'I Pagamenti Ammessi sono considerati al netto di eventuali Rettifiche. Gli Impegni Ammessi sono considerati al netto di eventuali Disimpegni. Con riferimento alle Tipologie di Pagamento Ammesso e Impegno Ammesso, il controllo verifica: gli importi Pagamento Ammesso P e R rispetto agli importi Impegno Ammesso I e D; gli importi Pagamento Ammesso P-TR e R-TR rispetto agli importi Impegno Ammesso ITR e D-TR.', 'SELECT id AS export_ap00_id, cod_locale_progetto, estrazione_riferimento_id, ''N'' AS valid
FROM export_ap00
WHERE estrazione_riferimento_id = ${estrazione_id}
AND cod_locale_progetto IN
    (
      SELECT DISTINCT pagamenti.cod_locale_progetto
      FROM
        (
            SELECT
              A.cod_locale_progetto,
              A.cod_liv_gerarchico,
              pagamento - COALESCE(rettifica, 0) AS importo
            FROM
              (
                SELECT
                  cod_locale_progetto,
                  cod_liv_gerarchico,
                  SUM(importo_pag_amm::NUMERIC) AS pagamento
                FROM export_fn07
                WHERE estrazione_riferimento_id = ${estrazione_id}
                      AND tipologia_pag_amm IN (''P'')
                GROUP BY cod_locale_progetto, cod_liv_gerarchico
              ) A LEFT JOIN
              (
                SELECT
                  cod_locale_progetto,
                  cod_liv_gerarchico,
                  SUM(importo_pag_amm::NUMERIC) AS rettifica
                FROM export_fn07
                WHERE estrazione_riferimento_id = ${estrazione_id}
                      AND tipologia_pag_amm IN (''R'')
                GROUP BY cod_locale_progetto, cod_liv_gerarchico
              ) B ON A.cod_locale_progetto = B.cod_locale_progetto
                      AND A.cod_liv_gerarchico = B.cod_liv_gerarchico

        ) pagamenti  INNER JOIN
        (
            SELECT
              A.cod_locale_progetto,
              A.cod_liv_gerarchico,
              impegno - COALESCE(disimpegno, 0) AS importo
            FROM
              (
                SELECT
                  cod_locale_progetto,
                  cod_liv_gerarchico,
                  SUM(importo_imp_amm::NUMERIC) AS impegno
                FROM export_fn05
                WHERE estrazione_riferimento_id = ${estrazione_id}
                      AND tipologia_imp_amm IN (''I'')
                GROUP BY cod_locale_progetto, cod_liv_gerarchico
              ) A LEFT JOIN
              (
                SELECT
                  cod_locale_progetto,
                  cod_liv_gerarchico,
                  SUM(importo_imp_amm::NUMERIC) AS disimpegno
                FROM export_fn05
                WHERE estrazione_riferimento_id = ${estrazione_id}
                      AND tipologia_imp_amm IN (''D'')
                GROUP BY cod_locale_progetto, cod_liv_gerarchico
              ) B ON A.cod_locale_progetto = B.cod_locale_progetto
                      AND A.cod_liv_gerarchico = B.cod_liv_gerarchico

        ) impegni ON pagamenti.cod_locale_progetto = impegni.cod_locale_progetto
                  AND pagamenti.cod_liv_gerarchico = impegni.cod_liv_gerarchico
      WHERE pagamenti.importo > impegni.importo
    )
UNION
SELECT id AS export_ap00_id, cod_locale_progetto, estrazione_riferimento_id, ''N'' AS valid
FROM export_ap00
WHERE estrazione_riferimento_id = ${estrazione_id}
AND cod_locale_progetto IN
    (
      SELECT DISTINCT pagamenti.cod_locale_progetto
      FROM
        (
            SELECT
              A.cod_locale_progetto,
              A.cod_liv_gerarchico,
              pagamento - COALESCE(rettifica, 0) AS importo
            FROM
              (
                SELECT
                  cod_locale_progetto,
                  cod_liv_gerarchico,
                  SUM(importo_pag_amm::NUMERIC) AS pagamento
                FROM export_fn07
                WHERE estrazione_riferimento_id = ${estrazione_id}
                      AND tipologia_pag_amm IN (''P-TR'')
                GROUP BY cod_locale_progetto, cod_liv_gerarchico
              ) A LEFT JOIN
              (
                SELECT
                  cod_locale_progetto,
                  cod_liv_gerarchico,
                  SUM(importo_pag_amm::NUMERIC) AS rettifica
                FROM export_fn07
                WHERE estrazione_riferimento_id = ${estrazione_id}
                      AND tipologia_pag_amm IN (''R-TR'')
                GROUP BY cod_locale_progetto, cod_liv_gerarchico
              ) B ON A.cod_locale_progetto = B.cod_locale_progetto
                      AND A.cod_liv_gerarchico = B.cod_liv_gerarchico

        ) pagamenti  INNER JOIN
        (
            SELECT
              A.cod_locale_progetto,
              A.cod_liv_gerarchico,
              impegno - COALESCE(disimpegno, 0) AS importo
            FROM
              (
                SELECT
                  cod_locale_progetto,
                  cod_liv_gerarchico,
                  SUM(importo_imp_amm::NUMERIC) AS impegno
                FROM export_fn05
                WHERE estrazione_riferimento_id = ${estrazione_id}
                      AND tipologia_imp_amm IN (''I-TR'')
                GROUP BY cod_locale_progetto, cod_liv_gerarchico
              ) A LEFT JOIN
              (
                SELECT
                  cod_locale_progetto,
                  cod_liv_gerarchico,
                  SUM(importo_imp_amm::NUMERIC) AS disimpegno
                FROM export_fn05
                WHERE estrazione_riferimento_id = ${estrazione_id}
                      AND tipologia_imp_amm IN (''D-TR'')
                GROUP BY cod_locale_progetto, cod_liv_gerarchico
              ) B ON A.cod_locale_progetto = B.cod_locale_progetto
                      AND A.cod_liv_gerarchico = B.cod_liv_gerarchico

        ) impegni ON pagamenti.cod_locale_progetto = impegni.cod_locale_progetto
                  AND pagamenti.cod_liv_gerarchico = impegni.cod_liv_gerarchico
      WHERE pagamenti.importo > impegni.importo
    )', '2018-03-26 00:00:00.000000', '2018-03-26 00:00:00.000000', 'N');
INSERT INTO public.controlli_igrue (id, cod_controllo, dati_interessati, tipologia, dettaglio_controllo, dettaglio_errore, note, script_controllo, data_creazione, data_modifica, deleted) VALUES (56, '056', 'ANAGRAFICA DEI PROGETTI E CLASSIFICAZIONI', 'Coerenza fra dati', 'Se valorizzata, la DATA FINE EFFETTIVA deve essere maggiore o uguale a DATA INIZIO', 'Se valorizzata, la DATA FINE EFFETTIVA deve essere maggiore o uguale a DATA INIZIO', '', 'SELECT id AS export_ap00_id, cod_locale_progetto, estrazione_riferimento_id, ''N'' AS valid
    FROM export_ap00
    WHERE estrazione_riferimento_id = ${estrazione_id}
    AND cod_locale_progetto IN
        ( SELECT DISTINCT cod_locale_progetto
          FROM export_ap00
          WHERE estrazione_riferimento_id = ${estrazione_id}
                AND data_fine_effettiva IS NOT NULL
                AND data_fine_effettiva < data_inizio
        )', null, null, 'N');
INSERT INTO public.controlli_igrue (id, cod_controllo, dati_interessati, tipologia, dettaglio_controllo, dettaglio_errore, note, script_controllo, data_creazione, data_modifica, deleted) VALUES (29, '029', 'SEZIONE FINANZIARIA ', 'Coerenza fra dati ', 'Il controllo verifica se per il singolo progetto e per lo stesso Livello Gerarchico il valore totale degli Impegni Ammessi (Sommatoria importi nella struttura FN05-Impegni Ammessi) è maggiore del valore dei Costi Ammessi (importi nella struttura FN01-Costi Ammessi). Non può essere validato un progetto per cui, a parità di Livello Gerarchico, gli impegni ammessi totali del progetto sono maggiori dei costi ammessi. ', 'Sono presenti, per stesso livello gerarchico, Impegni Ammessi maggiori dei Costi Ammessi.', 'I valori di Importo degli Impegni Ammessi sono intesi al netto di eventuali Disimpegni. Con riferimento alle tipologie di Impegno, il controllo considera in modo distinto per la determinazione del valore degli Impegni Ammessi da sottoporre a confronto: gli importi Impegno Ammesso di tipologia I e D; gli importi Impegno Ammesso di tipologia I-TR e D-TR. ', 'SELECT id AS export_ap00_id, cod_locale_progetto, estrazione_riferimento_id, ''N'' AS valid
FROM export_ap00
WHERE estrazione_riferimento_id = ${estrazione_id}
AND cod_locale_progetto IN
    (
      SELECT DISTINCT ammessi.cod_locale_progetto
      FROM
        (
         SELECT ass.cod_locale_progetto,
                ass.cod_liv_gerarchico,
                SUM(importo::NUMERIC) AS importo
         FROM
          (
            SELECT
              A.cod_locale_progetto,
              A.cod_liv_gerarchico,
              A.tipo,
              impegno - COALESCE(disimpegno, 0) AS importo
            FROM
              (
                SELECT
                  cod_locale_progetto,
                  cod_liv_gerarchico,
                  CASE WHEN tipologia_imp_amm = ''I'' THEN 1  ELSE 2 END  tipo,
                  SUM(importo_imp_amm::NUMERIC) AS impegno
                FROM export_fn05
                WHERE estrazione_riferimento_id = ${estrazione_id}
                      AND tipologia_imp_amm IN (''I'')
                GROUP BY cod_locale_progetto, cod_liv_gerarchico,
                          CASE WHEN tipologia_imp_amm = ''I'' THEN 1  ELSE 2 END
              ) A LEFT JOIN
              (
                SELECT
                  cod_locale_progetto,
                  cod_liv_gerarchico,
                  CASE WHEN tipologia_imp_amm = ''D'' THEN 1  ELSE 2 END  tipo,
                  SUM(importo_imp_amm::NUMERIC) AS disimpegno
                FROM export_fn05
                WHERE estrazione_riferimento_id = ${estrazione_id}
                      AND tipologia_imp_amm IN (''D'')
                GROUP BY cod_locale_progetto, cod_liv_gerarchico,
                          CASE WHEN tipologia_imp_amm = ''D'' THEN 1  ELSE 2 END
              ) B ON A.cod_locale_progetto = B.cod_locale_progetto
                      AND A.tipo = B.tipo
                      AND A.cod_liv_gerarchico = B.cod_liv_gerarchico
          ) ass
          GROUP BY ass.cod_locale_progetto,
                ass.cod_liv_gerarchico
        ) ammessi INNER JOIN
        (
          SELECT cod_locale_progetto,
                  cod_liv_gerarchico,
                  SUM(importo_ammesso::NUMERIC) AS importo
          FROM export_fn01
          WHERE estrazione_riferimento_id = ${estrazione_id}
          GROUP BY cod_locale_progetto,
                  cod_liv_gerarchico
        ) costi ON ammessi.cod_locale_progetto = costi.cod_locale_progetto
                  AND ammessi.cod_liv_gerarchico = costi.cod_liv_gerarchico
      WHERE ammessi.importo > costi.importo
    )
UNION
SELECT id AS export_ap00_id, cod_locale_progetto, estrazione_riferimento_id, ''N'' AS valid
FROM export_ap00
WHERE estrazione_riferimento_id = ${estrazione_id}
AND cod_locale_progetto IN
    (
      SELECT DISTINCT ammessi.cod_locale_progetto
      FROM
        (
         SELECT ass.cod_locale_progetto,
                ass.cod_liv_gerarchico,
                SUM(importo::NUMERIC) AS importo
         FROM
          (
            SELECT
              A.cod_locale_progetto,
              A.cod_liv_gerarchico,
              A.tipo,
              impegno - COALESCE(disimpegno, 0) AS importo
            FROM
              (
                SELECT
                  cod_locale_progetto,
                  cod_liv_gerarchico,
                  CASE WHEN tipologia_imp_amm = ''I-TR'' THEN 1  ELSE 2 END  tipo,
                  SUM(importo_imp_amm::NUMERIC) AS impegno
                FROM export_fn05
                WHERE estrazione_riferimento_id = ${estrazione_id}
                      AND tipologia_imp_amm IN (''I-TR'')
                GROUP BY cod_locale_progetto, cod_liv_gerarchico,
                          CASE WHEN tipologia_imp_amm = ''I-TR'' THEN 1  ELSE 2 END
              ) A LEFT JOIN
              (
                SELECT
                  cod_locale_progetto,
                  cod_liv_gerarchico,
                  CASE WHEN tipologia_imp_amm = ''D-TR'' THEN 1  ELSE 2 END  tipo,
                  SUM(importo_imp_amm::NUMERIC) AS disimpegno
                FROM export_fn05
                WHERE estrazione_riferimento_id = ${estrazione_id}
                      AND tipologia_imp_amm IN (''D-TR'')
                GROUP BY cod_locale_progetto, cod_liv_gerarchico,
                          CASE WHEN tipologia_imp_amm = ''D-TR'' THEN 1  ELSE 2 END
              ) B ON A.cod_locale_progetto = B.cod_locale_progetto
                      AND A.tipo = B.tipo
                      AND A.cod_liv_gerarchico = B.cod_liv_gerarchico
          ) ass
          GROUP BY ass.cod_locale_progetto,
                ass.cod_liv_gerarchico
        ) ammessi INNER JOIN
        (
          SELECT cod_locale_progetto,
                  cod_liv_gerarchico,
                  SUM(importo_ammesso::NUMERIC) AS importo
          FROM export_fn01
          WHERE estrazione_riferimento_id = ${estrazione_id}
          GROUP BY cod_locale_progetto,
                  cod_liv_gerarchico
        ) costi ON ammessi.cod_locale_progetto = costi.cod_locale_progetto
                  AND ammessi.cod_liv_gerarchico = costi.cod_liv_gerarchico
      WHERE ammessi.importo > costi.importo
    )', '2018-03-26 00:00:00.000000', '2018-03-26 00:00:00.000000', 'N');
INSERT INTO public.controlli_igrue (id, cod_controllo, dati_interessati, tipologia, dettaglio_controllo, dettaglio_errore, note, script_controllo, data_creazione, data_modifica, deleted) VALUES (15, '015', 'ANAGRAFICA DEI PROGETTI E CLASSIFICAZIONI', 'Coerenza fra dati ', 'Il controllo verifica se per il  progetto con STATO = 1 (‘Attivo’) rispetto a un Programma del Fondo FSE (struttura AP04Programma) , sono assenti le pertinenti classificazioni in AP03-Classificazioni (Campo Intervento, Forme di Finanziamento, Tipo di Territorio, Meccanismi di Erogazione Territoriale, Attività Economica, Dimensione Tematica  Secondaria). Non può essere validato un progetto per cui non siano presenti tutte le classificazioni pertinenti allo specifico Fondo relativo al Programma a cui il progetto risulta associato con STATO = 1 (‘Attivo’) nella struttura AP04Programma.', 'Sono assenti per il progetto delle classificazioni obbligatorie ', '', 'SELECT DISTINCT a0.id AS export_ap00_id, a0.cod_locale_progetto, a0.estrazione_riferimento_id, ''N'' AS valid
FROM export_ap00 a0
  INNER JOIN export_fn00 f0 ON a0.estrazione_riferimento_id = f0.estrazione_riferimento_id
                            AND a0.cod_locale_progetto = f0.cod_locale_progetto
  INNER JOIN export_ap04 a4 ON a0.estrazione_riferimento_id = a4.estrazione_riferimento_id
                            AND a0.cod_locale_progetto = a4.cod_locale_progetto
WHERE f0.cod_fondo = ''ESF''
      AND a0.estrazione_riferimento_id = ${estrazione_id}
      AND a4.stato = ''1''
      AND a4.cod_locale_progetto NOT IN
          (
            SELECT DISTINCT cod_locale_progetto
            FROM export_ap03
            WHERE estrazione_riferimento_id = ${estrazione_id}
              AND tipo_class IN (''CI'',''FF'',''TT'',''MET'',''AE'',''DTS'' )
          );', '2018-03-26 00:00:00.000000', '2018-03-26 00:00:00.000000', 'N');
INSERT INTO public.controlli_igrue (id, cod_controllo, dati_interessati, tipologia, dettaglio_controllo, dettaglio_errore, note, script_controllo, data_creazione, data_modifica, deleted) VALUES (37, '037', 'SEZIONE FINANZIARIA ', 'Coerenza fra dati ', 'Il controllo verifica se il valore totale degli importi ricevuti dai Percettori per uno specifico Pagamento (Sommatoria importi per specifico Pagamento in struttura FN08Percettori) è maggiore dell''importo del Pagamento corrispondente (per stesso Pagamento in struttura FN06-Pagamenti). Non può essere validato un progetto per cui, per uno specifico Pagamento, il valore totale degli importi ricevuti dai Percettori è maggiore dell''importo del Pagamento stesso', 'Il totale degli importi ricevuti dai Percettori è maggiore dell''importo del relativo Pagamento.', 'I valori di Importo dei Pagamenti sono intesi al netto di eventuali Rettifiche. I controlli si applicano in funzione delle tipologie Pagamento come segue: importi Pagamenti delle tipologie P e R rispetto a importi Percettori per tipologie P e R; importi Pagamenti delle tipologie P-TR e R-TR rispetto a importi Percettori per tipologie P-TR e R-TR. ', 'SELECT id AS export_ap00_id, cod_locale_progetto, estrazione_riferimento_id, ''N'' AS valid
FROM export_ap00
WHERE estrazione_riferimento_id = ${estrazione_id}
AND cod_locale_progetto IN
    (
      SELECT DISTINCT pagamenti.cod_locale_progetto
      FROM
        (
          SELECT
            A.cod_locale_progetto,
            pagamento - COALESCE(rettifica, 0) AS importo
          FROM
            (
              SELECT
                cod_locale_progetto,
                SUM(importo_pag::NUMERIC) AS pagamento
              FROM export_fn06
              WHERE estrazione_riferimento_id = ${estrazione_id}
                    AND tipologia_pag IN (''P'')
              GROUP BY cod_locale_progetto
            ) A LEFT JOIN
            (
              SELECT
                cod_locale_progetto,
                SUM(importo_pag::NUMERIC) AS rettifica
              FROM export_fn06
              WHERE estrazione_riferimento_id = ${estrazione_id}
                    AND tipologia_pag IN (''R'')
              GROUP BY cod_locale_progetto
            ) B ON A.cod_locale_progetto = B.cod_locale_progetto
        ) pagamenti INNER JOIN
        (
         SELECT
            A.cod_locale_progetto,
            pagamento - COALESCE(rettifica, 0) AS importo
          FROM
            (
              SELECT
                cod_locale_progetto,
                SUM(importo::NUMERIC) AS pagamento
              FROM export_fn08
              WHERE estrazione_riferimento_id = ${estrazione_id}
                    AND tipologia_pag IN (''P'')
              GROUP BY cod_locale_progetto
            ) A LEFT JOIN
            (
              SELECT
                cod_locale_progetto,
                SUM(importo::NUMERIC) AS rettifica
              FROM export_fn08
              WHERE estrazione_riferimento_id = ${estrazione_id}
                    AND tipologia_pag IN (''R'')
              GROUP BY cod_locale_progetto
            ) B ON A.cod_locale_progetto = B.cod_locale_progetto
        ) percettori ON pagamenti.cod_locale_progetto = percettori.cod_locale_progetto
     WHERE  percettori.importo > pagamenti.importo
    )
UNION
SELECT id AS export_ap00_id, cod_locale_progetto, estrazione_riferimento_id, ''N'' AS valid
FROM export_ap00
WHERE estrazione_riferimento_id = ${estrazione_id}
AND cod_locale_progetto IN
    (
      SELECT DISTINCT pagamenti.cod_locale_progetto
      FROM
        (
          SELECT
            A.cod_locale_progetto,
            pagamento - COALESCE(rettifica, 0) AS importo
          FROM
            (
              SELECT
                cod_locale_progetto,
                SUM(importo_pag::NUMERIC) AS pagamento
              FROM export_fn06
              WHERE estrazione_riferimento_id = ${estrazione_id}
                    AND tipologia_pag IN (''P-TR'')
              GROUP BY cod_locale_progetto
            ) A LEFT JOIN
            (
              SELECT
                cod_locale_progetto,
                SUM(importo_pag::NUMERIC) AS rettifica
              FROM export_fn06
              WHERE estrazione_riferimento_id = ${estrazione_id}
                    AND tipologia_pag IN (''R-TR'')
              GROUP BY cod_locale_progetto
            ) B ON A.cod_locale_progetto = B.cod_locale_progetto
        ) pagamenti INNER JOIN
        (
         SELECT
            A.cod_locale_progetto,
            pagamento - COALESCE(rettifica, 0) AS importo
          FROM
            (
              SELECT
                cod_locale_progetto,
                SUM(importo::NUMERIC) AS pagamento
              FROM export_fn08
              WHERE estrazione_riferimento_id = ${estrazione_id}
                    AND tipologia_pag IN (''P-TR'')
              GROUP BY cod_locale_progetto
            ) A LEFT JOIN
            (
              SELECT
                cod_locale_progetto,
                SUM(importo::NUMERIC) AS rettifica
              FROM export_fn08
              WHERE estrazione_riferimento_id = ${estrazione_id}
                    AND tipologia_pag IN (''R-TR'')
              GROUP BY cod_locale_progetto
            ) B ON A.cod_locale_progetto = B.cod_locale_progetto
        ) percettori ON pagamenti.cod_locale_progetto = percettori.cod_locale_progetto
     WHERE  percettori.importo > pagamenti.importo
    )', '2018-03-26 00:00:00.000000', '2018-03-26 00:00:00.000000', 'N');
INSERT INTO public.controlli_igrue (id, cod_controllo, dati_interessati, tipologia, dettaglio_controllo, dettaglio_errore, note, script_controllo, data_creazione, data_modifica, deleted) VALUES (24, '024', 'SEZIONE FINANZIARIA ', 'Coerenza fra dati ', 'Il controllo verifica se per il singolo progetto il valore totale dei Costi ammessi (Sommatoria importi nella struttura FN01Costo Ammesso) è maggiore del valore totale dei Finanziamenti, al netto di finanziamenti privati o da reperire e al netto di eventuali economie (differenza fra Sommatoria importi in struttura FN00Finanziamento per COD_FONDO diverso da PRT(PRIVATI);RDR (DA REPERIRE) e  Sommatoria importi nella struttura FN10Economie). Non può essere validato un progetto per cui i Costi ammessi totali siano maggiori del Finanziamento pubblico totale (Sommatoria degli importi dei diversi fondi di un progetto, al netto di fondi privati, da reperire e al netto di economie). ', 'L''importo totale del Costo Ammesso è maggiore del Finanziamento al netto di fondi privati, da reperire e al netto di Economie.', '', 'SELECT id AS export_ap00_id, cod_locale_progetto, estrazione_riferimento_id, ''N'' AS valid
            FROM export_ap00
            WHERE estrazione_riferimento_id = ${estrazione_id}
            AND cod_locale_progetto IN
            (
			
            SELECT DISTINCT costo.cod_locale_progetto
            FROM
            (
            SELECT
            cod_locale_progetto,
            SUM(importo_ammesso::NUMERIC) AS importo
            FROM export_fn01
            WHERE estrazione_riferimento_id = ${estrazione_id}
            GROUP BY cod_locale_progetto
            ) costo LEFT JOIN
            (
            SELECT
            cod_locale_progetto,
            SUM(importo::NUMERIC) AS importo
            FROM export_fn00
            WHERE estrazione_riferimento_id = ${estrazione_id}
            AND cod_fondo NOT IN (''PRT'', ''RDR'')
            GROUP BY cod_locale_progetto
            ) finanziamento ON costo.cod_locale_progetto = finanziamento.cod_locale_progetto
            LEFT JOIN
            (
            SELECT
            cod_locale_progetto,
            SUM(importo::NUMERIC) AS importo
            FROM export_fn10
            WHERE estrazione_riferimento_id = ${estrazione_id}
            AND cod_fondo NOT IN (''PRT'', ''RDR'')
            GROUP BY cod_locale_progetto
            ) economia ON finanziamento.cod_locale_progetto = economia.cod_locale_progetto
            WHERE costo.importo > (finanziamento.importo - COALESCE(economia.importo, 0))
            )', '2018-03-26 00:00:00.000000', '2018-03-26 00:00:00.000000', 'N');
INSERT INTO public.controlli_igrue (id, cod_controllo, dati_interessati, tipologia, dettaglio_controllo, dettaglio_errore, note, script_controllo, data_creazione, data_modifica, deleted) VALUES (27, '027', 'SEZIONE FINANZIARIA ', 'Coerenza fra dati ', 'Il controllo verifica se per il singolo progetto il valore totale degli Impegni (Sommatoria importi nella struttura FN04-Impegni) è maggiore del valore totale del Finanziamento al netto di fondi privati, da reperire e al netto di Economie (differenza fra Sommatoria importi nella struttura FN00Finanziamento per COD_FONDO diverso da PRT(PRIVATI);RDR(DA REPERIRE) e Sommatoria importi nella struttura FN10Economie). Non può essere validato un progetto per cui gli Impegni totali del progetto sono maggiori del Finanziamento pubblico totale (somma degli importi dei diversi fondi di un progetto, al netto di fondi privati, da reperire e al netto di economie)', 'L''importo totale degli Impegni è maggiore dell''importo dei Finanziamenti pubblici al netto delle Economie.', 'I valori di Importo degli Impegni sono intesi al netto di eventuali disimpegni (tipologie I-D) ', 'SELECT id AS export_ap00_id, cod_locale_progetto, estrazione_riferimento_id, ''N'' AS valid
            FROM export_ap00
            WHERE estrazione_riferimento_id = ${estrazione_id}
            AND cod_locale_progetto IN
            (
            SELECT DISTINCT impegno.cod_locale_progetto
            FROM
            (
            SELECT cod_locale_progetto,
            SUM(
            CASE WHEN tipologia_impegno IN (''I'') THEN importo_impegno::NUMERIC
            WHEN tipologia_impegno IN (''D'') THEN -importo_impegno::NUMERIC END
            ) AS importo
            FROM export_fn04
            WHERE estrazione_riferimento_id = ${estrazione_id}
            GROUP BY cod_locale_progetto
            ) impegno LEFT JOIN
            (
            SELECT
            cod_locale_progetto,
            SUM(importo::NUMERIC) AS importo
            FROM export_fn00
            WHERE estrazione_riferimento_id = ${estrazione_id}
            AND cod_fondo NOT IN (''PRT'', ''RDR'')
            GROUP BY cod_locale_progetto
            ) finanziamento ON impegno.cod_locale_progetto = finanziamento.cod_locale_progetto
            LEFT JOIN
            (
            SELECT
            cod_locale_progetto,
            SUM(importo::NUMERIC) AS importo
            FROM export_fn10
            WHERE estrazione_riferimento_id = ${estrazione_id}
            AND cod_fondo NOT IN (''PRT'', ''RDR'')
            GROUP BY cod_locale_progetto
            ) economia ON finanziamento.cod_locale_progetto = economia.cod_locale_progetto
            WHERE impegno.importo > (finanziamento.importo - COALESCE(economia.importo, 0))
        )', '2018-03-26 00:00:00.000000', '2018-03-26 00:00:00.000000', 'N');
INSERT INTO public.controlli_igrue (id, cod_controllo, dati_interessati, tipologia, dettaglio_controllo, dettaglio_errore, note, script_controllo, data_creazione, data_modifica, deleted) VALUES (14, '014', 'ANAGRAFICA DEI PROGETTI E CLASSIFICAZIONI ', 'Coerenza fra dati ', 'Il controllo verifica se per un progetto che risulta con STATO = 1 (‘Attivo’) rispetto a un Programma del Fondo FESR (struttura AP04Programma), sono assenti le pertinenti classificazioni nella struttura AP03Classificazioni (Campo Intervento, Forme di Finanziamento, Tipo di Territorio, Meccanismi di Erogazione Territoriale, Attività Economica). Non può essere validato un progetto per cui non siano presenti tutte le classificazioni pertinenti allo specifico Fondo relativo al Programma a cui il progetto risulta associato con STATO = 1 (‘Attivo’) nella struttura AP04Programma. ', 'Sono assenti per il progetto delle classificazioni obbligatorie', '', 'SELECT DISTINCT a0.id AS export_ap00_id, a0.cod_locale_progetto, a0.estrazione_riferimento_id, ''N'' AS valid
            FROM export_ap00 a0
            INNER JOIN export_fn00 f0 ON a0.estrazione_riferimento_id = f0.estrazione_riferimento_id
            AND a0.cod_locale_progetto = f0.cod_locale_progetto
            INNER JOIN export_ap04 a4 ON a0.estrazione_riferimento_id = a4.estrazione_riferimento_id
            AND a0.cod_locale_progetto = a4.cod_locale_progetto WHERE f0.cod_fondo = ''ERDF''
            AND a0.estrazione_riferimento_id = ${estrazione_id}
            AND a4.stato = ''1''
            AND a4.cod_programma IN (''2014IT05SFOP020'', ''2014IT16RFOP007'')
            AND a4.cod_locale_progetto NOT IN
            (
            SELECT DISTINCT cod_locale_progetto
            FROM export_ap03
            WHERE estrazione_riferimento_id = ${estrazione_id}
            AND tipo_class IN (''CI'',''FF'',''TT'',''MET'',''AE'')
            )', '2018-03-26 00:00:00.000000', '2018-03-26 00:00:00.000000', 'N');

create table if not exists bdu_ap00
(
	id bigserial not null
		constraint bdu_ap00_pkey
			primary key,
	cod_locale_progetto varchar(60),
	codice_proc_att_orig varchar(30),
	cup varchar(15),
	data_fine_effettiva varchar(10),
	data_fine_prevista varchar(10),
	data_inizio varchar(10),
	flg_cancellazione char,
	sintesi_prg varchar(1300),
	tip_proc_att_orig varchar(2),
	tipo_aiuto varchar(2),
	tipo_operazione varchar(11),
	titolo_progetto varchar(500),
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char,
	id_sistema_igrue varchar(255),
	id_amministrazione_igrue varchar(255)
);

create index ix_bduap00_cod_loc_prog
	on bdu_ap00 (cod_locale_progetto);

create index ix_bduap00_id_amm_igrue
	on bdu_ap00 (id_amministrazione_igrue);

create index ix_bduap00_id_sis_igrue
	on bdu_ap00 (id_sistema_igrue);

create table if not exists bdu_ap01
(
	id bigserial not null
		constraint bdu_ap01_pkey
			primary key,
	cod_locale_progetto varchar(60),
	cod_proc_att varchar(30),
	flg_cancellazione char,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char,
	id_sistema_igrue varchar(255),
	id_amministrazione_igrue varchar(255)
);

create index ix_bduap01_cod_loc
	on bdu_ap01 (cod_locale_progetto);

create index ix_bduap01_cod_proc
	on bdu_ap01 (cod_proc_att);

create index ix_bduap01_id_amm_igrue
	on bdu_ap01 (id_amministrazione_igrue);

create index ix_bduap01_id_sis_igrue
	on bdu_ap01 (id_sistema_igrue);

create table if not exists bdu_ap02
(
	id bigserial not null
		constraint bdu_ap02_pkey
			primary key,
	cod_locale_progetto varchar(60),
	cod_prg_complesso varchar(30),
	cod_vulnerabili varchar(3),
	flg_cancellazione char,
	fondo_di_fondi char,
	generatore_entrate char,
	grande_progetto varchar(50),
	liv_istituzione_str_fin varchar(3),
	tipo_localizzazione varchar(5),
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char,
	id_sistema_igrue varchar(255),
	id_amministrazione_igrue varchar(255)
);

create index ix_bduap02_cod_loc
	on bdu_ap02 (cod_locale_progetto);

create index ix_bduap02_id_amm_igrue
	on bdu_ap02 (id_amministrazione_igrue);

create index ix_bduap02_id_sis_igrue
	on bdu_ap02 (id_sistema_igrue);

create table if not exists bdu_ap03
(
	id bigserial not null
		constraint bdu_ap03_pkey
			primary key,
	cod_classificazione varchar(200),
	cod_locale_progetto varchar(60),
	cod_programma varchar(50),
	flg_cancellazione char,
	tipo_class varchar(10),
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char,
	id_sistema_igrue varchar(255),
	id_amministrazione_igrue varchar(255)
);

create index ix_bduap03_cod_cls
	on bdu_ap03 (cod_classificazione);

create index ix_bduap03_cod_loc
	on bdu_ap03 (cod_locale_progetto);

create index ix_bduap03_cod_pr
	on bdu_ap03 (cod_programma);

create index ix_bduap03_id_amm_igrue
	on bdu_ap03 (id_amministrazione_igrue);

create index ix_bduap03_id_sis_igrue
	on bdu_ap03 (id_sistema_igrue);

create index ix_bduap03_tc
	on bdu_ap03 (tipo_class);

create table if not exists bdu_ap04
(
	id bigserial not null
		constraint bdu_ap04_pkey
			primary key,
	cod_locale_progetto varchar(60),
	cod_programma varchar(50),
	specifica_stato varchar(10),
	stato varchar(1),
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char,
	id_sistema_igrue varchar(255),
	id_amministrazione_igrue varchar(255)
);

create index ix_bduap04_cod_loc
	on bdu_ap04 (cod_locale_progetto);

create index ix_bduap04_cod_pr
	on bdu_ap04 (cod_programma);

create index ix_bduap04_id_amm_igrue
	on bdu_ap04 (id_amministrazione_igrue);

create index ix_bduap04_id_sis_igrue
	on bdu_ap04 (id_sistema_igrue);

create table if not exists bdu_ap05
(
	id bigserial not null
		constraint bdu_ap05_pkey
			primary key,
	cod_locale_progetto varchar(60),
	cod_stru_att varchar(10),
	flg_cancellazione char,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char,
	id_sistema_igrue varchar(255),
	id_amministrazione_igrue varchar(255)
);

create index ix_bduap05_cod_loc
	on bdu_ap05 (cod_locale_progetto);

create index ix_bduap05_cod_pr
	on bdu_ap05 (cod_stru_att);

create index ix_bduap05_id_amm_igrue
	on bdu_ap05 (id_amministrazione_igrue);

create index ix_bduap05_id_sis_igrue
	on bdu_ap05 (id_sistema_igrue);

create table if not exists bdu_ap06
(
	id bigserial not null
		constraint bdu_ap06_pkey
			primary key,
	cap varchar(5),
	cod_comune varchar(3),
	cod_locale_progetto varchar(60),
	cod_provincia varchar(3),
	cod_regione varchar(3),
	flg_cancellazione char,
	indirizzo varchar(1000),
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char,
	id_sistema_igrue varchar(255),
	id_amministrazione_igrue varchar(255)
);

create index ix_bduap06_cod_cap
	on bdu_ap06 (cap);

create index ix_bduap06_cod_cc
	on bdu_ap06 (cod_comune);

create index ix_bduap06_cod_cp
	on bdu_ap06 (cod_provincia);

create index ix_bduap06_cod_cr
	on bdu_ap06 (cod_regione);

create index ix_bduap06_cod_loc
	on bdu_ap06 (cod_locale_progetto);

create index ix_bduap06_id_amm_igrue
	on bdu_ap06 (id_amministrazione_igrue);

create index ix_bduap06_id_sis_igrue
	on bdu_ap06 (id_sistema_igrue);


create table if not exists bdu_fn00
(
	id bigserial not null
		constraint bdu_fn00_pkey
			primary key,
	cf_cofinanz varchar(16),
	cod_del_cipe varchar(6),
	cod_fondo varchar(10),
	cod_locale_progetto varchar(60),
	cod_localizzazione varchar(9),
	cod_norma varchar(5),
	flg_cancellazione char,
	importo varchar(20),
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char,
	id_sistema_igrue varchar(255),
	id_amministrazione_igrue varchar(255)
);

create index ix_bdufn00_cod_loc_prog
	on bdu_fn00 (cod_locale_progetto);

create index ix_bdufn00_id_amm_igrue
	on bdu_fn00 (id_amministrazione_igrue);

create index ix_bdufn00_id_sis_igrue
	on bdu_fn00 (id_sistema_igrue);

create table if not exists bdu_fn01
(
	id bigserial not null
		constraint bdu_fn01_pkey
			primary key,
	cod_liv_gerarchico varchar(100),
	cod_locale_progetto varchar(60),
	cod_programma varchar(50),
	flg_cancellazione char,
	importo_ammesso varchar(20),
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char,
	id_sistema_igrue varchar(255),
	id_amministrazione_igrue varchar(255)
);

create index ix_bdufn01_cod_loc_prog
	on bdu_fn01 (cod_locale_progetto);

create index ix_bdufn01_id_amm_igrue
	on bdu_fn01 (id_amministrazione_igrue);

create index ix_bdufn01_id_sis_igrue
	on bdu_fn01 (id_sistema_igrue);

create table if not exists bdu_fn02
(
	id bigserial not null
		constraint bdu_fn02_pkey
			primary key,
	cod_locale_progetto varchar(60),
	flg_cancellazione char,
	importo varchar(20),
	voce_spesa varchar(10),
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char,
	id_sistema_igrue varchar(255),
	id_amministrazione_igrue varchar(255)
);

create index ix_bdufn02_cod_loc_prog
	on bdu_fn02 (cod_locale_progetto);

create index ix_bdufn02_id_amm_igrue
	on bdu_fn02 (id_amministrazione_igrue);

create index ix_bdufn02_id_sis_igrue
	on bdu_fn02 (id_sistema_igrue);

create table if not exists bdu_fn03
(
	id bigserial not null
		constraint bdu_fn03_pkey
			primary key,
	anno_piano varchar(4),
	cod_locale_progetto varchar(60),
	flg_cancellazione char,
	imp_da_realizzare varchar(20),
	imp_realizzato varchar(20),
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char,
	id_sistema_igrue varchar(255),
	id_amministrazione_igrue varchar(255)
);

create index ix_bdufn03_cod_loc_prog
	on bdu_fn03 (cod_locale_progetto);

create index ix_bdufn03_id_amm_igrue
	on bdu_fn03 (id_amministrazione_igrue);

create index ix_bdufn03_id_sis_igrue
	on bdu_fn03 (id_sistema_igrue);

create table if not exists bdu_fn04
(
	id bigserial not null
		constraint bdu_fn04_pkey
			primary key,
	causale_disimpegno varchar(3),
	cod_impegno varchar(20),
	cod_locale_progetto varchar(60),
	data_impegno varchar(10),
	flg_cancellazione char,
	importo_impegno varchar(20),
	note_impegno varchar(1000),
	tipologia_impegno varchar(5),
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char,
	id_sistema_igrue varchar(255),
	id_amministrazione_igrue varchar(255)
);

create index ix_bdufn04_cod_loc_prog
	on bdu_fn04 (cod_locale_progetto);

create index ix_bdufn04_id_amm_igrue
	on bdu_fn04 (id_amministrazione_igrue);

create index ix_bdufn04_id_sis_igrue
	on bdu_fn04 (id_sistema_igrue);

create table if not exists bdu_fn05
(
	id bigserial not null
		constraint bdu_fn05_pkey
			primary key,
	causale_disimpegno_amm varchar(3),
	cod_impegno varchar(20),
	cod_liv_gerarchico varchar(100),
	cod_locale_progetto varchar(60),
	cod_programma varchar(50),
	data_imp_amm varchar(10),
	data_impegno varchar(10),
	flg_cancellazione char,
	importo_imp_amm varchar(20),
	note_imp varchar(1000),
	tipologia_imp_amm varchar(5),
	tipologia_impegno varchar(5),
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char,
	id_sistema_igrue varchar(255),
	id_amministrazione_igrue varchar(255)
);

create index ix_bdufn05_cod_loc_prog
	on bdu_fn05 (cod_locale_progetto);

create index ix_bdufn05_id_amm_igrue
	on bdu_fn05 (id_amministrazione_igrue);

create index ix_bdufn05_id_sis_igrue
	on bdu_fn05 (id_sistema_igrue);

create table if not exists bdu_fn06
(
	id bigserial not null
		constraint bdu_fn06_pkey
			primary key,
	causale_pagamento varchar(3),
	cod_locale_progetto varchar(60),
	cod_pagamento varchar(20),
	data_pagamento varchar(10),
	flg_cancellazione char,
	importo_pag varchar(20),
	note_pag varchar(1000),
	tipologia_pag varchar(5),
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char,
	id_sistema_igrue varchar(255),
	id_amministrazione_igrue varchar(255)
);

create index ix_bdufn06_cod_loc_prog
	on bdu_fn06 (cod_locale_progetto);

create index ix_bdufn06_id_amm_igrue
	on bdu_fn06 (id_amministrazione_igrue);

create index ix_bdufn06_id_sis_igrue
	on bdu_fn06 (id_sistema_igrue);

create table if not exists bdu_fn07
(
	id bigserial not null
		constraint bdu_fn07_pkey
			primary key,
	causale_pag_amm varchar(3),
	cod_liv_gerarchico varchar(100),
	cod_locale_progetto varchar(60),
	cod_pagamento varchar(20),
	cod_programma varchar(50),
	data_pag_amm varchar(10),
	data_pagamento varchar(10),
	flg_cancellazione char,
	importo_pag_amm varchar(20),
	note_pag varchar(1000),
	tipologia_pag varchar(5),
	tipologia_pag_amm varchar(5),
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char,
	id_sistema_igrue varchar(255),
	id_amministrazione_igrue varchar(255)
);

create index ix_bdufn07_cod_loc_prog
	on bdu_fn07 (cod_locale_progetto);

create index ix_bdufn07_id_amm_igrue
	on bdu_fn07 (id_amministrazione_igrue);

create index ix_bdufn07_id_sis_igrue
	on bdu_fn07 (id_sistema_igrue);

create table if not exists bdu_fn08
(
	id bigserial not null
		constraint bdu_fn08_pkey
			primary key,
	cod_locale_progetto varchar(60),
	cod_pagamento varchar(20),
	codice_fiscale varchar(16),
	data_pagamento varchar(10),
	flag_soggetto_pubblico char,
	flg_cancellazione char,
	importo varchar(20),
	tipo_percettore varchar(3),
	tipologia_pag varchar(5),
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char,
	id_sistema_igrue varchar(255),
	id_amministrazione_igrue varchar(255)
);

create index ix_bdufn08_cod_loc_prog
	on bdu_fn08 (cod_locale_progetto);

create index ix_bdufn08_id_amm_igrue
	on bdu_fn08 (id_amministrazione_igrue);

create index ix_bdufn08_id_sis_igrue
	on bdu_fn08 (id_sistema_igrue);

create table if not exists bdu_fn09
(
	id bigserial not null
		constraint bdu_fn09_pkey
			primary key,
	cod_liv_gerarchico varchar(100),
	cod_locale_progetto varchar(60),
	data_domanda varchar(10),
	flg_cancellazione char,
	id_domanda_pagamento varchar(100),
	importo_spesa_pub varchar(20),
	importo_spesa_tot varchar(20),
	tipologia_importo varchar(1),
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char,
	id_sistema_igrue varchar(255),
	id_amministrazione_igrue varchar(255)
);

create index ix_bdufn09_cod_loc_prog
	on bdu_fn09 (cod_locale_progetto);

create index ix_bdufn09_id_amm_igrue
	on bdu_fn09 (id_amministrazione_igrue);

create index ix_bdufn09_id_sis_igrue
	on bdu_fn09 (id_sistema_igrue);

create table if not exists bdu_fn10
(
	id bigserial not null
		constraint bdu_fn10_pkey
			primary key,
	cod_fondo varchar(10),
	cod_locale_progetto varchar(60),
	flg_cancellazione char,
	importo varchar(20),
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char,
	id_sistema_igrue varchar(255),
	id_amministrazione_igrue varchar(255)
);

create index ix_bdufn10_cod_loc_prog
	on bdu_fn10 (cod_locale_progetto);

create index ix_bdufn10_id_amm_igrue
	on bdu_fn10 (id_amministrazione_igrue);

create index ix_bdufn10_id_sis_igrue
	on bdu_fn10 (id_sistema_igrue);


create table if not exists bdu_fo00
(
	id bigserial not null
		constraint bdu_fo00_pkey
			primary key,
	cod_attestazione_finale varchar(3),
	cod_contenuto_formativo varchar(10),
	cod_corso varchar(60),
	cod_criteri_selezione varchar(3),
	cod_locale_progetto varchar(60),
	cod_modalita_formativa varchar(10),
	cod_qualifica varchar(15),
	data_avvio varchar(10),
	data_conclusione varchar(10),
	docenti_tutor varchar(5),
	durata_aula varchar(5),
	durata_laboratorio varchar(5),
	durata_we varchar(5),
	esame_finale char,
	flag_voucher char,
	flg_cancellazione char,
	indice_annualita varchar(2),
	numero_annualita varchar(2),
	stage_tirocini char,
	titolo_corso varchar(1000),
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char,
	id_sistema_igrue varchar(255),
	id_amministrazione_igrue varchar(255)
);

create index ix_bdufo00_cod_loc
	on bdu_fo00 (cod_locale_progetto);

create index ix_bdufo00_cod_pr
	on bdu_fo00 (cod_corso);

create index ix_bdufo00_id_amm_igrue
	on bdu_fo00 (id_amministrazione_igrue);

create index ix_bdufo00_id_sis_igrue
	on bdu_fo00 (id_sistema_igrue);

create table if not exists bdu_in00
(
	id bigserial not null
		constraint bdu_in00_pkey
			primary key,
	cod_indicatore varchar(80),
	cod_locale_progetto varchar(60),
	flg_cancellazione char,
	tipo_indicatore_di_risultato varchar(3),
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char,
	id_sistema_igrue varchar(255),
	id_amministrazione_igrue varchar(255)
);

create index ix_bduin00_cod_loc_prog
	on bdu_in00 (cod_locale_progetto);

create index ix_bduin00_id_amm_igrue
	on bdu_in00 (id_amministrazione_igrue);

create index ix_bduin00_id_sis_igrue
	on bdu_in00 (id_sistema_igrue);

create table if not exists bdu_in01
(
	id bigserial not null
		constraint bdu_in01_pkey
			primary key,
	cod_indicatore varchar(80),
	cod_locale_progetto varchar(60),
	flg_cancellazione char,
	tipo_indicatore_di_output varchar(3),
	val_programmato varchar(20),
	valore_realizzato varchar(20),
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char,
	id_sistema_igrue varchar(255),
	id_amministrazione_igrue varchar(255)
);

create index ix_bduin01_cod_loc_prog
	on bdu_in01 (cod_locale_progetto);

create index ix_bduin01_id_amm_igrue
	on bdu_in01 (id_amministrazione_igrue);

create index ix_bduin01_id_sis_igrue
	on bdu_in01 (id_sistema_igrue);

create table if not exists bdu_pa00
(
	id bigserial not null
		constraint bdu_pa00_pkey
			primary key,
	cod_aiuto_rna varchar(30),
	cod_proc_att varchar(30),
	cod_proc_att_locale varchar(30),
	cod_tipo_resp_proc varchar(2),
	data_avvio_procedura varchar(10),
	data_fine_procedura varchar(10),
	denom_resp_proc varchar(255),
	descr_procedura_att varchar(255),
	flag_aiuti char,
	flg_cancellazione char,
	tip_procedura_att varchar(2),
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char,
	id_sistema_igrue varchar(255),
	id_amministrazione_igrue varchar(255)
);

create index ix_bdupa00_cod_loc_prog
	on bdu_pa00 (cod_proc_att);

create index ix_bdupa00_id_amm_igrue
	on bdu_pa00 (id_amministrazione_igrue);

create index ix_bdupa00_id_sis_igrue
	on bdu_pa00 (id_sistema_igrue);

create table if not exists bdu_pa01
(
	id bigserial not null
		constraint bdu_pa01_pkey
			primary key,
	cod_proc_att varchar(30),
	cod_programma varchar(50),
	flg_cancellazione char,
	importo varchar(20),
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char,
	id_sistema_igrue varchar(255),
	id_amministrazione_igrue varchar(255)
);

create index ix_bdupa01_cod_proc
	on bdu_pa01 (cod_proc_att);

create index ix_bdupa01_id_amm_igrue
	on bdu_pa01 (id_amministrazione_igrue);

create index ix_bdupa01_id_sis_igrue
	on bdu_pa01 (id_sistema_igrue);

create table if not exists bdu_pg00
(
	id bigserial not null
		constraint bdu_pg00_pkey
			primary key,
	cig varchar(10),
	cod_locale_progetto varchar(60),
	cod_proc_agg varchar(30),
	data_aggiudicazione varchar(10),
	data_pubblicazione varchar(10),
	descr_procedura_agg varchar(1500),
	flg_cancellazione char,
	importo_aggiudicato varchar(20),
	importo_procedura_agg varchar(20),
	motivo_assenza_cig varchar(3),
	tipo_proc_agg varchar(10),
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char,
	id_sistema_igrue varchar(255),
	id_amministrazione_igrue varchar(255)
);

create index ix_bdupg00_cod_loc
	on bdu_pg00 (cod_locale_progetto);

create index ix_bdupg00_cod_pr
	on bdu_pg00 (cod_proc_agg);

create index ix_bdupg00_id_amm_igrue
	on bdu_pg00 (id_amministrazione_igrue);

create index ix_bdupg00_id_sis_igrue
	on bdu_pg00 (id_sistema_igrue);

create table if not exists bdu_pr00
(
	id bigserial not null
		constraint bdu_pr00_pkey
			primary key,
	cod_fase varchar(10),
	cod_locale_progetto varchar(60),
	data_fine_effettiva varchar(10),
	data_fine_prevista varchar(10),
	data_inizio_effettiva varchar(10),
	data_inizio_prevista varchar(10),
	flg_cancellazione char,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char,
	id_sistema_igrue varchar(255),
	id_amministrazione_igrue varchar(255)
);

create index ix_bdupr00_cod_loc_prog
	on bdu_pr00 (cod_locale_progetto);

create index ix_bdupr00_id_amm_igrue
	on bdu_pr00 (id_amministrazione_igrue);

create index ix_bdupr00_id_sis_igrue
	on bdu_pr00 (id_sistema_igrue);

create table if not exists bdu_pr01
(
	id bigserial not null
		constraint bdu_pr01_pkey
			primary key,
	cod_locale_progetto varchar(60),
	data_riferimento varchar(10),
	flg_cancellazione char,
	stato_progetto varchar(3),
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char,
	id_sistema_igrue varchar(255),
	id_amministrazione_igrue varchar(255)
);

create index ix_bdupr01_cod_loc_prog
	on bdu_pr01 (cod_locale_progetto);

create index ix_bdupr01_id_amm_igrue
	on bdu_pr01 (id_amministrazione_igrue);

create index ix_bdupr01_id_sis_igrue
	on bdu_pr01 (id_sistema_igrue);

create table if not exists bdu_sc00
(
	id bigserial not null
		constraint bdu_sc00_pkey
			primary key,
	cod_locale_progetto varchar(60),
	cod_ruolo_sog varchar(3),
	cod_uni_ipa varchar(10),
	codice_fiscale varchar(16),
	denominazione_sog varchar(255),
	flag_soggetto_pubblico char,
	flg_cancellazione char,
	forma_giuridica varchar(10),
	note varchar(1000),
	sett_att_economica varchar(120),
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char,
	id_sistema_igrue varchar(255),
	id_amministrazione_igrue varchar(255)
);

create index ix_bdusc00_cod_loc_prog
	on bdu_sc00 (cod_locale_progetto);

create index ix_bdusc00_id_amm_igrue
	on bdu_sc00 (id_amministrazione_igrue);

create index ix_bdusc00_id_sis_igrue
	on bdu_sc00 (id_sistema_igrue);

create table if not exists bdu_sc01
(
	id bigserial not null
		constraint bdu_sc01_pkey
			primary key,
	cittadinanza varchar(3),
	cod_istat_dom varchar(9),
	cod_istat_res varchar(9),
	cod_locale_progetto varchar(60),
	codice_corso varchar(60),
	codice_fiscale varchar(16),
	codice_vulnerabile_pa varchar(3),
	cond_mercato_ingresso varchar(3),
	data_nascita varchar(10),
	data_uscita varchar(10),
	durata_ricerca varchar(3),
	flg_cancellazione char,
	sesso varchar(1),
	stato_partecipante varchar(3),
	titolo_studio varchar(3),
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char,
	id_sistema_igrue varchar(255),
	id_amministrazione_igrue varchar(255)
);

create index ix_bdusc01_cod_corso
	on bdu_sc01 (codice_corso);

create index ix_bdusc01_cod_fis
	on bdu_sc01 (codice_fiscale);

create index ix_bdusc01_cod_loc_prog
	on bdu_sc01 (cod_locale_progetto);

create index ix_bdusc01_id_amm_igrue
	on bdu_sc01 (id_amministrazione_igrue);

create index ix_bdusc01_id_sis_igrue
	on bdu_sc01 (id_sistema_igrue);

create table if not exists bdu_tr00
(
	id bigserial not null
		constraint bdu_tr00_pkey
			primary key,
	causale_trasferimento varchar(3),
	cf_sog_ricevente varchar(16),
	cod_programma varchar(50),
	cod_trasferimento varchar(60),
	data_trasferimento varchar(10),
	flag_soggetto_pubblico char,
	flg_cancellazione char,
	importo_trasferimento varchar(20),
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char,
	id_sistema_igrue varchar(255),
	id_amministrazione_igrue varchar(255)
);

create table txt_ap00
(
	id bigserial not null
		constraint txt_ap00_pkey
			primary key,
	cod_locale_progetto varchar(60),
	codice_proc_att_orig varchar(30),
	cup varchar(15),
	data_fine_effettiva varchar(10),
	data_fine_prevista varchar(10),
	data_inizio varchar(10),
	flg_cancellazione char,
	sintesi_prg varchar(1300),
	tip_proc_att_orig varchar(2),
	tipo_aiuto varchar(2),
	tipo_operazione varchar(11),
	titolo_progetto varchar(500),
	estrazione_riferimento_id bigint,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char,
	scartato char default 'N'::bpchar
);

create index ix_txtap00_cod_loc_prog
	on txt_ap00 (cod_locale_progetto);

create index ix_txtap00_e_rif_id
	on txt_ap00 (estrazione_riferimento_id);

create index ix_txtap00_scartato
	on txt_ap00 (scartato);

create table txt_ap01
(
	id bigserial not null
		constraint txt_ap01_pkey
			primary key,
	cod_locale_progetto varchar(60),
	cod_proc_att varchar(30),
	flg_cancellazione char,
	estrazione_riferimento_id bigint,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char,
	scartato char default 'N'::bpchar
);

create index ix_txtap01_cod_loc
	on txt_ap01 (cod_locale_progetto);

create index ix_txtap01_cod_proc
	on txt_ap01 (cod_proc_att);

create index ix_txtap01_e_rif_id
	on txt_ap01 (estrazione_riferimento_id);

create index ix_txtap01_scartato
	on txt_ap01 (scartato);

create table txt_ap02
(
	id bigserial not null
		constraint txt_ap02_pkey
			primary key,
	cod_locale_progetto varchar(60),
	cod_prg_complesso varchar(30),
	cod_vulnerabili varchar(3),
	flg_cancellazione char,
	fondo_di_fondi char,
	generatore_entrate char,
	grande_progetto varchar(50),
	liv_istituzione_str_fin varchar(3),
	tipo_localizzazione varchar(5),
	estrazione_riferimento_id bigint,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char,
	scartato char default 'N'::bpchar
);

create index ix_txtap02_cod_loc
	on txt_ap02 (cod_locale_progetto);

create index ix_txtap02_e_rif_id
	on txt_ap02 (estrazione_riferimento_id);

create index ix_txtap02_scartato
	on txt_ap02 (scartato);

create table txt_ap03
(
	id bigserial not null
		constraint txt_ap03_pkey
			primary key,
	cod_classificazione varchar(200),
	cod_locale_progetto varchar(60),
	cod_programma varchar(50),
	flg_cancellazione char,
	tipo_class varchar(10),
	estrazione_riferimento_id bigint,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char,
	scartato char default 'N'::bpchar
);

create index ix_txtap03_cod_cls
	on txt_ap03 (cod_classificazione);

create index ix_txtap03_cod_loc
	on txt_ap03 (cod_locale_progetto);

create index ix_txtap03_cod_pr
	on txt_ap03 (cod_programma);

create index ix_txtap03_e_rif_id
	on txt_ap03 (estrazione_riferimento_id);

create index ix_txtap03_scartato
	on txt_ap03 (scartato);

create index ix_txtap03_tc
	on txt_ap03 (tipo_class);

create table txt_ap04
(
	id bigserial not null
		constraint txt_ap04_pkey
			primary key,
	cod_locale_progetto varchar(60),
	cod_programma varchar(50),
	specifica_stato varchar(10),
	stato varchar(1),
	estrazione_riferimento_id bigint,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char,
	scartato char default 'N'::bpchar
);

create index ix_txtap04_cod_loc
	on txt_ap04 (cod_locale_progetto);

create index ix_txtap04_cod_pr
	on txt_ap04 (cod_programma);

create index ix_txtap04_e_rif_id
	on txt_ap04 (estrazione_riferimento_id);

create index ix_txtap04_scartato
	on txt_ap04 (scartato);

create table txt_ap05
(
	id bigserial not null
		constraint txt_ap05_pkey
			primary key,
	cod_locale_progetto varchar(60),
	cod_stru_att varchar(10),
	flg_cancellazione char,
	estrazione_riferimento_id bigint,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char,
	scartato char default 'N'::bpchar
);

create index ix_txtap05_cod_loc
	on txt_ap05 (cod_locale_progetto);

create index ix_txtap05_cod_pr
	on txt_ap05 (cod_stru_att);

create index ix_txtap05_e_rif_id
	on txt_ap05 (estrazione_riferimento_id);

create index ix_txtap05_scartato
	on txt_ap05 (scartato);

create table txt_ap06
(
	id bigserial not null
		constraint txt_ap06_pkey
			primary key,
	cap varchar(5),
	cod_comune varchar(3),
	cod_locale_progetto varchar(60),
	cod_provincia varchar(3),
	cod_regione varchar(3),
	flg_cancellazione char,
	indirizzo varchar(1000),
	estrazione_riferimento_id bigint,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char,
	scartato char default 'N'::bpchar
);

create index ix_txtap06_cod_cap
	on txt_ap06 (cap);

create index ix_txtap06_cod_cc
	on txt_ap06 (cod_comune);

create index ix_txtap06_cod_cp
	on txt_ap06 (cod_provincia);

create index ix_txtap06_cod_cr
	on txt_ap06 (cod_regione);

create index ix_txtap06_cod_loc
	on txt_ap06 (cod_locale_progetto);

create index ix_txtap06_e_rif_id
	on txt_ap06 (estrazione_riferimento_id);

create index ix_txtap06_scartato
	on txt_ap06 (scartato);


create table txt_fn00
(
	id bigserial not null
		constraint txt_fn00_pkey
			primary key,
	cf_cofinanz varchar(16),
	cod_del_cipe varchar(6),
	cod_fondo varchar(10),
	cod_locale_progetto varchar(60),
	cod_localizzazione varchar(9),
	cod_norma varchar(5),
	flg_cancellazione char,
	importo varchar(20),
	estrazione_riferimento_id bigint,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char,
	scartato char default 'N'::bpchar
);

create index ix_txtfn00_cod_loc_prog
	on txt_fn00 (cod_locale_progetto);

create index ix_txtfn00_e_rif_id
	on txt_fn00 (estrazione_riferimento_id);

create index ix_txtfn00_scartato
	on txt_fn00 (scartato);

create table txt_fn01
(
	id bigserial not null
		constraint txt_fn01_pkey
			primary key,
	cod_liv_gerarchico varchar(100),
	cod_locale_progetto varchar(60),
	cod_programma varchar(50),
	flg_cancellazione char,
	importo_ammesso varchar(20),
	estrazione_riferimento_id bigint,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char,
	scartato char default 'N'::bpchar
);

create index ix_txtfn01_cod_loc_prog
	on txt_fn01 (cod_locale_progetto);

create index ix_txtfn01_e_rif_id
	on txt_fn01 (estrazione_riferimento_id);

create index ix_txtfn01_scartato
	on txt_fn01 (scartato);

create table txt_fn02
(
	id bigserial not null
		constraint txt_fn02_pkey
			primary key,
	cod_locale_progetto varchar(60),
	flg_cancellazione char,
	importo varchar(20),
	voce_spesa varchar(10),
	estrazione_riferimento_id bigint,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char,
	scartato char default 'N'::bpchar
);

create index ix_txtfn02_cod_loc_prog
	on txt_fn02 (cod_locale_progetto);

create index ix_txtfn02_scartato
	on txt_fn02 (scartato);

create index ix_txtfn02e_rif_id
	on txt_fn02 (estrazione_riferimento_id);

create table txt_fn03
(
	id bigserial not null
		constraint txt_fn03_pkey
			primary key,
	anno_piano varchar(4),
	cod_locale_progetto varchar(60),
	flg_cancellazione char,
	imp_da_realizzare varchar(20),
	imp_realizzato varchar(20),
	estrazione_riferimento_id bigint,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char,
	scartato char default 'N'::bpchar
);

create index ix_txtfn03_cod_loc_prog
	on txt_fn03 (cod_locale_progetto);

create index ix_txtfn03_scartato
	on txt_fn03 (scartato);

create index ix_txtfn03e_rif_id
	on txt_fn03 (estrazione_riferimento_id);

create table txt_fn04
(
	id bigserial not null
		constraint txt_fn04_pkey
			primary key,
	causale_disimpegno varchar(3),
	cod_impegno varchar(20),
	cod_locale_progetto varchar(60),
	data_impegno varchar(10),
	flg_cancellazione char,
	importo_impegno varchar(20),
	note_impegno varchar(1000),
	tipologia_impegno varchar(5),
	estrazione_riferimento_id bigint,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char,
	scartato char default 'N'::bpchar
);

create index ix_txtfn04_cod_loc_prog
	on txt_fn04 (cod_locale_progetto);

create index ix_txtfn04_scartato
	on txt_fn04 (scartato);

create index ix_txtfn04e_rif_id
	on txt_fn04 (estrazione_riferimento_id);

create table txt_fn05
(
	id bigserial not null
		constraint txt_fn05_pkey
			primary key,
	causale_disimpegno_amm varchar(3),
	cod_impegno varchar(20),
	cod_liv_gerarchico varchar(100),
	cod_locale_progetto varchar(60),
	cod_programma varchar(50),
	data_imp_amm varchar(10),
	data_impegno varchar(10),
	flg_cancellazione char,
	importo_imp_amm varchar(20),
	note_imp varchar(1000),
	tipologia_imp_amm varchar(5),
	tipologia_impegno varchar(5),
	estrazione_riferimento_id bigint,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char,
	scartato char default 'N'::bpchar
);

create index ix_txtfn05_cod_loc_prog
	on txt_fn05 (cod_locale_progetto);

create index ix_txtfn05_scartato
	on txt_fn05 (scartato);

create index ix_txtfn05e_rif_id
	on txt_fn05 (estrazione_riferimento_id);

create table txt_fn06
(
	id bigserial not null
		constraint txt_fn06_pkey
			primary key,
	causale_pagamento varchar(3),
	cod_locale_progetto varchar(60),
	cod_pagamento varchar(20),
	data_pagamento varchar(10),
	flg_cancellazione char,
	importo_pag varchar(20),
	note_pag varchar(1000),
	tipologia_pag varchar(5),
	estrazione_riferimento_id bigint,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char,
	scartato char default 'N'::bpchar
);

create index ix_txtfn06_cod_loc_prog
	on txt_fn06 (cod_locale_progetto);

create index ix_txtfn06_scartato
	on txt_fn06 (scartato);

create index ix_txtfn06e_rif_id
	on txt_fn06 (estrazione_riferimento_id);

create table txt_fn07
(
	id bigserial not null
		constraint txt_fn07_pkey
			primary key,
	causale_pag_amm varchar(3),
	cod_liv_gerarchico varchar(100),
	cod_locale_progetto varchar(60),
	cod_pagamento varchar(20),
	cod_programma varchar(50),
	data_pag_amm varchar(10),
	data_pagamento varchar(10),
	flg_cancellazione char,
	importo_pag_amm varchar(20),
	note_pag varchar(1000),
	tipologia_pag varchar(5),
	tipologia_pag_amm varchar(5),
	estrazione_riferimento_id bigint,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char,
	scartato char default 'N'::bpchar
);

create index ix_txtfn07_cod_loc_prog
	on txt_fn07 (cod_locale_progetto);

create index ix_txtfn07_scartato
	on txt_fn07 (scartato);

create index ix_txtfn07e_rif_id
	on txt_fn07 (estrazione_riferimento_id);

create table txt_fn08
(
	id bigserial not null
		constraint txt_fn08_pkey
			primary key,
	cod_locale_progetto varchar(60),
	cod_pagamento varchar(20),
	codice_fiscale varchar(16),
	data_pagamento varchar(10),
	flag_soggetto_pubblico char,
	flg_cancellazione char,
	importo varchar(20),
	tipo_percettore varchar(3),
	tipologia_pag varchar(5),
	estrazione_riferimento_id bigint,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char,
	scartato char default 'N'::bpchar
);

create index ix_txtfn08_cod_loc_prog
	on txt_fn08 (cod_locale_progetto);

create index ix_txtfn08_scartato
	on txt_fn08 (scartato);

create index ix_txtfn08e_rif_id
	on txt_fn08 (estrazione_riferimento_id);

create table txt_fn09
(
	id bigserial not null
		constraint txt_fn09_pkey
			primary key,
	cod_liv_gerarchico varchar(100),
	cod_locale_progetto varchar(60),
	data_domanda varchar(10),
	flg_cancellazione char,
	id_domanda_pagamento varchar(100),
	importo_spesa_pub varchar(20),
	importo_spesa_tot varchar(20),
	tipologia_importo varchar(1),
	estrazione_riferimento_id bigint,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char,
	scartato char default 'N'::bpchar
);

create index ix_txtfn09_cod_loc_prog
	on txt_fn09 (cod_locale_progetto);

create index ix_txtfn09_scartato
	on txt_fn09 (scartato);

create index ix_txtfn09e_rif_id
	on txt_fn09 (estrazione_riferimento_id);

create table txt_fn10
(
	id bigserial not null
		constraint txt_fn10_pkey
			primary key,
	cod_fondo varchar(10),
	cod_locale_progetto varchar(60),
	flg_cancellazione char,
	importo varchar(20),
	estrazione_riferimento_id bigint,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char,
	scartato char default 'N'::bpchar
);

create index ix_txtfn10_cod_loc_prog
	on txt_fn10 (cod_locale_progetto);

create index ix_txtfn10_scartato
	on txt_fn10 (scartato);

create index ix_txtfn10e_rif_id
	on txt_fn10 (estrazione_riferimento_id);

create table txt_fn11
(
	id bigserial not null
		constraint txt_fn11_pkey
			primary key,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char,
	cod_locale_progetto varchar(60),
	cod_pagamento varchar(60),
	tipologia_pag varchar(10),
	data_pagamento varchar(10),
	numero_giustificativo varchar(60),
	flg_cancellazione char,
	scartato char default 'N'::bpchar,
	estrazione_riferimento_id bigint

);

create table txt_fn12
(
	id bigserial not null
		constraint txt_fn12_pkey
			primary key,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char,
	cod_locale_progetto varchar(60),
	cod_recupero varchar(40),
	data_decisione_recupero varchar(10),
	codice_fiscale varchar(16),
	flag_soggetto_pubblico char,
	partita_iva varchar(20),
	denominazione varchar(3000),
	motivo_recupero varchar(3000),
	importo_da_recuperare varchar(20),
	data_ricevimento_rimborso varchar(10),
	importo_rimborsato varchar(20),
	importo_non_recuperabile varchar(20),
	stato_recupero varchar(3),
	flg_cancellazione char,
	scartato char default 'N'::bpchar,
	estrazione_riferimento_id bigint

);

create table txt_fo00
(
	id bigserial not null
		constraint txt_fo00_pkey
			primary key,
	cod_attestazione_finale varchar(3),
	cod_contenuto_formativo varchar(10),
	cod_corso varchar(60),
	cod_criteri_selezione varchar(3),
	cod_locale_progetto varchar(60),
	cod_modalita_formativa varchar(10),
	cod_qualifica varchar(15),
	data_avvio varchar(10),
	data_conclusione varchar(10),
	docenti_tutor varchar(5),
	durata_aula varchar(5),
	durata_laboratorio varchar(5),
	durata_we varchar(5),
	esame_finale char,
	flag_voucher char,
	flg_cancellazione char,
	indice_annualita varchar(2),
	numero_annualita varchar(2),
	stage_tirocini char,
	titolo_corso varchar(1000),
	estrazione_riferimento_id bigint,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char,
	scartato char default 'N'::bpchar
);

create index ix_txtfo00_cod_loc
	on txt_fo00 (cod_locale_progetto);

create index ix_txtfo00_cod_pr
	on txt_fo00 (cod_corso);

create index ix_txtfo00_e_rif_id
	on txt_fo00 (estrazione_riferimento_id);

create index ix_txtfo00_scartato
	on txt_fo00 (scartato);

create table txt_in00
(
	id bigserial not null
		constraint txt_in00_pkey
			primary key,
	cod_indicatore varchar(80),
	cod_locale_progetto varchar(60),
	flg_cancellazione char,
	tipo_indicatore_di_risultato varchar(3),
	estrazione_riferimento_id bigint,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char,
	scartato char default 'N'::bpchar
);

create index ix_txtin00_cod_loc_prog
	on txt_in00 (cod_locale_progetto);

create index ix_txtin00_scartato
	on txt_in00 (scartato);

create index ix_txtin00e_rif_id
	on txt_in00 (estrazione_riferimento_id);

create table txt_in01
(
	id bigserial not null
		constraint txt_in01_pkey
			primary key,
	cod_indicatore varchar(80),
	cod_locale_progetto varchar(60),
	flg_cancellazione char,
	tipo_indicatore_di_output varchar(3),
	val_programmato varchar(20),
	valore_realizzato varchar(20),
	estrazione_riferimento_id bigint,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char,
	scartato char default 'N'::bpchar
);

create index ix_txtin01_cod_loc_prog
	on txt_in01 (cod_locale_progetto);

create index ix_txtin01_scartato
	on txt_in01 (scartato);

create index ix_txtin01e_rif_id
	on txt_in01 (estrazione_riferimento_id);

create table txt_pa00
(
	id bigserial not null
		constraint txt_pa00_pkey
			primary key,
	cod_aiuto_rna varchar(30),
	cod_proc_att varchar(30),
	cod_proc_att_locale varchar(30),
	cod_tipo_resp_proc varchar(2),
	data_avvio_procedura varchar(10),
	data_fine_procedura varchar(10),
	denom_resp_proc varchar(255),
	descr_procedura_att varchar(255),
	flag_aiuti char,
	flg_cancellazione char,
	tip_procedura_att varchar(2),
	estrazione_riferimento_id bigint,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char,
	scartato char default 'N'::bpchar
);

create index ix_txtpa00_cod_loc_prog
	on txt_pa00 (cod_proc_att);

create index ix_txtpa00_e_rif_id
	on txt_pa00 (estrazione_riferimento_id);

create index ix_txtpa00_scartato
	on txt_pa00 (scartato);

create table txt_pa01
(
	id bigserial not null
		constraint txt_pa01_pkey
			primary key,
	cod_proc_att varchar(30),
	cod_programma varchar(50),
	flg_cancellazione char,
	importo varchar(20),
	estrazione_riferimento_id bigint,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char,
	scartato char default 'N'::bpchar
);

create index ix_txtpa01_cod_proc
	on txt_pa01 (cod_proc_att);

create index ix_txtpa01_e_rif_id
	on txt_pa01 (estrazione_riferimento_id);

create index ix_txtpa01_scartato
	on txt_pa01 (scartato);

create table txt_pg00
(
	id bigserial not null
		constraint txt_pg00_pkey
			primary key,
	cig varchar(10),
	cod_locale_progetto varchar(60),
	cod_proc_agg varchar(30),
	data_aggiudicazione varchar(10),
	data_pubblicazione varchar(10),
	descr_procedura_agg varchar(1500),
	flg_cancellazione char,
	importo_aggiudicato varchar(20),
	importo_procedura_agg varchar(20),
	motivo_assenza_cig varchar(3),
	tipo_proc_agg varchar(10),
	estrazione_riferimento_id bigint,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char,
	scartato char default 'N'::bpchar
);

create index ix_txtpg00_cod_loc
	on txt_pg00 (cod_locale_progetto);

create index ix_txtpg00_cod_pr
	on txt_pg00 (cod_proc_agg);

create index ix_txtpg00_e_rif_id
	on txt_pg00 (estrazione_riferimento_id);

create index ix_txtpg00_scartato
	on txt_pg00 (scartato);

create table txt_pr00
(
	id bigserial not null
		constraint txt_pr00_pkey
			primary key,
	cod_fase varchar(10),
	cod_locale_progetto varchar(60),
	data_fine_effettiva varchar(10),
	data_fine_prevista varchar(10),
	data_inizio_effettiva varchar(10),
	data_inizio_prevista varchar(10),
	flg_cancellazione char,
	estrazione_riferimento_id bigint,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char,
	scartato char default 'N'::bpchar
);

create index ix_txtpr00_cod_loc_prog
	on txt_pr00 (cod_locale_progetto);

create index ix_txtpr00_scartato
	on txt_pr00 (scartato);

create index ix_txtpr00e_rif_id
	on txt_pr00 (estrazione_riferimento_id);

create table txt_pr01
(
	id bigserial not null
		constraint txt_pr01_pkey
			primary key,
	cod_locale_progetto varchar(60),
	data_riferimento varchar(10),
	flg_cancellazione char,
	stato_progetto varchar(3),
	estrazione_riferimento_id bigint,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char,
	scartato char default 'N'::bpchar
);

create index ix_txtpr01_cod_loc_prog
	on txt_pr01 (cod_locale_progetto);

create index ix_txtpr01_scartato
	on txt_pr01 (scartato);

create index ix_txtpr01e_rif_id
	on txt_pr01 (estrazione_riferimento_id);

create table txt_sc00
(
	id bigserial not null
		constraint txt_sc00_pkey
			primary key,
	cod_locale_progetto varchar(60),
	cod_ruolo_sog varchar(3),
	cod_uni_ipa varchar(10),
	codice_fiscale varchar(16),
	denominazione_sog varchar(255),
	flag_soggetto_pubblico char,
	flg_cancellazione char,
	forma_giuridica varchar(10),
	note varchar(1000),
	sett_att_economica varchar(120),
	estrazione_riferimento_id bigint,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char,
	scartato char default 'N'::bpchar
);

create index ix_txtsc00_cod_loc_prog
	on txt_sc00 (cod_locale_progetto);

create index ix_txtsc00_e_rif_id
	on txt_sc00 (estrazione_riferimento_id);

create index ix_txtsc00_scartato
	on txt_sc00 (scartato);

create table txt_sc01
(
	id bigserial not null
		constraint txt_sc01_pkey
			primary key,
	cittadinanza varchar(3),
	cod_istat_dom varchar(9),
	cod_istat_res varchar(9),
	cod_locale_progetto varchar(60),
	codice_corso varchar(60),
	codice_fiscale varchar(16),
	codice_vulnerabile_pa varchar(3),
	cond_mercato_ingresso varchar(3),
	data_nascita varchar(10),
	data_uscita varchar(10),
	durata_ricerca varchar(3),
	flg_cancellazione char,
	sesso varchar(1),
	stato_partecipante varchar(3),
	titolo_studio varchar(3),
	estrazione_riferimento_id bigint,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char,
	scartato char default 'N'::bpchar
);

create index ix_txtsc01_cod_corso
	on txt_sc01 (codice_corso);

create index ix_txtsc01_cod_fis
	on txt_sc01 (codice_fiscale);

create index ix_txtsc01_cod_loc_prog
	on txt_sc01 (cod_locale_progetto);

create index ix_txtsc01_e_rif_id
	on txt_sc01 (estrazione_riferimento_id);

create index ix_txtsc01_scartato
	on txt_sc01 (scartato);

create table txt_tr00
(
	id bigserial not null
		constraint txt_tr00_pkey
			primary key,
	causale_trasferimento varchar(3),
	cf_sog_ricevente varchar(16),
	cod_programma varchar(50),
	cod_trasferimento varchar(60),
	data_trasferimento varchar(10),
	flag_soggetto_pubblico char,
	flg_cancellazione char,
	importo_trasferimento varchar(20),
	estrazione_riferimento_id bigint,
	data_creazione varchar(50),
	data_modifica varchar(50),
	deleted char,
	scartato char default 'N'::bpchar
);

CREATE SEQUENCE seq_monitoraggio START 1;