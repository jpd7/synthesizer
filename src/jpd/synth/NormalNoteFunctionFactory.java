package jpd.synth;

public final class NormalNoteFunctionFactory implements NoteFunctionFactory {

    private final double attackSlope;
    private final double attackMaxMultipleOfSustain;
    private final double decaySlope;
    private final double releaseBase;

    public NormalNoteFunctionFactory(double attackSlope,
            double attackMaxMultipleOfSustain,
            double decaySlope,
            double releaseBase) {
        this.attackSlope = attackSlope;
        this.attackMaxMultipleOfSustain = attackMaxMultipleOfSustain;
        this.decaySlope = decaySlope;
        this.releaseBase = releaseBase;
    }

    public Function noteFunction(final Function tone, final double noteLength) {
        double attackLength = attackMaxMultipleOfSustain / attackSlope;
        double decayLength = (1.0 - attackMaxMultipleOfSustain) / decaySlope;
        double releaseLength = Math.log(Util.ESSENTIALLY_ZERO)
                / Math.log(releaseBase);

        final double endAttack = attackLength;
        final double endDecay = endAttack + decayLength;
        final double endSustain = noteLength;
        final double endRelease = endSustain + releaseLength;

        return new Function(endSustain, endRelease) {
            public double call(double time) {
                double x = tone.call(time);
                if (time < endAttack) {
                    return x * attackSlope * time;
                } else if (time < endDecay) {
                    return x * (attackMaxMultipleOfSustain
                            + decaySlope * (time - endAttack));
                } else if (time < endSustain) {
                    return x;
                } else {
                    return x * Math.pow(releaseBase, time - endSustain);
                }
            }
        };
    }
}
