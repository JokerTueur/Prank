# Function to save picture and set wallpaper
function Save-And-Set-Wallpaper {
    param (
        [string]$url,
        [string]$savePath
    )

    # Download image
    Invoke-WebRequest -Uri $url -OutFile $savePath

    # Set wallpaper
    $regKeyPath = "HKCU:\Control Panel\Desktop"
    Set-ItemProperty -Path $regKeyPath -Name Wallpaper -Value $savePath
    rundll32.exe user32.dll,UpdatePerUserSystemParameters

    Write-Host "Wallpaper set successfully."
}

# Specify the URL and save path
$url = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/b3179c86-2d5c-49ae-aca3-d334b2fa4805/dh66zz1-f18550f9-4ef3-4102-accb-e6e0d5711ad3.jpg/v1/fill/w_1182,h_676,q_70,strp/cats_in_space_with_tacos_and_a_cattaco_by_surlana_dh66zz1-pre.jpg?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9NzMyIiwicGF0aCI6IlwvZlwvYjMxNzljODYtMmQ1Yy00OWFlLWFjYTMtZDMzNGIyZmE0ODA1XC9kaDY2enoxLWYxODU1MGY5LTRlZjMtNDEwMi1hY2NiLWU2ZTBkNTcxMWFkMy5qcGciLCJ3aWR0aCI6Ijw9MTI4MCJ9XV0sImF1ZCI6WyJ1cm46c2VydmljZTppbWFnZS5vcGVyYXRpb25zIl19.6b2BVyMu71Eaw9sBuT0KKkoI7Ihys3RMw7-AcFFnAz0"
$savePath = "$env:TEMP\wallpaper.jpg"

# Save picture and set wallpaper
Save-And-Set-Wallpaper -url $url -savePath $savePath