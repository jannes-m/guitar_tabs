library("tabr")

# you also need to install lilypond: pac search lilypond
header = list(
  title = "Frosch und Maus",
  composer = "Komp.: trad. England",
  subtitle = "Aus: Das Kinderliederbuch",
  arranger = "dt. Nachdichtung: G. Schöne",
  copyright = "G. Schöne/Buschfunk"
  #tagline = paste("Arranged by Matthew Leonawicz", Sys.Date())
)

# if one is lucky, the software is figuring out which strings to play, however,
# to be safe, indicate the strings to touch for each note
p_1 = p("e e e e e g# g# f# e c# b2 e r r b2 e r r", 
        info = "4 4 8 8 4 8 8 4 4 4 4 4 4 4 4 4 4 4")
p_2 = p("e g# b b b g# b c#4 b g# e e g# g# b g# e g# f# e c# b2 e r r b2 e r r",
        info = "4 4 8 8 4 8 8 4 4 4 8 8 4 8 8 4 8 8 4 4 4 4 4 4 4 4 4 4 4")
p_all = glue(p_1, p_2)
track_1 = track(p_all)
song = score(track_1)
tab(song, "pdf/frosch_und_maus.pdf",
    # using key as e (default: c), makes 4 sharp signs appear (c, d, f, g) all
    # these notes are played one halftone higher, e.g., d = d# (dis), f = f#
    # (fis)
    key = "e", time = "4/4", header = header)

# then play it
# before that install: timidity, fluidr3,
# see also: https://wiki.archlinux.org/index.php/MIDI
system("timidity pdf/frosch_und_maus.midi&")
