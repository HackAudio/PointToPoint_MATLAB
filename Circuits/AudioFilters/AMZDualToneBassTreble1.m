classdef AMZDualToneBassTreble1 < Circuit 
    
    methods
        function [o] =  AMZDualToneBassTreble1 
            
            o.layout.numNodes = 6;
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(4,0);
            
            R1 = Resistor(47e3,3,4);
            R2 = Resistor(47e3,5,4);
            R3 = Resistor(39e3,1,2);
            o.layout.Rs = [R1; R2; R3];
            
            C1 = Capacitor(0.01e-6,2,0);
            C2 = Capacitor(3900.0e-12,1,6);
            o.layout.Cs = [C1;C2];

            
            %Bass pot
            Vr1 = VariableResistor(100000,1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2,3);
            Vr2 = VariableResistor(100000,1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                3,0);
            
            %Treble pot
            Vr3 = VariableResistor(25000,2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                6,5);
            Vr4 = VariableResistor(25000,2,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                5,0);
            
           
            
            o.layout.VarRs = [Vr1 ; Vr2; Vr3; Vr4];
            
            o.circuit = CircuitModel(o.layout);

        end
    end
end

