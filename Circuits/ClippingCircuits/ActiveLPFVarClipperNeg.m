classdef ActiveLPFVarClipperNeg < Circuit 
    methods
        function [o] = ActiveLPFVarClipperNeg()
            o.layout.numNodes = 5;
            
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(5,0);
            
            R1 = Resistor(1e3,1,2); % 50e3-100e3 ?
            % Magnitude of gain = R3/R2
            % E-T has R2 = 1e3, R3 = 9.1e3
            R2 = Resistor(500e3,4,0);
            R3 = Resistor(25e3,4,5);
%             R2 = Resistor(1e3 ,3,0);
%             R3 = Resistor(9.1e3,3,4);
            o.layout.Rs = [R1;R2;R3];

            Vr1 = VariableResistor(1e6,1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2,3);
            o.layout.VarRs = Vr1;

            % E-T has 100e-9 -- good value
            C1 = Capacitor(1e-9,3,0);
            o.layout.Cs = C1;
            
            OPA1 = OPAmp(3,4,5);
            o.layout.OPAmps = [OPA1];

            % Can flip polarity or make it a paired diode
            D1 = Diode(Semiconductor.SILICON,Configuration.SINGLE,0,3);
            o.layout.Ds = [D1];
            
            o.circuit = CircuitModel(o.layout);
        end
    end
end