package jpd.synth;

abstract class CompositeScript implements Script {
    final Script[] scripts;

    CompositeScript(Script[] scripts) {
        this.scripts = scripts;
    }

    CompositeScript reverse() {
        CompositeScript result = (CompositeScript) copy();
        for (int i = 0; i < result.scripts.length; i++) {
            if (result.scripts[i] instanceof CompositeScript) {
                CompositeScript x = (CompositeScript) result.scripts[i];
                x.reverse();
            }
        }
        for (int a = 0; a < result.scripts.length / 2; a++) {
            int b = result.scripts.length - a - 1;
            Script tmp = result.scripts[a];
            result.scripts[a] = result.scripts[b];
            result.scripts[b] = tmp;
        }
        return result;
    }
}
