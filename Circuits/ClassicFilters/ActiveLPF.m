classdef ActiveLPF < Circuit 
    
    methods
        function [o] = ActiveLPF()
            
            o.layout.numNodes = 4;
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(4,0);
            R1 = Resistor(10000,3,0);
            o.layout.Rs = [R1];
            
            C1 = Capacitor(106e-9,2,0);
            o.layout.Cs = [C1];
            
            %cut off frequency pot
            Vr1 = VariableResistor(4700,1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                1,2);
            
            %gain pot
            Vr2 = VariableResistor(10e3,2,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                3,4);
            o.layout.VarRs = [Vr1 ; Vr2];
            
            o.layout.OPAmps = OPAmp(2,3,4);
            
            o.circuit = CircuitModel(o.layout);

        end
    end
end
