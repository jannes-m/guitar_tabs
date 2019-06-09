library("tabr")

# you also need to install lilypond: pac search lilypond
header = list(
  title = "Clementin",
  composer = "Komp.: trad. USA",
  # subtitle = "Theme from Assassin's Creed 2",
  arranger = "dt. Nachdichtung: G. Schöne",
  copyright = "G. Schöne/Buschfunk"
  #tagline = paste("Arranged by Matthew Leonawicz", Sys.Date())
)

# if one is lucky, the software is figuring out which strings to play, however,
# to be safe, indicate the strings to touch for each note
p_0 = p("e e", 
        info = "4 4",
        string = "4 4")
p_1 = p("e b2 r g# g# g# e r e g# b3 b3 r",
        info = "4. 4. 4 4 4 4. 4. 4 4 4 4. 4. 4",
        string = "4 5 x 3 3 3 4 x 4 3 0 0 x")
p_2 = p("a g# f# r f# g# a a r b3 b3",
        info = "4 4 4 4 4 4 4. 4. 4 4 4",
        string = "2 1 4 x 4 1 2 2 x 0 0")
p_3 = p("g# e r e g# f# b2 r d# f# e r",
        info = "4. 4. 4 4 4 4. 4. 4 4 4 4 4",
        string = "3 4 x 2 1 4 2 x 1 4 2 x")
p_all = glue(p_0, 
             # add repeat sign
             volta(glue(p_1, p_2, p_3, p_0)),
             p_1, p_2, p_3)
track_1 = track(p_all)
song = score(track_1)
tab(song, "pdf/clementin.pdf",
    # using key as e (default: c), makes 4 sharp signs appear (c, d, f, g) all
    # these notes are played one halftone higher, e.g., d = d# (dis), f = f#
    # (fis)
    key = "e", time = "4/4", header = header)

# then play it
# before that install: timidity, fluidr3,
# see also: https://wiki.archlinux.org/index.php/MIDI
system("timidity pdf/clementin.midi&")
