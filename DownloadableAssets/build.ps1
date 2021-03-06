Set-Location "$PSScriptRoot" 


$sampleRoot = "..\src\NetCore\WestWind.Globalization.Sample.AspNetCore"



if([System.IO.File]::Exists(".\content")) {
    remove-item content -Recurse -Force
}
mkdir content\wwwroot\LocalizationAdmin    
mkdir content\Properties

Copy-Item $sampleRoot\wwwroot\LocalizationAdmin  content\wwwroot -Recurse -Force
Copy-Item $sampleRoot\Properties\LocalizationForm.resx content\Properties\LocalizationForm.resx
Copy-Item $sampleRoot\Properties\LocalizationForm.de.resx content\Properties\LocalizationForm.de.resx
Copy-Item .\DbResourceConfiguration.json .\content\DbResourceConfiguration.json

"Zipping up Localization Administration Files"
Remove-Item "LocalizationAdministrationHtml_AspnetCore.zip"
7z a -tzip -r "LocalizationAdministrationHtml_AspNetCore.zip" ".\content\*.*"


remove-item content -Recurse -Force
mkdir .\content\Pages
mkdir .\content\Properties

Copy-Item $sampleRoot\Pages\ResourceTest.cshtml .\content\Pages\ResourceTestPage.cshtml
Copy-Item $sampleRoot\Properties\ResourceTestPage.resx .\content\Properties\ResourceTestPage.resx
Copy-Item $sampleRoot\Properties\ResourceTestPage.de.resx .\content\Properties\ResourceTestPage.de.resx

Copy-Item $sampleRoot\Properties\Resources.resx .\content\Properties\Resources.resx
Copy-Item $sampleRoot\Properties\Resources.*.resx .\content\Properties\
Copy-Item $sampleRoot\Properties\*Flag.png .\content\Properties\

"Zipping up Localization Administration Files"
Remove-Item "LocalizationSample_AspnetCore.zip"
7z a -tzip -r "LocalizationSample_AspNetCore.zip" ".\content\*.*"

Remove-Item content -Recurse -Force

$direct