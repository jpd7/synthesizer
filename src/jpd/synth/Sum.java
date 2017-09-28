package jpd.synth;

public final class Sum extends CompositeScript {

    public Sum(Script... scripts) {
        super(scripts);
    }

    public Sum rotate() {
        Script[] rotatedScripts = new Script[scripts.length];
        for (int i = 0; i < rotatedScripts.length; i++) {
            rotatedScripts[i] = scripts[i].rotate();
        }
        return new Sum(rotatedScripts);
    }

    public Sum copy() {
        return new Sum(scripts.clone());
    }
}
