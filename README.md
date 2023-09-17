# 🔥 **FiveM UCP v1.0**

## DOWNLOAD FISIERE PRINCIPALE:

* Laravel: https://drive.google.com/file/d/1nrtjcQfGLmt6BSh2rwdDIpzIXRCO_LsA/view?usp=sharing
* Panel: https://drive.google.com/file/d/1t2Lexs8-TGntRNkn-wivs6FhqE0XwC1c/view?usp=sharing

---

## 🤔 **INFORMAȚII ADIȚIONALE**

- Semnificația folderelor găsite pe link-urile de mai jos:

`check` -> cu acest fisier o sa verifici conexiunea de la baza de date catre webhost !

`laravel` ->  aici veți găsi toată structura PHP a panoului (framework-ul Laravel), respectiv locul de unde se va realiza noua configurație pentru noua/actuala bază de date !

`panel.yourdomain.ro` ->  aici veți găsi toate fișierele ce țin de front-end și pot fi accesate de către vizitatori (imagini, fisierele .css și .js)

`db-example.sql` ->  reprezintă exemplul de bază de date pe care panoul este configurat și funcțional pentru a vă ajuta la întelegerea mai bine a noii configurări cu baza de date a dvs.

`new-tables.sql` ->  conține doar tabelele ce sunt necesare rulării panoului !

`vrp_factions.sql` ->  conține un singur tabel, vrp_factions ce va trebui să îl populați cu denumirea facțiunilor ce există pe serverul dvs. (denumirea lor trebuie să reflecte numele facțiunilor ce le folosiți în vrp_users.faction)

`panelcode.txt` ->  reprezintă comanda ce trebuie integrata in server chat pentru a genera codul necesar înregistrării contului.

- Tutorial Video:
![YouTube](https://www.youtube.com/watch?v=I0iW8_Ncogw)

---

## 🤔 **INFORMAȚII DE SECURITATE**

In caz ca nu ai cunostinte in domeniul web, circula niste systeme de attack ce pot sa doboare acest panel in mai putin de 30 secunde si sa primeasca acces la toate informatiile din el, cum ar fi conturi sau chiar baza de date a hostului tau !
Tin sa anunt ca nu sunt raspunzator daca se intampla asa ceva !
Pentru protectii web discutati cu cineva specialist sau cu un furnizor a unei retele de securitate web !

Fata de v2 acest panel nu are securitate, panelul v2 are securitate pentru atacuri implicita pe langa protectia firmei de host care va furnizeaza webhostul !

---

## [PASUL 1]⚠️ **INSTALARE BAZA DE DATE**

1. Adăugați prin **copy-paste** in categoria **SQL din phpMyAdmin**, tot conținutul din fisierul: `new-tables.sql` si dupa accea apasati pe butonul **GO** din josul paginii !
![SQL1](https://imgur.com/FnkG630.png)

2. Adăugați prin **copy-paste** in categoria **SQL din phpMyAdmin**, tot conținutul din fisierul: `vrp_factions.sql` si dupa accea apasati pe butonul **GO** din josul paginii !
![SQL2](https://imgur.com/nA9yE5O.png)

3. In phpMyAdmin apasati pe bara din susul paginii pe **SQL** si introduceti acestea, dupa care apasati pe butonul **GO** din josul paginii !
```bash
ALTER TABLE vrp_users
ADD panel_code varchar(64) NOT NULL DEFAULT 'none',
ADD Status int(11) NOT NULL DEFAULT 0,
ADD Nickname varchar(128) DEFAULT NULL,
ADD Password varchar(128) DEFAULT NULL,
ADD Email varchar(198) DEFAULT NULL,
ADD updated_at timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
ADD remember_token varchar(64) DEFAULT NULL
```
![SQL3](https://imgur.com/ztlHiK7.png)

4. În tabelul numit `vrp_factions` va trebui să adăugați manual toate facțiunile active a serverului.
`Mare grija la ce id puneti cand creati una noua, va uitati inainte de toate care e ultimul id din vrp_factions si dupa creati una noua!!!!!`
![SQL4](https://imgur.com/0J1txsk.png)

---

## [PASUL 2]⚠️ **INSTALARE FISIERE**

- Urcarea corecta a fisierelor pe webhost:
1. Folderul **laravel** va trebui încărcat în afara folderului **public_html**, unde de altfel nu poate fi accesat din browser - **FOARTE IMPORTANT DACA VRETI SA VA FUNCTIONEZE CORECT PANEL-UL** !

2. Creați un nou **subdomeniu** având oricare nume și presupunând că folderul de destinație se găsește în afara folderului **public_html** !

3. Încărcați tot conținutul din folderul **panel.yourdomain.ro** în noul subdomeniu creat.

- ⚠️ INFO:
Dacă **subdomeniul** a fost creat în interiorul folderului **public_html**, atunci va trebui sa modificați fisierul index.php in urmatorul fel:
```bash
linia 24: require __DIR__.'/../../laravel/vendor/autoload.php';
```

```bash
linia 38: $app = require_once __DIR__.'/../../laravel/bootstrap/app.php';
```

4. Accesați noul încărcat folder **laravel** apoi fisierul `.env` (dacă utilizați cPanel este posibil ca fișierele **dotfiles** să fie ascunse, **Settings -> bifați Show Hidden Files**)

---

## [PASUL 3]⚠️ **CONFIGURAREA FUNCTIEI DE BAZA .ENV**

- Pentru realizarea conexiunii cu baza de date, va trebui să modificați constantele **DB_*** cu cele către baza de date a serverului !

- Pentru a seta serverul **SMTP**, reponsabil pentru trimiterea email-urilor, va trebui să modificați constantele **MAIL_*** (Puteti folosi un cont email realizat în cPanel sau alte platforme cum ar fi sendinblue sau sendgrid)

- Modificați valoarea **APP_NAME** cu numele scurt al comunității, dar fără a introduce spații, simboluri sau emoji-uri!

- Modificați valoarea **APP_URL** cu noul link pe care rulează panoul -> va fi link-ul **subdomeniului** adăugând slash(/) la final precum acest exemplu: `https://panel.korrupt.ro`!

**IMPORTANT!** Abia după ce ati realizat și testat panoul pentru a fi complet funcțional, va trebui sa modificati **APP_DEBUG** in `false`. În caz contrar, veți suporta consecințele în cazul în care veți avea probleme de securitate.

---

## ALTE INFORMATII DE BAZA:
* Structura de bază de funcționare se află in `laravel/app`. Locul unde pot fi găsite Controllers, Middleware, Models.
* Rutele utilizate de panou le veți găsi în `laravel/routes/web.php`.
* Partea front-end a panoului se va găsi în `laravel/resources/views`.
* Pentru a modifica gradele afișate staff-lui pe panou, va trebui să navigați spre `laravel/app/User.php`, funcția `getAccountTagsAttribute`.
* Pe lângă implementarea comenzii `/panelcode` în game chat, va trebui să realizați și un `query` ce va afișa starea jucătorului în joc(conectat, deconectat) prin actualizarea coloanei **Status din vrp_users cu valorile 1 = conectat și 0 = deconectat**.

---

## QUERY STATUS CONECTAT:

- Callback conectare jucator:
* Se adauga in: **vrp > base.lua* in zona de **AddEventHandler("playerConnecting"**
```bash
exports.ghmattimysql:execute("UPDATE vrp_users SET Status = @status WHERE id = @user_id", {user_id = user_id, status = 1}, function()end)
```

## QUERY STATUS DECONECTAT:

- Callback deconectare jucator:
* Se adauga in: **vrp > base.lua** in zona de **AddEventHandler("playerDropped",function(reason)**
```bash
exports.ghmattimysql:execute("UPDATE vrp_users SET Status = @status WHERE id = @user_id", {user_id = user_id, status = 0}, function()end)
```

---

Daca intampini probleme posteaza o sesizare de asistenta aici: https://github.com/KingForLife/UCP_FiveM_v1/issues

<p align="center">
  <a href="https://github.com/KingForLife/UCP_FiveM_v1/issues">
    <img src="https://img.shields.io/github/issues/KingForLife/UCP_FiveM_v1?color=0088ff&style=for-the-badge&logo=github"/>
  </a>
  <a href="https://github.com/KingForLife/UCP_FiveM_v1/pulls">
    <img src="https://img.shields.io/github/issues-pr/KingForLife/UCP_FiveM_v1?color=0088ff&style=for-the-badge&logo=github""/>
  </a>
</p>
