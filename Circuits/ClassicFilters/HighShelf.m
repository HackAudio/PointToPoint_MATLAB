classdef HighShelf  < Circuit  
    
    methods
        function [o] = HighShelf()
            
            o.layout.numNodes = 5;
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(5,0);
            
            R1 = Resistor(250000,1,4);  %dc point 
            R2 = Resistor(15000,3,0); %cut off freq
            R3 = Resistor(200000,3,4);  %range
            R4 = Resistor(250000,4,5);  %boost cut ratio
            
            o.layout.Rs = [R1; R2; R3; R4];
            
            C1 = Capacitor(47e-9,2,3);
            o.layout.Cs = [C1];
            
            %Boost/Cut 
            Vr1 = VariableResistor(50000,1,...    %spread of values
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                1,2);

            Vr2 = VariableResistor(50000,1,...  
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2,5);
            
            
            o.layout.VarRs = [Vr1 ; Vr2];
            
            
            OPA1 = OPAmp(0,4,5);
            o.layout.OPAmps = [OPA1];
            
            o.circuit = CircuitModel(o.layout);

        end
    end
end
