library("tabr")

# you also need to install lilypond: pac search lilypond
header = list(
  title = "Der Meeresbezwinger Thomas",
  composer = "Gerhard Schöne",
  # subtitle = "Theme from Assassin's Creed 2",
  # arranger = "dt. Nachdichtung: G. Schöne",
  copyright = "G. Schöne/Buschfunk"
  #tagline = paste("Arranged by Matthew Leonawicz", Sys.Date())
)

# if one is lucky, the software is figuring out which strings to play, however,
# to be safe, indicate the strings to touch for each note
p_1 = p("c# e f# g# r g# g# a g# f# e r g# f# e d# e c# r r b2 c# r b3 g# r", 
        info = "4 4 4 4 4 4 4 4. 8 4 4 4 4 4 4 4 4 4 4 4 4 4 4 2. 2. 4")
p_2 = p("c# e f# g# r g# a g# f# e",
        info = paste(rep("4", 10), collapse = " "))
p_3 = p("f# e d# c# r b2 c# r b3 b3 a g# f#",
        info = paste(rep("4", 13), collapse = " "))
p_all = glue(p_1, p_2, p_3)
track_1 = track(p_all)
song = score(track_1)
tab(song, "pdf/thomas.pdf",
    # using key as e (default: c), makes 4 sharp signs appear (c, d, f, g) all
    # these notes are played one halftone higher, e.g., d = d# (dis), f = f#
    # (fis)
    key = "e", time = "3/4", header = header)

# then play it
# before that install: timidity, fluidr3,
# see also: https://wiki.archlinux.org/index.php/MIDI
system("timidity pdf/thomas.midi&")
