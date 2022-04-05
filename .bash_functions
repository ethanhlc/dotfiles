# .bash_functions File
# pipe youtube-dlp to vlc
ytdl () {
    # ~/.virtualenvs/ytdlp/bin/yt-dlp -g "$1" | vlc --quiet -
    vlc --quiet "$(~/.virtualenvs/ytdlp/bin/yt-dlp -g "$1")"
}
