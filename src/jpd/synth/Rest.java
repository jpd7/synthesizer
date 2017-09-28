package jpd.synth;

public final class Rest implements Script {

    public final int duration;

    public Rest(int duration) {
        this.duration = duration;
    }

    public Rest copy() {
        return this;
    }

    public Rest rotate() {
        return this;
    }
}
