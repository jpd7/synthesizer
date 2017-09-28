package jpd.synth;

public abstract class Function {

    double partialLength;
    double totalLength;

    public Function(double length) {
        this.partialLength = length;
        this.totalLength = length;
    }

    public Function(double partialLength, double totalLength) {
        this.partialLength = partialLength;
        this.totalLength = totalLength;
    }

    public Function(Function f) {
        this.partialLength = f.partialLength;
        this.totalLength = f.totalLength;
    }

    public Function() {
    }

    public abstract double call(double time);
}
