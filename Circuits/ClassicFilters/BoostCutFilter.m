classdef BoostCutFilter  < Circuit  
    
   
    methods
        function [o] =  BoostCutFilter()
            
            o.layout.numNodes = 7;
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(7,0);
            
            R1 = Resistor(25e3,1,6);
            %R2 = Resistor(125,2,3); %125 - 2000  
            %R3 = Resistor(1162,5,0);  %1160 -25e3   %bandwidth
            R4 = Resistor(10e3,5,6);   %boost/cut level
            R5 = Resistor(25e3,6,7);
          
            o.layout.Rs = [R1; R4; R5];
            
            C1 = Capacitor(3.5e-7,3,0);
            C2 = Capacitor(3.5e-7,4,5);
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
            
            Vr3 = VariableResistor(500,2,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2,3);

            Vr4 = VariableResistor(5e3,2,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                5,0);
            
                
            o.layout.VarRs = [Vr1 ; Vr2; Vr3; Vr4];
            
            
            OPA1 = OPAmp(3,4,4);
            OPA2 = OPAmp(0,6,7);
           
            o.layout.OPAmps = [OPA1; OPA2];
            
            o.circuit = CircuitModel(o.layout);

        end
    end
end


