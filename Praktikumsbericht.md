# Praktikumsbericht


## 1. Einleitung

  ### 1.2 Rahmenbedingungen

## 2. Anforderungen

  ### 2.1 funktionale Anforderungen
  - (1) Alle Betreuer sollten ihre Tagespläne einsehen können:
        
        Die Pläne sollten Details wie den Namen des Klienten, den Ort, die Zeit und die Dauer des Besuchs enthalten.
  - (2) Die Tagespläne müssen automatisch erstellt werden:
        
        Die Software sollte die Verfügbarkeit der Betreuer, den Standort der Klienten und die für jeden Besuch benötigte Zeit berücksichtigen, um die Tagespläne automatisch zu erstellen.
  - (3) Es sollte möglich sein, neue Kunden hinzuzufügen:
        
        Die Software sollte es ermöglichen, neue Kundenprofile anzulegen, die Informationen enthalten wie: ob sie ambulant oder stationär sind, an welchen Tagen und wie oft am Tag sie unsere Pflegedienste benötigen.
  - (4) Krankenbesuche müssen während des Tages berücksichtigt werden:
        
        Die Software sollte in der Lage sein, die Zeitpläne in Echtzeit anzupassen, wenn sich ein Betreuer krank meldet, um sicherzustellen, dass alle Kunden weiterhin betreut werden.
  - (5) Es muss möglich sein, neue Mitarbeiter hinzuzufügen:
        
        Die Software sollte es ermöglichen, neue Mitarbeiterprofile anzulegen, die persönliche Angaben, Verfügbarkeit und Rolle enthalten.
  - (6) Bei ambulanten Kunden sollte die Reisezeit berücksichtigt werden:
        
        Die Software sollte bei der Planung von Besuchen für ambulante Kunden die Reisezeit berücksichtigen, um sicherzustellen, dass die Pflegekräfte genügend Zeit haben, um von einem Kundenort zum anderen zu gelangen.
  - (7) Für stationäre Klienten darf keine Reisezeit anfallen:
        
        Da sich die stationären Klienten in derselben Einrichtung befinden, sollte keine Reisezeit in die Terminplanung einbezogen werden.
  - (8) Warnung, wenn es zu wenige Betreuer für alle Klienten gibt:
        
        Die Software sollte Warnungen ausgeben, wenn zu einem bestimmten Zeitpunkt nicht genügend Pflegekräfte für alle Klienten zur Verfügung stehen, damit gegebenenfalls zusätzliches Personal zugewiesen werden kann.
  - (9) Es sollte eine Warnung ausgegeben werden, wenn es Betreuer ohne Klienten gibt:
        
        Die Software sollte eine Warnung ausgeben, wenn es Pflegekräfte gibt, die zu einem bestimmten Zeitpunkt keine Kunden zu betreuen haben, so dass gegebenenfalls zusätzliche Kunden zugewiesen werden können.
  - (10) Die Kunden sollten mehrmals am Tag besucht werden können:
        
        Die Software sollte mehrere Besuche pro Tag für Kunden ermöglichen, die mehr als einen Besuch durch eine Betreuungsperson benötigen. Das Planungssystem sollte flexibel genug sein, um mehrere Besuche durch verschiedene Betreuer zu ermöglichen, wobei für jeden Besuch genügend Zeit zur Verfügung steht, um den Bedürfnissen des Kunden gerecht zu werden.
  - (11) Die Benutzerschnittstelle sollte einfach zu bedienen sein:
        
        Die Benutzeroberfläche der Software sollte benutzerfreundlich gestaltet sein, eine klare und intuitive Navigation aufweisen und nur minimalen Schulungsaufwand für neue Benutzer erfordern.
  
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

![Dropdown Mainmenu](./UI-1F.png 'Startpage')

![Tagesplan](./UI-2F.png 'Tagesplan')

![Verwaltungsansicht](./UI-3F.png 'Verwaltungsansicht')

## 8. Klassendiagramm
