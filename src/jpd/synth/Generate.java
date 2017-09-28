package jpd.synth;

import java.io.*;

public class Generate {

    public static int sample_rate = 44100;
    public static final short SAMPLE_COEFFICIENT = (short) 0x09FF;
    public static final int QUANTA_PER_WHOLE_NOTE = 1024 * 1024;
    public static final int BYTES_IN_WAV_HEADER = 44;

    public static byte[] sample(Function f) {
        int sampleCount = (int) (f.totalLength * sample_rate);
        byte[] wav = new byte[BYTES_IN_WAV_HEADER + sampleCount * 2];

        writeString(wav, 0, "RIFF");
        writeFourBytes(wav, 4, 36 + sampleCount * 2);
        writeString(wav, 8, "WAVE");

        writeString(wav, 12, "fmt ");
        writeFourBytes(wav, 16, 16);
        writeTwoBytes(wav, 20, 1);
        writeTwoBytes(wav, 22, 1);
        writeFourBytes(wav, 24, sample_rate);
        writeFourBytes(wav, 28, sample_rate * 2);
        writeTwoBytes(wav, 32, 2);
        writeTwoBytes(wav, 34, 16);

        writeString(wav, 36, "data");
        writeFourBytes(wav, 40, sampleCount * 2);

        for (int i = 0; i < sampleCount; i++) {
            short sample = (short) (SAMPLE_COEFFICIENT
                    * f.call((double) i / sample_rate));
            wav[BYTES_IN_WAV_HEADER + 2 * i] = (byte) (sample & 0xFF);
            wav[BYTES_IN_WAV_HEADER + 2 * i + 1] = (byte) (sample >>> 8);
        }
        return wav;
    }

    private static void writeString(byte[] out, int i, String str) {
        for (int j = 0; j < str.length(); j++) {
            out[i + j] = (byte) (str.charAt(j) & 0xFF);
        }
    }

    private static void writeTwoBytes(byte[] out, int i, int x) {
        out[i] = (byte) (x & 0xFF);
        out[i + 1] = (byte) ((x >>> 8) & 0xFF);
    }

    private static void writeFourBytes(byte[] out, int i, int x) {
        out[i] = (byte) (x & 0xFF);
        out[i + 1] = (byte) ((x >>> 8) & 0xFF);
        out[i + 2] = (byte) ((x >>> 16) & 0xFF);
        out[i + 3] = (byte) (x >>> 24);
    }

    public static void save(String fileName, Function f) {
        byte[] wav = sample(f);
        try (BufferedOutputStream out
                = new BufferedOutputStream(new FileOutputStream(fileName))) {
            out.write(wav, 0, wav.length);
        } catch (IOException e) {
            System.err.println("Error writing to file " + fileName + ":");
            e.printStackTrace(System.err);
            System.exit(1);
        }
    }
}
