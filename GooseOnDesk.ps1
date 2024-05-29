# URL de l'image à télécharger
$url = 'https://github.com/JokerTueur/goose/archive/refs/heads/main.zip'

# Chemin de destination pour enregistrer l'image
$destination = "$env:userprofile\Videos\goose.zip"

# Télécharger l'image depuis l'URL
Invoke-WebRequest -Uri $url -OutFile $destination

#UNzip l'archive
Expand-Archive .\goose.zip .\

#unzip l'archive du programme
Expand-Archive .\goose-main\DGoose0.31.zip .\

#supprime les archive + dossier unzip
Remove-Item .\goose.zip
Remove-Item .\goose-main


#déplacement dans le dossier du programme
cd '.\Desktop Goose v0.31'

#Lance le programme
.\GooseDesktop.exe
