F5  = 56
E5  = 55
Eb5 = 54
Dx5 = 54
D5  = 53
Db5 = 52
Cx5 = 52
C5  = 51
B4  = 50
Bb4 = 49
Ax4 = 49
A4  = 48
Ab4 = 47
Gx4 = 47
G4  = 46
Gb4 = 45
Fx4 = 45
F4  = 44
E4  = 43
Eb4 = 42
Dx4 = 42
D4  = 41
Db4 = 40
Cx4 = 40
C4  = 39
B3  = 38
Bb3 = 37
Ax3 = 37
A3  = 36
Ab3 = 35
Gx3 = 35
G3  = 34
Gb3 = 33
Fx3 = 33
F3  = 32
E3  = 31
Eb3 = 30
Dx3 = 30
D3  = 29
Db3 = 28
Cx3 = 28
C3  = 27
B2  = 26
Bb2 = 25
Ax2 = 25
A2  = 24
Ab2 = 23
Gx2 = 23
G2  = 22
Gb2 = 21
Fx2 = 21
F2  = 20
E2  = 19

W = 1024 * 1024
H = W / 2
Q = W / 4
E = W / 8
S = W / 16
T = W / 32

def sum *xs
  Java::JpdSynth::Sum.new *xs
end

def note pitch, duration
  Java::JpdSynth::Note.new pitch, duration
end

def seq *xs
  Java::JpdSynth::Seq.new *xs
end

def rest duration
  Java::JpdSynth::Rest.new duration
end

# Utilities

def sin(frequency, volume:1)
  Java::JpdSynth::Util::sin frequency, volume
end

def sawtooth(frequency, volume:1)
  Java::JpdSynth::Util::sawtooth frequency, volume
end

def square(frequency, volume:1)
  Java::JpdSynth::Util::square frequency, volume
end

def indented_square(frequency, indent:, volume:1)
  Java::JpdSynth::Util::indentedSquare frequency, indent, volume
end

def rotating_waveform(frequency, volume:1)
  Java::JpdSynth::Util::rotatingWaveform frequency, volume
end

def triangle(frequency, volume:1)
  Java::JpdSynth::Util::triangle frequency, volume
end

def quadratic(frequency, volume:1)
  Java::JpdSynth::Util::quadratic frequency, volume
end

def tremolo(function, frequency:, proportion:, offset:)
  Java::JpdSynth::Util::tremolo function, frequency, proportion, offset
end

def vibrato(function, frequency:, proportion:)
  Java::JpdSynth::Util::vibrato function, frequency, proportion
end

def change_frequency(function, scale)
  Java::JpdSynth::Util::changeFrequency function, scale
end

def change_volume(function, scale)
  Java::JpdSynth::Util::changeVolume function, scale
end

def lowpass(function, sample_count:, gap:)
  Java::JpdSynth::Util::lowpass function, sample_count, gap
end

def sum_waveforms(*functions)
  Java::JpdSynth::Util::sum *functions
end

def seq_waveforms(*functions)
  Java::JpdSynth::Util::seq *functions
end

def echo(function, delay:, volume:)
  Java::JpdSynth::Util::echo function, delay, volume
end

def delay(function, delay)
  Java::JpdSynth::Util::delay function, delay
end

def save file_name, song
  Java::JpdSynth::Generate::save file_name, song
end

def factory(attack_slope:, attack_max_mult:, decay_slope:, release_base:)
  Java::JpdSynth::NormalNoteFunctionFactory.new(
    attack_slope, attack_max_mult, decay_slope, release_base)
end

def instrument waveform, factory
  Java::JpdSynth::Instrument.new waveform, factory
end

def play(instrument, script, whole_note:, pause:)
  instrument.play script, whole_note, pause
end

def change_sample_rate rate
  Java::JpdSynth::Generate::sample_rate = rate
end
