classdef Gain30 < Circuit 
    %Doesnt look like 30 db of gain 
    methods
        function [o] = Gain30()
            
            o.layout.numNodes = 6;
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(4,0);
            
            R1 = Resistor(47000,2,0);
            R2 = Resistor(160.0,6,0);
            R3 = Resistor(1000,3,4);
            o.layout.Rs = [R1; R2; R3];
            
            C1 = Capacitor(10.0e-6,1,2);
            C2 = Capacitor(220.0e-6,5,6);
            o.layout.Cs = [C1; C2];
            
            %Gain Pot
            Vr1 = VariableResistor(5000,1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                3,5);
           
            o.layout.VarRs = [Vr1];
            
            OPA1 = OPAmp(2,3,4);
            o.layout.OPAmps = [OPA1];
            
            o.circuit = CircuitModel(o.layout);

        end
    end
end

