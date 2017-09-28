package jpd.synth;

public final class Seq extends CompositeScript {

    public Seq(Script... scripts) {
        super(scripts);
    }

    public Seq rotate() {
        Script[] rotatedScripts = new Script[scripts.length];
        for (int i = 0; i < rotatedScripts.length; i++) {
            rotatedScripts[i] = scripts[scripts.length - i - 1].rotate();
        }
        return new Seq(rotatedScripts);
    }

    public Seq copy() {
        return new Seq(scripts.clone());
    }
}
