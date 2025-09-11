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
