package jpd.synth;

import java.util.*;

public final class Instrument {

    private final Function[] tones;
    private final NoteFunctionFactory noteFunctionFactory;

    private final class SeqFunction extends Function {

        private static final double BINS_PER_WHOLE_NOTE = 10000;
        private final Function[] functions;
        private final double[] startTimes;
        private final double wholeNoteLength;
        private final int[][] lookup;

        SeqFunction(Function[] functions,
                double wholeNoteLength,
                double pauseBetweenNotes) {
            this.functions = functions;
            this.wholeNoteLength = wholeNoteLength;

            startTimes = new double[functions.length];
            double lastEndTime = -pauseBetweenNotes;
            for (int i = 0; i < functions.length; i++) {
                startTimes[i] = lastEndTime + pauseBetweenNotes;
                lastEndTime += pauseBetweenNotes + functions[i].partialLength;
            }

            int bins = (int) ((lastEndTime / wholeNoteLength + 5)
                    * BINS_PER_WHOLE_NOTE);
            lookup = new int[bins][];
            for (int i = 0; i < lookup.length; i++) {
                ArrayList<Integer> binArrayList = new ArrayList<>();
                for (int j = 0; j < startTimes.length; j++) {
                    double time = i * wholeNoteLength / BINS_PER_WHOLE_NOTE;
                    if (time > startTimes[j]
                            && time < startTimes[j] + functions[j].totalLength) {
                        binArrayList.add(j);
                    }
                }
                int[] binArray = new int[binArrayList.size()];
                for (int j = 0; j < binArray.length; j++) {
                    binArray[j] = binArrayList.get(j);
                }
                lookup[i] = binArray;
            }

            partialLength = lastEndTime;
            Function last = functions[functions.length - 1];
            totalLength = lastEndTime - last.partialLength + last.totalLength;
        }

        public double call(double time) {
            double result = 0;
            for (int i : lookup[(int) (time / wholeNoteLength
                    * BINS_PER_WHOLE_NOTE)]) {
                result += functions[i].call(time - startTimes[i]);
            }
            return result;
        }
    }

    public Instrument(Function waveform, NoteFunctionFactory noteFunctionFactory) {
        this.noteFunctionFactory = noteFunctionFactory;
        tones = Util.tones(waveform);
    }

    public Function play(Script script,
            double wholeNoteLength,
            double pauseBetweenNotes) {
        if (script instanceof Note) {
            Note note = (Note) script;
            Function tone = tones[note.toneIndex];
            double noteLength = Util.noteLength(note.duration, wholeNoteLength);
            return noteFunctionFactory.noteFunction(tone, noteLength);
        } else if (script instanceof Rest) {
            Rest rest = (Rest) script;
            double noteLength = Util.noteLength(rest.duration, wholeNoteLength);
            return new Function(noteLength) {
                public double call(double time) {
                    return 0;
                }
            };
        } else {
            CompositeScript compositeScript = (CompositeScript) script;
            Function[] functions = new Function[compositeScript.scripts.length];
            for (int i = 0; i < functions.length; i++) {
                functions[i] = play(compositeScript.scripts[i],
                        wholeNoteLength,
                        pauseBetweenNotes);
            }
            if (script instanceof Sum) {
                return Util.sum(functions);
            } else {
                return new SeqFunction(functions,
                        wholeNoteLength,
                        pauseBetweenNotes);
            }
        }
    }
}
