classdef PeakingFilter < Circuit  
    
   
    methods
        function [o] =  PeakingFilter()
            
            o.layout.numNodes = 9;
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(9,0);
            
            R1 = Resistor(25e3,1,8);
            R2 = Resistor(125,2,3); %125 - 2000  
            R3 = Resistor(1160,6,7);  %1160 -25e3   %bandwidth
            R4 = Resistor(20e3,6,8);   %boost/cut level
            R5 = Resistor(25e3,8,9);
          
            o.layout.Rs = [R1; R2; R3; R4; R5];
            
            C1 = Capacitor(2.5e-7,4,0);
            C2 = Capacitor(1e-7,5,6);
            o.layout.Cs = [C1; C2];
            
            %Boost/Cut 
            Vr1 = VariableResistor(1e3,1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                1,2);

            Vr2 = VariableResistor(1e3,1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2,7);
            
            Vr3 = VariableResistor(1875,2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                3,4);

            Vr4 = VariableResistor(24840,2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                7,0);
            
            
                
            o.layout.VarRs = [Vr1 ; Vr2; Vr3; Vr4];
            
            
            OPA1 = OPAmp(4,5,5);
            OPA2 = OPAmp(0,8,9);
           
            o.layout.OPAmps = [OPA1; OPA2];
            
            o.circuit = CircuitModel(o.layout);

        end
    end
end


