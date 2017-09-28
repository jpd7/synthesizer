require_relative './util.rb'
require_relative './instruments.rb'

module Joy
  Verse = seq(
    # Joy
    sum(note(D5, Q),
        note(D4, Q),
        note(Fx3, Q),
        note(D3, Q)),

    # to
    sum(note(Cx5, E + S),
        note(D4, E + S),
        note(A3, E + S),
        note(D3, E + S)),

    # the
    sum(note(B4, S),
        note(D4, S),
        note(G3, S),
        note(D3, S)),

    # world!
    sum(note(A4, Q + E),
        note(D4, Q + E),
        note(Fx3, Q + E),
        note(D3, Q + E)),

    # the
    sum(note(G4, E),
        note(E4, E),
        note(B3, E),
        note(G2, E)),

    # Lord is
    sum(seq(note(Fx4, Q),
            note(E4, Q)),
        seq(note(D4, Q),
            note(Cx4, Q)),
        seq(note(A3, Q + E),
            note(G3, E)),
        seq(note(A2, Q),
            note(A2, Q))),

    # come!
    sum(note(D4, Q + E),
        note(Fx3, Q + E),
        note(D3, Q + E)),

    # Let
    sum(note(A4, E),
        note(G4, E),
        note(D4, E),
        note(Fx3, E)),

    # earth
    sum(note(B4, Q + E),
        note(G4, Q + E),
        note(D4, Q + E),
        note(G3, Q + E)),

    # re -
    sum(note(B4, E),
        note(G4, E),
        note(D4, E),
        note(G3, E)),

    # - ceive
    sum(note(Cx5, Q + E),
        note(G4, Q + E),
        note(A3, Q + E)),

    # her
    sum(note(Cx5, E),
        note(G4, E),
        note(A3, E)),

    # King;
    sum(note(D5, Q + E),
        note(Fx4, Q + E),
        note(A3, Q + E),
        note(D3, Q + E)),

    # Let
    sum(note(D5, E),
        note(Fx4, E),
        note(A3, E),
        note(D3, E)),

    # ev -
    sum(seq(note(D5, E),
            note(Cx5, E)),
        seq(note(Fx4, E),
            note(A4, E)),
        note(A3, E),
        note(D3, E)),

    # - ery
    sum(seq(note(B4, E),
            note(A4, E)),
        seq(note(G4, E),
            note(Fx4, E)),
        note(D4, E),
        note(D3, E)),

    # heart pre -
    sum(seq(note(A4, E + S),
            note(G4, S),
            note(Fx4, E),
            note(D5, E)),
        seq(note(Fx4, E + S),
            note(E4, S),
            note(D4, E),
            note(Fx4, E)),
        seq(note(D4, Q),
            note(A3, E),
            note(A3, E)),
        seq(note(D3, Q + E),
            note(D3, E))),

    # - pare
    sum(seq(note(D5, E),
            note(Cx5, E)),
        seq(note(Fx4, E),
            note(A4, E)),
        note(A3, Q),
        note(D3, Q)),

    # him
    sum(seq(note(B4, E),
            note(A4, E)),
        seq(note(G4, E),
            note(Fx4, E)),
        note(D4, Q),
        note(D3, Q)),

    # room,
    sum(seq(note(A4, E + S),
            note(G4, S),
            note(Fx4, E)),
        seq(note(Fx4, E + S),
            note(E4, S),
            note(D4, E)),
        seq(note(D4, Q),
            note(A3, E)),
        note(D3, Q + E)),

    # and
    sum(note(Fx4, E),
        note(D4, E)),

    # saints
    sum(note(Fx4, E),
        note(D4, E)),

    # and
    sum(note(Fx4, E),
        note(D4, E)),

    # an -
    sum(note(Fx4, E),
        note(D4, E)),

    # - gels
    sum(seq(note(Fx4, S),
            note(G4, S)),
        seq(note(D4, S),
            note(E4, S)),
        note(A3, E),
        note(D3, E)),

    # sing
    sum(note(A4, Q + E),
        note(Fx4, Q + E),
        seq(note(A3, E),
            note(A3, E),
            note(A3, E)),
        seq(note(D3, E),
            note(D3, E),
            note(D3, E))),

    # and
    sum(seq(note(G4, S),
            note(Fx4, S)),
        seq(note(E4, S),
            note(D4, S)),
        note(A3, E),
        note(D3, E)),

    # saints and an - gels sing
    sum(seq(note(E4, E),
            note(E4, E),
            note(E4, E),
            note(E4, S),
            note(Fx4, S),
            note(G4, Q + E)),
        seq(note(Cx4, E),
            note(Cx4, E),
            note(Cx4, E),
            note(Cx4, S),
            note(D4, S),
            note(E4, Q + E)),
        note(A3, W - E),
        seq(note(A2, Q + E),
            note(A2, E),
            note(A2, E),
            note(A2, E),
            note(A2, E))),

    # and
    sum(seq(note(Fx4, S),
            note(E4, S)),
        seq(note(D4, S),
            note(Cx4, S)),
        note(A3, E),
        note(A2, E)),

    # saints,
    sum(seq(note(D4, E),
            sum(note(D5, Q),
                note(Fx4, Q))),
        seq(note(Fx3, E),
            note(D4, Q)),
        note(D3, Q + E)),

    # and
    sum(note(B4, E),
        note(G4, E),
        note(D4, E),
        note(D3, E)),

    # saints
    sum(seq(note(A4, E + S),
            note(G4, S),
            note(Fx4, E)),
        seq(note(Fx4, E + S),
            note(E4, S),
            note(D4, E)),
        note(D4, Q + E),
        note(D3, Q + E)),

    # and
    sum(note(G4, E),
        note(E4, E),
        note(B3, E),
        note(G2, E)),

    # an -
    sum(note(Fx4, Q),
        note(D4, Q),
        note(A3, Q),
        note(A2, Q)),

    # - gels
    sum(note(E4, Q),
        note(Cx4, Q),
        seq(note(A3, E),
            note(G3, E)),
        note(A2, Q)),

    # sing.
    sum(note(D4, H),
        note(Fx3, H),
        note(D3, H))
  )

  Simple_Verse = seq(
    # Joy
    note(D5, Q),

    # to
    note(Cx5, E + S),

    # the
    note(B4, S),

    # world!
    note(A4, Q + E),

    # the
    note(G4, E),

    # Lord is
    seq(note(Fx4, Q),
        note(E4, Q)),

    # come!
    note(D4, Q + E),

    # Let
    note(A4, E),

    # earth
    note(B4, Q + E),

    # re -
    note(B4, E),

    # - ceive
    note(Cx5, Q + E),

    # her
    note(Cx5, E),

    # King;
    note(D5, Q + E),

    # Let
    note(D5, E),

    # ev -
    seq(note(D5, E),
        note(Cx5, E)),

    # - ery
    seq(note(B4, E),
        note(A4, E)),

    # heart pre -
    seq(note(A4, E + S),
        note(G4, S),
        note(Fx4, E),
        note(D5, E)),

    # - pare
    seq(note(D5, E),
        note(Cx5, E)),

    # him
    seq(note(B4, E),
        note(A4, E)),

    # room,
    seq(note(A4, E + S),
        note(G4, S),
        note(Fx4, E)),

    # and
    note(Fx4, E),

    # saints
    note(Fx4, E),

    # and
    note(Fx4, E),

    # an -
    note(Fx4, E),

    # - gels
    seq(note(Fx4, S),
        note(G4, S)),

    # sing
    note(A4, Q + E),

    # and
    seq(note(G4, S),
        note(Fx4, S)),

    # saints and an - gels sing
    seq(note(E4, E),
        note(E4, E),
        note(E4, E),
        note(E4, S),
        note(Fx4, S),
        note(G4, Q + E)),

    # and
    seq(note(Fx4, S),
        note(E4, S)),

    # saints,
    seq(note(D4, E),
        note(D5, Q)),

    # and
    note(B4, E),

    # saints
    seq(note(A4, E + S),
        note(G4, S),
        note(Fx4, E)),

    # and
    note(G4, E),

    # an -
    note(Fx4, Q),

    # - gels
    note(E4, Q),

    # sing.
    note(D4, H)
  )

  Beginning_Of_Verse = seq(
    # Joy
    sum(note(D5, Q),
        note(D4, Q),
        note(Fx3, Q),
        note(D3, Q)),

    # to
    sum(note(Cx5, E + S),
        note(D4, E + S),
        note(A3, E + S),
        note(D3, E + S)),

    # the
    sum(note(B4, S),
        note(D4, S),
        note(G3, S),
        note(D3, S)),

    # world!
    sum(note(A4, Q + E),
        note(D4, Q + E),
        note(Fx3, Q + E),
        note(D3, Q + E))
  )

  Song = play(Synth_Piano::Instrument,
              Verse,
              whole_note: 2.5,
              pause: 0.03)
end
