package jpd.synth;

public final class Note implements Script {

    public final int toneIndex;
    public final int duration;

    public Note(int toneIndex, int duration) {
        this.toneIndex = toneIndex;
        this.duration = duration;
    }

    public Note copy() {
        return this;
    }

    public Note rotate() {
        return new Note(39 * 2 - toneIndex, duration);
    }
}
