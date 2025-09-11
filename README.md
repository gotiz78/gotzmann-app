# gotzmann-app
Offizielle Gotzmann App – Portfolio, Workshops und Buchungsanfragen. Flutter-App für iOS & Android mit Galerie, Workshop-Infos, Instagram-Feed, Buchungsformular inkl. AGB.

## Navigation & Designsystem
Die App verwendet GoRouter für die Navigation. Die Hauptnavigation ist eine `ShellRoute` mit einer `NavigationBar`, die die folgenden Tabs enthält:
- Home (`/`)
- Galerie (`/gallery`)
- Workshops (`/workshops`)
- Buchen (`/booking`)
- Instagram (`/instagram`)
- Kontakt/AGB (`/legal`)

Das Designsystem ist in `lib/theme` definiert und verwendet ein dunkles Farbschema mit einer Akzentfarbe.

## AGB: WebView + Fallback
Der AGB-Screen (`/legal/agb`) versucht primär, die AGBs von der Webseite (`kAgbUrl`) in einer `WebView` zu laden. Schlägt dies fehl (z.B. bei fehlender Internetverbindung), wird automatisch ein lokaler Fallback aus `assets/content/agb.md` angezeigt.

## Web-Preview
Eine Web-Vorschau der App wird automatisch nach jedem Merge auf den `main`-Branch erstellt und auf GitHub Pages veröffentlicht.

- **Einrichtung:** GitHub Pages muss unter `Settings → Pages` für den Branch `gh-pages` (aus dem `/root`-Verzeichnis) aktiviert werden.
- **Link:** Die Web-App ist unter **[https://gotiz78.github.io/gotzmann-app/](https://gotiz78.github.io/gotzmann-app/)** erreichbar.

## Benachrichtigungen (Opt-in)
- **Heute:** Die App unterstützt ein lokales Opt-in/Opt-out für Benachrichtigungen. Die Präferenz wird auf dem Gerät gespeichert.
- **Später aktivieren:** Um echte Push-Benachrichtigungen zu aktivieren, muss `lib/config/flags.dart` (`kEnableNotifications`) auf `true` gesetzt werden. Anschließend ist das vollständige Firebase/APNs-Setup erforderlich (z.B. `google-services.json`, `GoogleService-Info.plist`, `firebase-messaging-sw.js` für Web).
- **Hinweis:** Wir haben absichtlich noch keine Firebase-Pakete installiert, um den Build-Prozess und die CI schlank zu halten. Dies wird in einem zukünftigen PR nachgerüstet.
