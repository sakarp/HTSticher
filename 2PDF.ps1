$dirs = GET-CHILDITEM -Directory
$authorName = "output.pdf"
Foreach ($d in $dirs){
    Set-Location -PATH "$d" 
    $location = Get-Location
    $split = $location -split '\\'
    $lastItem = $split.Length - 1
    $authorName = $split[$lastItem]
    Write-Output $authorName
    magick.exe convert *.png -set filename:base "%[basename]" "%[filename:base].jpg"
    Write-Output "Conversion to jpg done"
    $myFiles = GET-CHILDITEM -FILTER "*.jpg" | Sort-Object
    Foreach ($f in $myFiles){
        $justFile = $f
        $split = $justFile -split '_'
        $lastItem = $split.Length - 1
        $seq = $split[$lastItem]
        Rename-Item $f  $seq
    }

    Write-Output "File rename done"
    $ordered = GET-CHILDITEM -FILTER "*.jpg" | Sort-Object {[int]$_.basename}
    magick.exe convert $ordered output.pdf
    Rename-Item output.pdf $authorName+'.pdf'
    Copy-Item -Path $authorName+'.pdf' -Destination ../
    cd ..
}