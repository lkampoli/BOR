#ffmpeg -framerate 10 -pattern_type glob -i "*.png"
ffmpeg -framerate 10 -pattern_type glob -i "c[012345]-*.png" out.swf
