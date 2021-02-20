# Youtube video downloader.
Required program:
 - youtube-dl: https://github.com/ytdl-org/youtube-dl
 - youtube-dl: https://github.com/ytdl-org/youtube-dl/releases

Example:
 - youtube-bestvideo+bestaudio.cmd: simple script just downloads video


## How to download videos and subtitles and embed subtitles in videos.
        youtube-dl.FAQ

https://github.com/ytdl-org/youtube-dl/blob/master/README.md#format-selection
### Get list of subtitles:
    youtube-dl.exe --list-subs https://www.youtube.com/watch?v=oVkRzVDv8mM
### Download all subtitles without video:
    youtube-dl --all-subs --skip-download https://www.youtube.com/watch?v=Ye8mB6VsUHw
### Download video and subtitles of specific languages:
    youtube-dl --write-sub --sub-lang ru,en https://www.youtube.com/watch?v=oVkRzVDv8mM
### Download video and all subtitles and convert subs to srt format
    youtube-dl --sub-format vtt --convert-subs srt --all-subs -k https://www.youtube.com/watch?v=oVkRzVDv8mM

## Creating mkv video with subtitles. 
### To make video and subtitles into one file  use the following program:
[mkvtoolnix-gui.exe](https://mkvtoolnix.download/downloads.html)

###Or you can just use a good player like 
[MPV](https://mpv.io/). 
It can automatically pick up subtitles.

## Get list of all video-audio formats:
    youtube-dl -F https://www.youtube.com/watch?v=oVkRzVDv8mM
    [info] Available formats for oVkRzVDv8mM:
    format code  extension  resolution note
    249          webm       audio only tiny   59k , opus @ 50k (48000Hz), 16.94MiB
    250          webm       audio only tiny   79k , opus @ 70k (48000Hz), 21.89MiB
    140          m4a        audio only tiny  135k , m4a_dash container, mp4a.40.2@128k (44100Hz), 49.33MiB
    251          webm       audio only tiny  158k , opus @160k (48000Hz), 43.03MiB
    256          m4a        audio only tiny  198k , m4a_dash container, mp4a.40.5 (24000Hz), 73.07MiB
    258          m4a        audio only tiny  391k , m4a_dash container, mp4a.40.2 (48000Hz), 145.25MiB
    278          webm       256x144    144p   97k , webm container, vp9, 24fps, video only, 29.15MiB
    160          mp4        256x144    144p  121k , avc1.4d400c, 24fps, video only, 41.59MiB
    242          webm       426x240    240p  225k , vp9, 24fps, video only, 36.02MiB
    243          webm       640x360    360p  325k , vp9, 24fps, video only, 94.04MiB
    133          mp4        426x240    240p  326k , avc1.4d4015, 24fps, video only, 91.94MiB
    244          webm       854x480    480p  632k , vp9, 24fps, video only, 187.48MiB
    134          mp4        640x360    360p  635k , avc1.4d401e, 24fps, video only, 114.65MiB
    135          mp4        854x480    480p 1162k , avc1.4d401e, 24fps, video only, 238.48MiB
    247          webm       1280x720   720p 1310k , vp9, 24fps, video only, 397.80MiB
    136          mp4        1280x720   720p 2317k , avc1.4d401f, 24fps, video only, 466.88MiB
    248          webm       1920x1080  1080p 2376k , vp9, 24fps, video only, 747.29MiB
    137          mp4        1920x1080  1080p 4353k , avc1.640028, 24fps, video only, 910.94MiB
    271          webm       2560x1440  1440p 6389k , vp9, 24fps, video only, 2.17GiB
    313          webm       3840x2160  2160p 13086k , vp9, 24fps, video only, 4.38GiB
    18           mp4        640x360    360p  401k , avc1.42001E, mp4a.40.2@ 96k (44100Hz), 150.54MiB
    22           mp4        1280x720   720p 1270k , avc1.64001F, mp4a.40.2@192k (44100Hz) (best)

## Download specific streams by numbers:
    youtube-dl -f 248+258 https://www.youtube.com/watch?v=oVkRzVDv8mM
## Download specific streams by numbers and subtitles:
    youtube-dl --write-sub --sub-lang ru,en -f 137+258 https://www.youtube.com/watch?v=oVkRzVDv8mM

## Downloading all videos in playlist.
By default, the program downloads video with the vp9 codec. 
If you have problems with playback on your devices.
Can be downloaded with vc1 codec:
    youtube-dl -f'bestvideo[ext=mp4]+bestaudio' https://www.youtube.com/playlist?list=PLrCZzMib1e9rx3HmaLQfLYb9ociIvYOY1

