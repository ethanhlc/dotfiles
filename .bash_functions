# .bash_functions File
# pipe youtube-dlp to vlc
ytdl () {
    # yt-dlp -g "$1" | vlc --quiet -
    vlc --quiet "$(yt-dlp -g "$1")"
}
