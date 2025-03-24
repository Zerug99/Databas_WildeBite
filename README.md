# WildBite AB

Detta projekt handlar om att designa och koda en passande databas för WildBite AB.
Databasen ska lagra information om djur, deras föda och deras livsmiljöer.


## Relationer
Under planeringen av databasen blev det tydligt att relationerna mellan entiteterna var många till många:

**Djurdata - Föda**

**Djurdata - livsmiljö**   

**Föda - Livsmiljö** 

**Djurlogg - Djurdata**

Det som gjordes var att skapa kopplingstabeller för att hantera dessa relationer. 
Exempel på varför jag gjorde så:
En älg kan äta både bär och bark, samt vistas i flera olika miljöer och istället för att duplicera information används bridge tabeller för att koppa ihop entiteter utan att skapa oreda i databasen. 
Det gäller att kunna se mellan raderna när man ska inserta datan i tabellerna för att man har flera PK som är på `AUTO_INCREMENT`. Vilket kräver koncetration och försiktighet. Djurloggen var det enda tabellen som hade 1 till 1 relation till kunderna. 
Varje logg är kopplat till ett djur och vice versa. 

Index lades på Djurdata, Föda och Livsmiljö. Det är våra 3 huvudtabeller.


## Trigger

En trigger kodades fram för att automatiskt logga varje nytt djur som läggs i tabellen `Djurdata`. `AFTER INSERT` trigger skriver ett meddelande i tabellen `Djurlogg`
Detta minskar risken för att missa viktig information och hjälper personalen att hålla koll vilka djur som redans finns registrerade. Därifrån kan man börja införa ny data.


## Stored Procedure 

För att förenkla datavisualisering skapades en lagrad procedur som visar hur många typer av föda varje djur äter. Genom att anropa `CALL djur_antalfoda` 
Man får man resultatet utan att behöva skriva hela SQL-frågan. Det är särskilt användbart för forskare eller andra användare som inte är vana vid SQL.

Detta var en mina favorit delar i projektet. 

Jag som är admin för databasen skulle kunna skapa flera procedurer i framtiden för att göra det användarvänligt för användarna att hämta data utan att riskera att något blir fel. 
Det är inte svårt att skriva ut procedurer och tydligt dokumentation.

**Constraint är under koding**
backup??

## Rättigheter och Säkerhet
Jag blev inspirerad av AD och införde ett rollbaserat säkerhetssystem `GRANT/REVOKE`

**Vanlig personal - Får `SELECT`**

**Forskare - Får `SELECT` + `INSERT`**

**Support - Får `DELETE`**

Admin (jag) - har `ALL PRIVILEGES`

Detta minskar risker för misstag och personal med rätta kunskaper får göra mer avancerade saker med databasen.
Man vill inte att flera ska kunna ta bort datan eller inserta datan. 

## Sammanfattning och förbättring 
Det var riktigt roligt att jobba med många till många relationer och behöva skriva rätt values i tabellerna för att det var mycket gymmpa för hjärnan. 

En sak som jag uppskattade lite mer var att ha ett färdigt ER-Diagram för att förstå hur allt hänger ihop och det gjorde lättare att skriva koden. 

Databasen kan bli bättre genom att lägga mer exakt data för säsongerna, istället för att skriva vinter eller sommar kan man lägga in månaderna istället. 

Man skulle också kunna skappa seperata tabeller till varje djurklass för nu är blandade klasser i vårt djurdata tabell. 














