# GC

# args list
param([string]$content_dir="TV")

$content_root="C:\Users\baodepei\Videos"

# fetch file names from TV and Movie in episode.list
# append glob to each item
# $tv_list format: "D:\TV\..."
# $movie_list format: "D:\Movie\..."
#TV
if(-not (Test-Path "$content_root\TV\episode.list" -pathType leaf)){
    New-Item -type file -force "$content_root\TV\episode.list
} else {
    $tv_list=Get-Content $content_root\TV\episode.list | % { [io.path]::GetFileNameWithoutExtension($_)+'*'}
}

#Movie
if(-not (Test-Path "$content_root\Movie\episode.list" -pathType leaf)){
    New-Item -type file -force "$content_root\Movie\episode.list
} else {
    $tv_list=Get-Content $content_root\Movie\episode.list | % { [io.path]::GetFileNameWithoutExtension($_)+'*'}
}


# append episode.list to array
$tv_list+="episode.list"
$movie_list+="episode.list"

# delete files not in episode.list
Get-ChildItem "$content_root\TV" -exclude $tv_list | Remove-Item -force
Get-ChildItem "$content_root\Movie" -exclude $movie_list | Remove-Item -force

# update episode.list with new episode (do this first in case moving failed, so list is still available)
Get-ChildItem "$content_root\TV_new" | Where-Object {$_.name -match '(mp4|avi)'} | Select -ExpandProperty 'Name' | Add-Content "$content_root\TV\episode.list"
Get-ChildItem "$content_root\Movie_new" | Where-Object {$_.name -match '(mp4|avi)'} | Select -ExpandProperty 'Name' | Add-Content "$content_root\
Movie\episode.list"

# move new episodes to TV/Movie dir
Get-ChildItem "$content_root\TV_new" | Move-Item -Destination "$content_root\TV" -force
Get-ChildItem "$content_root\Movie_new" | Move-Item -Destination "$content_root\Movie" -force