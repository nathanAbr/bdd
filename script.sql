CREATE TABLE [dbo].[formateur](
	[id_formateur] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[nom_formateur] [varchar](20) NOT NULL,
	[prenom_formateur] [varchar](20) NOT NULL,
	[tel_formateur] [varchar](16) NULL,
	[mail_formateur] [varchar](50) NULL
);

CREATE TABLE [dbo].[formation](
	[id_formation] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[nom_formation] [varchar](100) NOT NULL,
	[nbHeures_formation] [float] NULL
);

CREATE TABLE [dbo].[matiere](
	[id_matiere] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[nom_matiere] [varchar](20) NOT NULL
);

CREATE TABLE [dbo].[promotion](
	[id_promotion] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[nom_promotion] [varchar](20) NULL,
	[dateDebut_promotion] [date] NOT NULL,
	[dateFin_promotion] [date] NOT NULL,
	[id_formation_promotion] [int] NOT NULL,
	CONSTRAINT id_formation_promotion_fk
		FOREIGN KEY (id_formation_promotion)
		REFERENCES formation (id_formation)
);

CREATE TABLE [dbo].[eleve](
	[id_eleve] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[nom_eleve] [varchar](20) NOT NULL,
	[prenom_eleve] [varchar](20) NOT NULL,
	[mail_eleve] [varchar](50),
	[id_promotion_eleve] [int] NOT NULL,
	CONSTRAINT id_promotion_eleve_fk
		FOREIGN KEY (id_promotion_eleve)
		REFERENCES promotion (id_promotion)
);

CREATE TABLE [dbo].[salle](
	[id_salle] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[capacite_salle] [int] NOT NULL,
	[nom_salle] [varchar](20) NOT NULL
);

CREATE TABLE [dbo].[sessionCours](
	[id_salle_sessionCours] [int] NOT NULL,
	[id_formateur_sessionCours] [int] NULL,
	[id_promotion_sessionCours] [int] NOT NULL,
	[id_eleve_sessionCours] [int] NOT NULL,
	[dateDebut_sessionCours] [smalldatetime] NOT NULL,
	[dateFin_sessionCours] [smalldatetime] NOT NULL,
	[id_sessionCours] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	CONSTRAINT id_salle_sessionCours_fk
		FOREIGN KEY (id_salle_sessionCours)
		REFERENCES salle (id_salle),
	CONSTRAINT id_formateur_sessionCours_fk
		FOREIGN KEY (id_formateur_sessionCours)
		REFERENCES formateur (id_formateur),
	CONSTRAINT id_promotion_sessionCours_fk
		FOREIGN KEY (id_promotion_sessionCours)
		REFERENCES promotion (id_promotion),
	CONSTRAINT id_eleve_sessionCours_fk
		FOREIGN KEY (id_eleve_sessionCours)
		REFERENCES eleve (id_eleve)
);

CREATE TABLE [dbo].[formateur_matiere](
	[id_formateur] [int] NOT NULL,
	[id_matiere] [int] NOT NULL,
	CONSTRAINT matiere_formateur_pk
		PRIMARY KEY (id_matiere, id_formateur),
	CONSTRAINT id_formateur_fk
		FOREIGN KEY (id_formateur)
		REFERENCES formateur (id_formateur),
	CONSTRAINT id_matiere_fk
		FOREIGN KEY (id_matiere)
		REFERENCES matiere (id_matiere)
);

CREATE TABLE [dbo].[absence](
	[id_eleve_absence] [int] NOT NULL,
	[id_session_absence] [int] NOT NULL,
	CONSTRAINT absence_pk
		PRIMARY KEY (id_eleve_absence, id_session_absence),
	CONSTRAINT id_eleve_absence_fk
		FOREIGN KEY (id_eleve_absence)
		REFERENCES eleve (id_eleve),
	CONSTRAINT id_session_absence_fk
		FOREIGN KEY (id_session_absence)
		REFERENCES sessionCours (id_sessionCours)
);
