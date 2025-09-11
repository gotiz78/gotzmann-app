# gotzmann-app

Offizielle Gotzmann App – Portfolio, Workshops und Buchungsanfragen.

## Features

- **Home:** Willkommens-Screen mit Navigation zu den Hauptbereichen.
- **Workshops:** Platzhalter für zukünftige Workshop-Angebote.
- **Buchen:** Ein Formular zur einfachen Kontaktaufnahme für Buchungsanfragen. (Submit-Logik via Formspree ist als TODO vorgesehen).
- **Instagram:** Eine Vorschauseite mit direktem Link zum Instagram-Profil.
- **Rechtliches:** Enthält die AGB als statische Markdown-Seite mit WebView-Fallback und einen Link zu den Einstellungen.
- **Einstellungen:** Ermöglicht das Aktivieren/Deaktivieren von Benachrichtigungen (aktuell als Stub implementiert, speichert die Präferenz lokal).

## Web-Preview

Eine Web-Vorschau der App wird automatisch nach jedem Merge auf den `main`-Branch erstellt und auf GitHub Pages veröffentlicht.

- **URL:** [https://gotiz78.github.io/gotzmann-app/](https://gotiz78.github.io/gotzmann-app/)
- **Hinweis:** Nach einem Deploy kann ein Hard-Reload (Cmd/Ctrl+Shift+R) notwendig sein.

## Benachrichtigungen (Opt-in)

- Die App unterstützt ein lokales Opt-in/Opt-out für Benachrichtigungen. Die Präferenz wird auf dem Gerät gespeichert.
- Die technische Anbindung (FCM/APNs) ist noch nicht implementiert (`kEnableNotifications = false`).

## Formspree TODO

- Das Buchungsformular sendet die Daten noch nicht. Hierfür muss ein [Formspree](https://formspree.io/) Endpoint konfiguriert und in der App hinterlegt werden.
