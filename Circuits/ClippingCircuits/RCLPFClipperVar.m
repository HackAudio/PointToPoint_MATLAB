classdef RCLPFClipperVar < Circuit 
    % RC LPF Clipper with variable resistor
    methods
        function [o] = RCLPFClipperVar()
            o.layout.numNodes = 3;
            
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(3,0);
            R = Resistor(1e3,1,2);
            o.layout.Rs = R;

            Vr1 = VariableResistor(2e6,1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2,3);
            o.layout.VarRs = Vr1;

            C = Capacitor(1e-9,3,0);
            o.layout.Cs = C;
            
            D1 = Diode(Semiconductor.SILICON,Configuration.MATCHEDPAIR,3,0);
            o.layout.Ds = [D1];
            
            o.circuit = CircuitModel(o.layout);
        end
    end
end