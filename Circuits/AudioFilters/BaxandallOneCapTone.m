classdef BaxandallOneCapTone < Circuit 
    
    methods
        function [o] = BaxandallOneCapTone 
            
            o.layout.numNodes = 8;
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(5,0);
            
            R1 = Resistor(1800,1,2);
            R2 = Resistor(1800,4,5);
            R3 = Resistor(22000,3,8);
            R4 = Resistor(9100,7,8);
            o.layout.Rs = [R1; R2; R3; R4];
            
            C1 = Capacitor(100.0e-9,2,4);
            C2 = Capacitor(4.7e-9,7,6);
            C3 = Capacitor(22.0e-12,8,5);
            o.layout.Cs = [C1; C2; C3];
            
            %Bass Pot
            Vr1 = VariableResistor(10000,1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                3,4);
            Vr2 = VariableResistor(10000,1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2,3);
            
            %Treble Pot
            Vr3 = VariableResistor(10000,2,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                6,5);
            Vr4 = VariableResistor(10000,2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                1,6);
           
            
            o.layout.VarRs = [Vr1 ; Vr2; Vr3; Vr4];
            
            
            OPA1 = OPAmp(0,8,5);
            o.layout.OPAmps = [OPA1];
            
            o.circuit = CircuitModel(o.layout);

        end
    end
end