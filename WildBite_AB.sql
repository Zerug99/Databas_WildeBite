	CREATE DATABASE Wildbite_AB;
	USE Wildbite_AB;
    
	-- skapar skallet och kopplingen i databasen
	CREATE TABLE Djurdata(
	Vetenskapligt_Namn VARCHAR (255) PRIMARY KEY,
	Namn VARCHAR (255) NOT NULL,
	KLass VARCHAR (255) NOT NULL
	);
    
    	CREATE TABLE Föda(
    	FödaID INT PRIMARY KEY AUTO_INCREMENT,
    	Typ VARCHAR (255) NOT NULL,
    	Säsong VARCHAR (255) NOT NULL
    	);
    
    	CREATE TABLE LivsMiljÖ(
    	MiljöID INT PRIMARY KEY AUTO_INCREMENT,
    	Typ VARCHAR (255) NOT NULL,
    	Beskrivning VARCHAR (255) NOT NULL
    	);
    
    
	CREATE TABLE Djur_Föda(
		
		
	Djur_FödaID INT PRIMARY KEY AUTO_INCREMENT,
	Vetenskapligt_Namn VARCHAR (255) NOT NULL,
	FödaID INT NOT NULL,
	FOREIGN KEY(Vetenskapligt_Namn) REFERENCES Djurdata(Vetenskapligt_Namn),
	FOREIGN KEY (FödaID) REFERENCES Föda(FödaID)
		);
	    
	CREATE TABLE Djur_LivsMiljö(
	Djur_LivsMiljö int PRIMARY KEY AUTO_INCREMENT,
	Vetenskapligt_Namn VARCHAR(255) NOT NULL,
	MiljöID INT NOT NULL,
	FOREIGN KEY (Vetenskapligt_Namn)REFERENCES Djurdata(Vetenskapligt_Namn),
	FOREIGN KEY (MiljöID) REFERENCES LivsMiljö(MiljöID)
	);
	    
	CREATE TABLE Föda_LivsMiljö(
	Föda_LivsMiljö INT PRIMARY KEY AUTO_INCREMENT,
	FödaID INT NOT NULL,
	MiljöID INT NOT NULL,
	FOREIGN KEY(FödaID)REFERENCES Föda(FödaID),
	FOREIGN KEY(MiljöID)REFERENCES LivsMiljö(MiljöID)
	);
	    
	CREATE TABLE DjurLogg (
	LoggID INT AUTO_INCREMENT PRIMARY KEY,
	Händelse VARCHAR (255),
	Tidpunkt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
	);
																
	DELIMITER $$
	CREATE TRIGGER Nydjur
	AFTER INSERT ON Djurdata
	FOR EACH ROW
	BEGIN 
	INSERT INTO Djurlogg(Händelse)
	VALUES (
	CONCAT("Ny Djur: ",New.Namn)
	);
	END $$
	
	DELIMITER ;
    
    
    
    	CREATE INDEX idx_DjurNamn ON Djurdata(Namn);
    	CREATE INDEX idx_föda ON Föda(Typ);
    	CREATE INDEX idx_Miljö ON LivsMiljö(Typ);

	
    DELIMITER $$

CREATE PROCEDURE djur_antalföda()
BEGIN
	SELECT 
		Djurdata.namn AS DJUR,
		COUNT(DISTINCT Föda.typ) AS antal 
	FROM 
		Djurdata
	JOIN 
		Djur_Föda ON Djurdata.Vetenskapligt_Namn = Djur_Föda.Vetenskapligt_Namn
	JOIN 
		Föda ON Djur_Föda.FödaID = Föda.FödaID
	GROUP BY 
		Djurdata.namn;
END $$

DELIMITER ;


ALTER TABLE Djurdata
ADD CONSTRAINT tre_klass
CHECK (Klass IN ('Däggdjur', 'Fisk', 'Fågel')
);

	


    
    
  INSERT INTO Djurdata(Vetenskapligt_namn, Namn, Klass) VALUES   -- Lägger in all data i tabellerna
	("Alces alces", "Älg", "Däggdjur"),
	("Canis lupus", "Varg", "Däggdjur"),
	("Esox lucius", "Gädda", "Fisk"),
	("Rutilus rutilus","Mört","Fisk"),
	("Parus major", "Talgoxe", "Fågel"),
	("Corvus corone", "Kråka", "Fågel");
    
    
	select * from djurdata;
    
	INSERT INTO Föda (Typ, Säsong) VALUES 
	("Bär", "Sommar"),
	("Kadaver","Året runt"),
	("Småfisk", "Året runt"),
	("Plankton", "Sommar"),
    	("Frön", "Året runt"),
    	("Insekter","Sommar"),
   	("Bark", "Vinter"),
    	("Hare","Året Runt");
    
    	INSERT INTO LivsMiljö(Typ, Beskrivning) VALUES 
    	("Skog","Blandat skog"),
    	("Sjö","Sötvattenssjö med vass"),
    	("Tätort", "Städer"),
    	("Åker", "Öppen Mark"),
    	("Myr", "Fuktig Område");
    
    
	INSERT INTO Djur_Föda (Vetenskapligt_namn, FödaID)VALUES
	("Alces alces",1),
	("Alces alces",7),
	("Canis lupus",2),
	("Canis lupus",8),
	("Esox lucius",3),
	("Rutilus rutilus",4),
	("Rutilus rutilus",6),
	("Parus major",6),
	("Parus major",5),
	("Corvus corone",6),
	("Corvus corone",5);
	
	
	INSERT INTO Djur_LivsMiljö(Vetenskapligt_Namn, MiljöID) VALUES
	("Alces alces", 1),
	("Alces alces", 4),
	
	("Canis lupus", 1),
	("Canis lupus", 4),
	
	("Esox lucius",2),
	
	("Rutilus rutilus",2),
	
	("Parus major", 1),
	("Parus major", 3),
	
	("Corvus corone", 1),
	("Corvus corone", 3),
	("Corvus corone", 4);
	
	
	INSERT INTO Föda_LivsMiljö (FödaID, MiljöID) VALUES
	(1, 1), -- bär i skog
	(1, 4), -- bär vid äng
	
	(2, 1), -- Kadaver i skog
	(2, 4), -- på Åker
	(2, 3), -- Tätort 
	
	(3, 2), -- Småfisk i sjön
	
	(4, 2), -- Plankton i sjön
	
	(5, 1),  -- Frön i skog
	(5, 4),  -- Frön på åker
	
	(6, 1),  -- Insekter i skog
	(6, 5),  -- Insekter i myr
	(6, 2), -- Insekter vid skog
	
	(7, 1),  -- Bark i skog
	
	(8, 1),  -- Hare i skog
	(8, 4);  -- Hare på åker
	
	SELECT 
	Djurdata.Namn AS Djur,
	Föda.Typ AS Föda
	FROM 
	Djurdata
	JOIN 
	Djur_Föda ON Djurdata.Vetenskapligt_Namn = Djur_Föda.Vetenskapligt_Namn
	
	JOIN 
	Föda ON Djur_Föda.FödaID = Föda.FödaID;
	  
	SELECT Djurdata.namn AS Djur,
	LivsMiljö.typ AS Miljö
	From 
	Djurdata
	Join Djur_Livsmiljö on Djurdata.vetenskapligt_Namn = Djur_Livsmiljö.Vetenskapligt_Namn
	Join Livsmiljö on Djur_Livsmiljö.MiljöID = Livsmiljö.MiljöID;
	  
	SELECT Djurdata.namn as DJUR,
	COUNT(DISTINCT Föda.typ) as antal 
	From 
	Djurdata
	Join Djur_Föda ON Djurdata.Vetenskapligt_Namn = Djur_Föda.Vetenskapligt_Namn
	JOIN 
	Föda ON Djur_Föda.FödaID = Föda.FödaID
	GROUP BY Djurdata.namn;
	  


	SELECT user, host FROM mysql.user;
      
	SHOW INDEX FROM djurdata;
      
      
	SELECT USER(), CURRENT_USER();
      

	  
	CALL djur_antalföda();

	    
	    
