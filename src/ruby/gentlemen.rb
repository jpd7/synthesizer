require_relative './util.rb'
require_relative './instruments.rb'

module Gentlemen
  Verse = seq(
    # God
    sum(note(D4, Q),
        note(D3, Q)),
    # rest
    sum(note(D4, Q),
        note(F3, Q),
        note(D3, Q)),
    # ye
    sum(note(A4, Q),
        note(F4, Q),
        note(D3, Q)),
    # mer -
    sum(note(A4, Q),
        note(E4, Q),
        note(E3, Q),
        note(Cx3, Q)),
    # - ry,
    sum(note(G4, Q),
        note(Cx4, Q),
        note(A3, Q),
        note(A2, Q)),
    # gen -
    sum(note(F4, Q),
        note(D4, Q),
        note(A3, Q),
        note(D3, Q)),
    # - tle -
    sum(note(E4, Q),
        note(C4, Q),
        note(A3, Q),
        note(A2, Q)),
    # - men,
    sum(note(D4, Q),
        note(Ax3, Q),
        note(F3, Q),
        note(Ax2, Q)),
    # let
    sum(note(C4, Q),
        note(A3, Q),
        note(F3, Q),
        note(F2, Q)),
    # noth -
    sum(note(D4, Q),
        note(F3, Q),
        note(Ax2, Q)),
    # - ing
    sum(note(E4, Q),
        note(Cx4, Q),
        note(A3, Q),
        note(A2, Q)),
    # you
    sum(note(F4, Q),
        note(D4, Q),
        note(A3, Q),
        note(D3, Q)),
    # dis -
    sum(note(G4, Q),
        note(D4, Q),
        note(D3, Q),
        note(Ax2, Q)),
    # - may,
    sum(note(A4, H),
        note(Cx4, H),
        note(E3, H),
        note(A2, H)),
    rest(16),
    # re -
    sum(note(D4, Q),
        note(D3, Q)),
    # - mem -
    sum(note(D4, Q),
        note(F3, Q),
        note(D3, Q)),
    # - ber
    sum(note(A4, Q),
        note(F4, Q),
        note(D3, Q)),
    # Christ
    sum(note(A4, Q),
        note(E4, Q),
        note(E3, Q),
        note(Cx3, Q)),
    # our
    sum(note(G4, Q),
        note(Cx4, Q),
        note(A3, Q),
        note(A2, Q)),
    # Sav -
    sum(note(F4, Q),
        note(D4, Q),
        note(A3, Q),
        note(D3, Q)),
    sum(note(E4, Q),
        note(C4, Q),
        note(A3, Q),
        note(A2, Q)),
    # - ior
    sum(note(D4, Q),
        note(Ax3, Q),
        note(F3, Q),
        note(Ax2, Q)),
    # was
    sum(note(C4, Q),
        note(A3, Q),
        note(F3, Q),
        note(F2, Q)),
    # born
    sum(note(D4, Q),
        note(F3, Q),
        note(Ax2, Q)),
    # on
    sum(note(E4, Q),
        note(Cx4, Q),
        note(A3, Q),
        note(A2, Q)),
    # Christ -
    sum(note(F4, Q),
        note(D4, Q),
        note(A3, Q),
        note(D3, Q)),
    # - mas
    sum(note(G4, Q),
        note(D4, Q),
        note(D3, Q),
        note(Ax2, Q)),
    # day
    sum(note(A4, H),
        note(Cx4, H),
        note(E3, H),
        note(A2, H)),
    rest(16),
    # to
    sum(note(A4, Q),
        note(D4, Q),
        note(Fx3, Q),
        note(D3, Q)),
    # save
    sum(note(Ax4, Q),
        note(D4, Q),
        note(G3, Q)),
    # us
    sum(note(G4, Q),
        note(C4, Q),
        note(G3, Q),
        note(E3, Q)),
    # all
    sum(note(A4, Q),
        note(C4, Q),
        note(F3, Q)),
    # from
    sum(note(Ax4, Q),
        note(F4, Q),
        note(F3, Q),
        note(D3, Q)),
    # sin
    sum(note(C5, Q),
        note(Dx4, Q),
        note(F3, Q),
        note(A2, Q)),
    # and
    sum(note(D5, Q),
        note(D4, Q),
        note(F3, Q),
        note(Ax2, Q)),
    # woe
    sum(note(A4, Q),
        note(C4, Q),
        note(F3, Q),
        note(F2, Q)),
    # when
    sum(note(G4, Q),
        note(Cx4, Q),
        note(E3, Q),
        note(A2, Q)),
    # we
    sum(note(F4, Q),
        note(D4, Q),
        note(F3, Q),
        note(D3, Q)),
    # were
    sum(note(D4, Q),
        note(B3, Q),
        note(F3, Q),
        note(D3, Q)),
    # gone
    sum(note(E4, Q),
        note(D4, Q),
        note(G3, Q),
        note(C3, Q)),
    # a -
    sum(note(F4, Q),
        note(C4, Q),
        note(A2, Q)),
    # - stray.
    sum(note(G4, H),
        note(E4, H),
        seq(note(C4, Q),
            note(Ax3, Q)),
        note(C3, H)),
    # O
    sum(note(F4, Q),
        note(A3, Q),
        note(D3, Q)),
    sum(note(G4, Q),
        note(C4, Q),
        note(G3, Q),
        note(E3, Q)),
    # ti -
    sum(note(A4, H),
        note(C4, H),
        note(F3, H)),
    # - dings
    sum(note(Ax4, Q),
        note(D4, Q),
        note(F3, Q),
        note(Ax2, Q)),
    # of
    sum(note(A4, Q),
        note(C4, Q),
        note(F3, Q)),
    # com -
    sum(note(A4, Q),
        note(F4, Q),
        note(C4, Q),
        note(F2, Q)),
    sum(note(G4, Q),
        note(E4, Q),
        note(Ax3, Q),
        note(G2, Q)),
    # - fort
    sum(note(F4, Q),
        note(D4, Q),
        note(A3, Q),
        note(A2, Q)),
    # and
    sum(note(E4, Q),
        note(Cx4, Q),
        note(A3, Q),
        note(A2, Q)),
    # joy,
    sum(note(D4, H),
        note(F3, H),
        note(D3, H)),
    # com -
    sum(note(F4, E),
        note(A3, E),
        note(F3, E),
        note(D3, E)),
    # - fort
    sum(note(E4, E),
        note(A3, E),
        note(F3, E),
        note(D3, E)),
    # and
    sum(note(D4, Q),
        note(B3, Q),
        note(F3, Q),
        note(D3, Q)),
    # joy,
    sum(note(G4, H),
        note(C4, H),
        note(E3, H),
        note(C3, H)),
    # O
    sum(note(F4, Q),
        note(D4, Q),
        note(C4, Q),
        note(A2, Q)),
    sum(note(G4, Q),
        note(E4, Q),
        note(C4, Q),
        note(G2, Q)),
    # ti -
    sum(seq(note(A4, Q),
            note(Ax4, Q)),
        note(F4, H),
        seq(note(A3, Q),
            note(F3, Q)),
        seq(note(F2, Q),
            note(D3, Q))),
    # - dings
    sum(note(C5, Q),
        note(F4, Q),
        note(C4, Q),
        note(A2, Q)),
    # of
    sum(note(D5, Q),
        note(F4, Q),
        note(B3, Q),
        note(B2, Q)),
    # com -
    sum(note(A4, Q),
        note(F4, Q),
        note(C4, Q),
        note(F2, Q)),
    sum(note(G4, Q),
        note(E4, Q),
        note(B3, Q),
        note(G2, Q)),
    # - fort
    sum(note(F4, Q),
        note(D4, Q),
        note(A3, Q),
        note(A2, Q)),
    # and
    sum(note(E4, Q),
        note(Cx4, Q),
        note(A3, Q),
        note(A2, Q)),
    # joy!
    sum(note(D4, W),
        note(F3, W),
        note(D3, W))
  )

  Simple_Verse = seq(
    # God
    note(D4, Q),
    # rest
    note(D4, Q),
    # ye
    note(A4, Q),
    # mer -
    note(A4, Q),
    # - ry,
    note(G4, Q),
    # gen -
    note(F4, Q),
    # - tle -
    note(E4, Q),
    # - men,
    note(D4, Q),
    # let
    note(C4, Q),
    # noth -
    note(D4, Q),
    # - ing
    note(E4, Q),
    # you
    note(F4, Q),
    # dis -
    note(G4, Q),
    # - may,
    note(A4, H + Q),
    # re -
    note(D4, Q),
    # - mem -
    note(D4, Q),
    # - ber
    note(A4, Q),
    # Christ
    note(A4, Q),
    # our
    note(G4, Q),
    # Sav -
    note(F4, Q),
    note(E4, Q),
    # - ior
    note(D4, Q),
    # was
    note(C4, Q),
    # born
    note(D4, Q),
    # on
    note(E4, Q),
    # Christ -
    note(F4, Q),
    # - mas
    note(G4, Q),
    # day
    note(A4, H + Q),
    # to
    note(A4, Q),
    # save
    note(Ax4, Q),
    # us
    note(G4, Q),
    # all
    note(A4, Q),
    # from
    note(Ax4, Q),
    # sin
    note(C5, Q),
    # and
    note(D5, Q),
    # woe
    note(A4, Q),
    # when
    note(G4, Q),
    # we
    note(F4, Q),
    # were
    note(D4, Q),
    # gone
    note(E4, Q),
    # a -
    note(F4, Q),
    # - stray.
    note(G4, H),
    # O
    note(F4, Q),
    note(G4, Q),
    # ti -
    note(A4, H),
    # - dings
    note(Ax4, Q),
    # of
    note(A4, Q),
    # com -
    note(A4, Q),
    note(G4, Q),
    # - fort
    note(F4, Q),
    # and
    note(E4, Q),
    # joy,
    note(D4, H),
    # com -
    note(F4, E),
    # - fort
    note(E4, E),
    # and
    note(D4, Q),
    # joy,
    note(G4, H),
    # O
    note(F4, Q),
    note(G4, Q),
    # ti -
    note(A4, Q),
    note(Ax4, Q),
    # - dings
    note(C5, Q),
    # of
    note(D5, Q),
    # com -
    note(A4, Q),
    note(G4, Q),
    # - fort
    note(F4, Q),
    # and
    note(E4, Q),
    # joy!
    note(D4, W)
  )

  Test_Verse = seq(
    # God
    note(D4, Q),
    # rest
    note(D4, Q),
    # ye
    note(A4, Q),
    # mer -
    note(A4, Q),
    # - ry,
    note(G4, Q),
    # gen -
    note(F4, Q),
    # - tle -
    note(E4, Q),
    # - men,
    note(D4, Q),
    # let
    note(C4, Q),
    # noth -
    note(D4, Q),
    # - ing
    note(E4, Q),
    # you
    note(F4, Q),
    # dis -
    note(G4, Q),
    # - may,
    note(A4, H + Q)
  )

  Song = play(Steel_Guitar::Instrument,
              Verse,
              whole_note: 0.9,
              pause: 0.01)
end
