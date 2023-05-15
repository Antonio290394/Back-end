CREATE TABLE clienti(
	NumeroCliente SERIAL PRIMARY KEY,
	nome varchar NOT NULL,
	Cognome varchar NOT NULL,
	DataNascita int NOT NULL,
	regioneResidenza varchar NOT NULL
);

INSERT INTO clienti(nome,Cognome,DataNascita,regioneResidenza) VALUES('Mario','Rossi',1990,'Calabria');
INSERT INTO clienti(nome,Cognome,DataNascita,regioneResidenza) VALUES('Antonio','Caputo',1880,'Calabria');

SELECT * FROM clienti;

DROP TABLE fatture;

CREATE TABLE fatture(
	NumeroFattura SERIAL PRIMARY KEY,
	tipologia varchar NOT NULL,
	importo float NOT NULL,
	iva int NOT NULL,
	idCliente int NOT NULL,
	dataDiFattura int NOT NULL,
	numeroFornitore int NOT NULL UNIQUE,
	CONSTRAINT fk_Cliente FOREIGN KEY(idCliente) REFERENCES clienti(NumeroCliente)
);

INSERT INTO fatture (tipologia,importo,iva,idCliente,dataDiFattura,numeroFornitore) VALUES('verdura', 20.4,20,1,1902,3);
INSERT INTO fatture (tipologia,importo,iva,idCliente,dataDiFattura,numeroFornitore) VALUES('verdura', 20.4,20,1,1902,3);

CREATE TABLE prodotti(
	idProdotto SERIAL PRIMARY KEY,
	descrizione varchar NOT NULL,
	inProduzione boolean NOT NULL,
	inCommercio boolean NOT NULL,
	dataAttivazione int NOT NULL,
	dataDisattivazione int NOT NULL
);

CREATE TABLE fornitori(
	numeroFornitore SERIAL PRIMARY KEY,
	denominazione varchar NOT NULL,
	regioneResidenza varchar NOT NULL,
	CONSTRAINT fk_fornitore FOREIGN KEY(numeroFornitore) REFERENCES fatture(numeroFornitore)
);

