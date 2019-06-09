library("tabr")

# you also need to install lilypond: pac search lilypond
header = list(
  title = "Clementin",
  composer = "Komp.: trad. USA",
  subtitle = "Aus: Das Kinderliederbuch",
  arranger = "dt. Nachdichtung: G. Schöne",
  copyright = "G. Schöne/Buschfunk"
  #tagline = paste("Arranged by Matthew Leonawicz", Sys.Date())
)

p_1 = p("e e", info = "4 4", string = "4 4")
p_2 = p("e b2 r g# g# g# e r e g# b3 b3 r",
        info = "4. 4. 4 4 4 4. 4. 4 4 4 4. 4. 4",
        string = "4 4 4 5 x 3 3 3 4 x 4 3 0 0 x")
p_3 = p("a g# f# r f# g# a a r b3 b3",
        info = "4 4 4 4 4 4 4. 4. 4 4 4",
        string = "2 1 4 x 4 1 2 2 x 0 0")
p_4 = p("g# e r e g# f# b2 r d# f# e r",
        info = "4. 4. 4 4 4 4. 4. 4 4 4 4 4",
        string = "3 4 x 2 1 4 2 x 1 4 2 x")
p_all = glue(p_1, 
             # repeat
             volta(glue(p_2, p_3, p_4)), 
             p_2, p_3, p_4)
track_1 = track(p_all)
song = score(track_1)
tab(song, "pdf/clementin.pdf",
    # setting key to e, let appear # (sharp) for c, d, e, f
    key = "e", time = "4/4", header = header)

# then play it
# before that install: timidity, fluidr3, fluidsynth
# see also: https://wiki.archlinux.org/index.php/MIDI
system("timidity pdf/clementin.midi&")
