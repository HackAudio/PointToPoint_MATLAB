classdef StateVariable1stOrderHPF_NoPot < Circuit 
    
    methods
        function [o] =  StateVariable1stOrderHPF_NoPot 
            
            o.layout.numNodes = 7;
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(4,0);
            
            R1 = Resistor(10e3,1,2);
            R2 = Resistor(10e3,0,3);
            R3 = Resistor(10e3,3,4);
            R4 = Resistor(10e3,2,7);
            R5 = Resistor(1e3,4,5);
            o.layout.Rs = [R1; R2; R3; R4; R5];
            
            C1 = Capacitor(100.0e-9,6,7);
            o.layout.Cs = [C1];

            
            Vr1 = VariableResistor(10e3,1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                5,6);
            o.layout.VarRs = [Vr1];
            
            OPA1 = OPAmp(2,3,4);
            OPA2 = OPAmp(0,6,7);
            o.layout.OPAmps = [OPA1; OPA2];
            
            
            
            o.circuit = CircuitModel(o.layout);

        end
    end
end
