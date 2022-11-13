classdef Active2ndOrderLPF < Circuit 
    
    methods
        function [o] = Active2ndOrderLPF()
            
            o.layout.numNodes = 4;
            
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(4,0);
            R = Resistor(10e3,1,2);
            o.layout.Rs = R;
            
            %Cut Off Frequency
            Vr1 = VariableResistor(10e3,1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2,3);
            
            o.layout.VarRs = [Vr1];
            
            C1 = Capacitor(10e-9,2,4);
            C2 = Capacitor(10e-9,3,0);
            o.layout.Cs = [C1 ; C2];
            
            o.layout.OPAmps = OPAmp(3,4,4);
            
            o.circuit = CircuitModel(o.layout);
        end
    end
end