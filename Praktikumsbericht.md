# Praktikumsbericht


## 1. Einleitung

  ### 1.2 Rahmenbedingungen

## 2. Anforderungen

  ### 2.1 funktionale Anforderungen
  - (1) Alle Pfleger sollen ihre Tagespläne sehen können.
  - (2) Die Tagespläne sollen automatisch generiert werden.
  - (3) Es sollen neue Kunden hinzugefügt werden können.
  - (4) Krankmeldungen sollen während des Tages berücksichtigt werden.
  - (5) Es sollen neue Angestellte hinzugefügt werden können.
  - (6) Es soll bei ambulanten Kunden die Fahrzeit berücksichtig werden.
  - (7) Bei stationären Kunden gibt es keine Fahrzeit.
  - (8) Es soll gewarnt werden, wenn es zuwenig Pfleger für alle Kunden gibt.
  - (9) Es soll gewarnt werden, wenn es Pfleger ohne Kunden gibt.
  - (10) Kunden sollen auch mehrmals am Tag besucht werden können.
  - (11) Die Oberflache soll einfach zu bedienen sein.
  - (12) 
  
  ### 2.2 nichtfunktionale Anforderungen
  
## 3. Use Case

Unterschied zu 5. Geschäftsprozesse?

## 4. Architektur

Die Software wird als Webapp entwickelt. Der Server wird mit Python und Flask entwickelt.

## 5. Geschäftsprozesse

  ### 1. Dienstbeginn Pflegepersonal:
   - Eigenen Namen im Menü auswählen (1F) und anfangen den Tagesplan abzuarbeiten (2F).
   - Nach jedem Kunden schauen, wer der nächste Kunde ist. 
   - Wenn ein Kunde abgemeldet wird verschwindet er im Tagesplan.
   - Wenn alle Kunden abgearbeitet sind, Feierabend.
  
  ### 2. Krankmeldung eines Kunden:
   - Kunde ruft an.
   - Verwaltungsangestellte tragen Krankmeldung ein.
   - Software berücksichtigt Krankmeldung.
    
  ### 3. Neuer Angestellter:
   - Verwaltungsangestellte/Chef tragen neuen Angestellten ein.
   - Wahl der Rolle (Pfleger ambulant, Pfleger stationär, Verwaltung).
   
  ### 4. Neuer Kunde:
   - Verwaltungsangestellte/Chef tragen neuen Kunden ein.
   - Wahl ob ambulant oder stationär.
   - Wahl an welchen Tagen bedarf besteht.
   - Wahl wie oft pro Tag bedarf besteht.
  
  ### 5. Dienstbeginn Verwaltung:
   - Eigenen Namen im Menü auswählen (1F).
   - Verwaltungsansicht (3F) wird angezeigt.

## 6. Datenmodell

Link zu Bild von ER-Modell.

## 7. GUI-Design

## 8. Klassendiagramm
