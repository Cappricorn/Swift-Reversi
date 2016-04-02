# Reversi
Dies ist eine Umsetzung des Spiels Reversi in Swift für iOS.

## Programmentwicklung
Das Programm wurde mit Swift in Xcode auf Mac OS 10.11 Rechnern programmiert.
Programmspezifische Xcode-Dateien sind im Ordner enthalten.

## Kompatibilität
Die höchstmögliche Kompatibilität wird durch iOS 9 und ein Mac OS X Betriebssystem erreicht. Es wurde versucht, das Programm auch für iOS 7+ kompatibel zu machen.
Etwaige Komplikationen mit diesen Spezifikationen können unter Issues gemeldet werden.

## Spielregeln
Auf einem 8x8 Feld liegen in der Mitte je zwei schwarze und weiße Steine. Die Spieler legen nun abwechselend je einen ihrer Steine ihrer Farbe auf das Spielbrett.
Hierbei werden alle gegnerischen Steine, die in einer Reihe (waagerecht, senkrecht, diagonal) zwischen dem gerade gesetzten und einem weiteren eigenen Stein eingeschlossen sind umgedreht und in die eigene Farbe verwandelt.
Wer zu Spielende (keiner kann mehr setzen oder das Feld ist voll) die meisten Steine seiner Farbe auf dem Feld hat, gewinnt die Partie.


## Zukunft
Das Spiel arbeitet aktuell nur über die Konsole. Eine Spielbare Oberfläche ist die oberste Maxime der nächsten Entwicklung.
Ferner hinzuzufügen sind eine Anbindung ans GameCenter und ein KI-Gegner.
