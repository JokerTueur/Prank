# URL de l'image à télécharger
$url = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/b3179c86-2d5c-49ae-aca3-d334b2fa4805/dh66zz1-f18550f9-4ef3-4102-accb-e6e0d5711ad3.jpg/v1/fill/w_1182,h_676,q_70,strp/cats_in_space_with_tacos_and_a_cattaco_by_surlana_dh66zz1-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NzMyIiwicGF0aCI6IlwvZlwvYjMxNzljODYtMmQ1Yy00OWFlLWFjYTMtZDMzNGIyZmE0ODA1XC9kaDY2enoxLWYxODU1MGY5LTRlZjMtNDEwMi1hY2NiLWU2ZTBkNTcxMWFkMy5qcGciLCJ3aWR0aCI6Ijw9MTI4MCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.6b2BVyMu71Eaw9sBuT0KKkoI7Ihys3RMw7-AcFFnAz0"

# Chemin de destination pour enregistrer l'image
$destination = "$env:userprofile\Videos\CatsInSpaceTacos.jpg"

# Télécharger l'image depuis l'URL
Invoke-WebRequest -Uri $url -OutFile $destination

# Utilisation de l'API Windows pour définir le papier peint
# La méthode SystemParametersInfo est utilisée pour définir l'image comme papier peint
Add-Type -TypeDefinition @"
    using System;
    using System.Runtime.InteropServices;
    public class Wallpaper {
        [DllImport("user32.dll", CharSet = CharSet.Auto)]
        public static extern int SystemParametersInfo(int uAction, int uParam, string lpvParam, int fuWinIni);
    }
"@
$SPI_SETDESKWALLPAPER = 20
$SPIF_UPDATEINIFILE = 0x01
$SPIF_SENDCHANGE = 0x02
[Wallpaper]::SystemParametersInfo($SPI_SETDESKWALLPAPER, 0, $destination, $SPIF_UPDATEINIFILE -bor $SPIF_SENDCHANGE)
