package jpd.synth;

public final class Util {

    public static final double ESSENTIALLY_ZERO = 0.001;

    public static double _sin(double time, double frequency) {
        return Math.sin(time * 2.0 * Math.PI * frequency);
    }

    public static Function sin(final double frequency, final double volume) {
        return new Function(Double.MAX_VALUE) {
            public double call(double time) {
                return volume * _sin(time, frequency);
            }
        };
    }

    public static double _sawtooth(double time, double frequency) {
        double slope = 2.0 * frequency;
        double period = 1.0 / frequency;
        double x = time % period;
        return slope * x - 1.0;
    }

    public static Function sawtooth(final double frequency, final double volume) {
        return new Function(Double.MAX_VALUE) {
            public double call(double time) {
                return volume * _sawtooth(time, frequency);
            }
        };
    }

    public static double _square(double time, double frequency) {
        double period = 1.0 / frequency;
        if (time % period < period / 2) {
            return 1;
        } else {
            return -1;
        }
    }

    public static Function square(final double frequency, final double volume) {
        return new Function(Double.MAX_VALUE) {
            public double call(double time) {
                return volume * _square(time, frequency);
            }
        };
    }

    public static double _indentedSquare(double time, double frequency, double indent) {
        final double period = 1.0 / frequency;
        switch ((int) (6 * (time % period) / period)) {
        case 0:
            return 1;
        case 1:
            return 1 - indent;
        case 2:
            return 1;
        case 3:
            return -1;
        case 4:
            return -1 + indent;
        default:
            return -1;
        }
    }

    public static Function indentedSquare(final double frequency, final double indent, final double volume) {
        return new Function(Double.MAX_VALUE) {
            public double call(double time) {
                return volume * _indentedSquare(time, frequency, indent);
            }
        };
    }

    public static double _rotatingWaveform(double time, double frequency) {
        final double period = 1.0 / frequency;
        final double totalPeriod = 3 * period;
        switch ((int) ((time % totalPeriod) / period)) {
        case 0:
            return _square(time, frequency);
        case 1:
            return _sin(time, frequency);
        default:
            return _sawtooth(time, frequency);
        }
    }

    public static Function rotatingWaveform(final double frequency, final double volume) {
        return new Function(Double.MAX_VALUE) {
            public double call(double time) {
                return volume * _rotatingWaveform(time, frequency);
            }
        };
    }

    public static Function triangle(final double frequency, final double volume) {
        final double period = 1.0 / frequency;
        final double halfperiod = period / 2.0;
        final double slope = 4.0 * frequency;
        return new Function(Double.MAX_VALUE) {
            public double call(double time) {
                double x = time % period;
                if (x < halfperiod) {
                    return volume * (1.0 - slope * x);
                } else {
                    x -= halfperiod;
                    return volume * (slope * x - 1.0);
                }
            }
        };
    }

    public static Function quadratic(final double frequency, final double volume) {
        final double period = 1.0 / frequency;
        final double quarterPeriod = period / 4.0;
        final double halfPeriod = period / 2.0;
        final double threeQuartersPeriod = period * 3.0 / 4.0;
        final double quarterPeriodSquared = quarterPeriod * quarterPeriod;
        return new Function(Double.MAX_VALUE) {
            public double call(double time) {
                double x = time % period;
                if (x < halfPeriod) {
                    x -= quarterPeriod;
                    return volume * (-(x * x) + quarterPeriodSquared)
                        / quarterPeriodSquared;
                } else {
                    x -= threeQuartersPeriod;
                    return volume * (x * x - quarterPeriodSquared)
                        / quarterPeriodSquared;
                }
            }
        };
    }

    public static Function tremolo(final Function f,
                                   final double frequency,
                                   final double proportion,
                                   final double timeOffset) {
        return new Function(f) {
            public double call(double time) {
                return f.call(time) * (1 + proportion
                                       * _sin(time + timeOffset,
                                              frequency));
            }
        };
    }

    public static Function vibrato(final Function f,
                                   final double frequency,
                                   final double proportion) {
        return new Function(f) {
            public double call(double time) {
                return f.call(time + proportion * _sin(time, frequency));
            }
        };
    }

    public static Function changeFrequency(final Function f, final double scale) {
        return new Function(f) {
            public double call(double time) {
                return f.call(time * scale);
            }
        };
    }

    public static Function changeVolume(final Function f, final double scale) {
        return new Function(f) {
            public double call(double time) {
                return f.call(time) * scale;
            }
        };
    }

    public static Function lowpass(final Function f,
                                   final int sampleCount,
                                   final double sampleTimeGap) {
        return new Function(f) {
            public double call(double time) {
                double total = 0;
                double start = time - (sampleCount - 1) * sampleTimeGap;
                for (int i = 0; i < sampleCount; i++) {
                    total += f.call(start + i * sampleTimeGap);
                }
                return total / sampleCount;
            }
        };
    }

    public static Function sum(final Function... functions) {
        double maxPartialLength = 0;
        for (Function f : functions) {
            if (f.partialLength > maxPartialLength) {
                maxPartialLength = f.partialLength;
            }
        }

        double maxTotalLength = 0;
        for (Function f : functions) {
            if (f.totalLength > maxTotalLength) {
                maxTotalLength = f.totalLength;
            }
        }

        return new Function(maxPartialLength, maxTotalLength) {
            public double call(double time) {
                double result = 0;
                for (Function f : functions) {
                    result += f.call(time);
                }
                return result;
            }
        };
    }

    public static Function pause(double length) {
        return new Function(length) {
            public double call(double time) {
                return 0;
            }
        };
    }

    public static Function seq(final Function... functions) {
        double totalLength = 0;
        for (Function f : functions) {
            totalLength += f.totalLength;
        }

        return new Function(totalLength) {
            double previousEndTime = 0;
            int i = 0;

            public double call(double time) {
                if (time > previousEndTime + functions[i].totalLength) {
                    previousEndTime += functions[i].totalLength;
                    i++;
                }
                return functions[i].call(time - previousEndTime);
            }
        };
    }

    static Function echo(final Function f,
                         final double delay,
                         final double echoVolume) {
        return new Function(f.totalLength + delay) {
            public double call(double time) {
                double result = 0;
                if (time < f.totalLength) {
                    result += f.call(time);
                }
                if (time > delay && time - delay < f.totalLength) {
                    result += f.call(time - delay) * echoVolume;
                }
                return result;
            }
        };
    }

    public static Function delay(final Function f, final double delay) {
        return new Function(f.totalLength + delay) {
            public double call(double time) {
                if (time > delay) {
                    return f.call(time - delay);
                } else {
                    return 0;
                }
            }
        };
    }

    public static final int OCTAVES = 9;
    public static final int NOTES_PER_OCTAVE = 12;
    public static final double[] COEFFICIENTS = new double[OCTAVES * NOTES_PER_OCTAVE];
    public static final double[] FREQUENCIES = new double[COEFFICIENTS.length];

    static {
        for (int i = 0; i < FREQUENCIES.length; i++) {
            double power = (double) (i - 4 * NOTES_PER_OCTAVE)
                / NOTES_PER_OCTAVE;
            COEFFICIENTS[i] = Math.pow(2.0, power);
            FREQUENCIES[i] = 440 * COEFFICIENTS[i];
        }
    }

    public static Function[] tones(Function waveform) {
        Function[] result = new Function[COEFFICIENTS.length];
        for (int i = 0; i < result.length; i++) {
            result[i] = changeFrequency(waveform, COEFFICIENTS[i]);
        }
        return result;
    }

    public static double noteLength(int duration, double wholeNoteLength) {
        return wholeNoteLength * duration / Generate.QUANTA_PER_WHOLE_NOTE;
    }
}
