require_relative './util.rb'

# private static Function c = sum(square(440, 1.0 / 3),
#                                 square(441, 1.0 / 3),
#                                 square(442, 1.0 / 3));

module Steel_Guitar
  Waveform = sum_waveforms(sin(440, volume: 0.25),
                           sin(450, volume: 0.25),
                           sawtooth(460, volume: 0.25),
                           sawtooth(470, volume: 0.25))

  Factory = factory(attack_slope: 100.0,
                    attack_max_mult: 1.9,
                    decay_slope: -100.0,
                    release_base: 0.0001)

  Instrument = instrument Waveform, Factory
end

module Retro_Synth
  Waveform = lowpass(sum_waveforms(sawtooth(440, volume: 0.3),
                                   sawtooth(441, volume: 0.3),
                                   sawtooth(442, volume: 0.3)),
                     sample_count: 4,
                     gap: 0.00002)

  Factory = factory(attack_slope: 9.0,
                    attack_max_mult: 1.1,
                    decay_slope: -6.0,
                    release_base: 0.01)

  Instrument = instrument Waveform, Factory
end

module Synth_Piano
  Waveform = vibrato(lowpass(sum_waveforms(square(440, volume: 0.5),
                                           sawtooth(442, volume: 0.5),
                                           quadratic(444, volume: 0.3),
                                           sin(446, volume: 0.2)),
                             sample_count: 7,
                             gap: 0.00002),
                     frequency: 3,
                     proportion: 0.0002)

  Factory = factory(attack_slope: 9.0,
                    attack_max_mult: 1.1,
                    decay_slope: -6.0,
                    release_base: 0.01)

  Instrument = instrument Waveform, Factory
end

module Testing
  Waveform = change_volume(sum_waveforms(square(100, volume: 0.6),
                                         sawtooth(100.1, volume: 0.6),
                                         square(440, volume: 0.3),
                                         sawtooth(440.1, volume: 0.3)),
                           2)

  Factory = factory(attack_slope: 1.0e1000,
                    attack_max_mult: 50.0,
                    decay_slope: -1.0e1000,
                    release_base: 1.0e-5)

  Instrument = instrument Waveform, Factory
end

def freq_range start, stop, samples, volume
  freq = start
  step = (stop - start).to_f / samples
  components = []
  while freq <= stop
    components << yield(freq, volume / samples)
    freq += step
  end
  sum_waveforms(*components)
end

module Test2
  Waveform = tremolo(
    sum_waveforms(
      lowpass(freq_range(220, 230, 10, 0.05) {|freq, vol|
                square(freq, volume: vol)
              },
              sample_count: 20,
              gap: 0.002),
      square(440, volume: 0.05),
      triangle(440.4, volume: 0.05)),
    frequency: 20.0,
    proportion: 0.0002,
    offset: 1.0)

  Factory = factory(attack_slope: 1.0e50,
                    attack_max_mult: 5.1,
                    decay_slope: -1.0e50,
                    release_base: 0.00001)

  Instrument = instrument Waveform, Factory
end
