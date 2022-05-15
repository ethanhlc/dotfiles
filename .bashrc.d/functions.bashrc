# ~/.bashrc.d/funcions.bashrc
# bash functions file
# Created by: Ethan Baik
# Date: 2022.05.15

# pipe youtube-dlp to vlc
ytdl () {
    # yt-dlp -g "$1" | vlc --quiet -
    vlc --quiet "$(yt-dlp -g "$1")"
}
