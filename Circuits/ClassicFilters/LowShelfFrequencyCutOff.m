classdef LowShelfFrequencyCutOff  < Circuit  
  
    methods
        function [o] =  LowShelfFrequencyCutOff()
            
            o.layout.numNodes = 5;
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(5,0);
            
            R1 = Resistor(25000,1,4);
            R2 = Resistor(8400,2,3); 
            R3 = Resistor(25000,4,5);
            
            o.layout.Rs = [R1; R2; R3];
            
            C1 = Capacitor(47e-7,3,0);
            o.layout.Cs = [C1];
            
            %Boost/Cut 
            Vr1 = VariableResistor(30000,1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                1,2);

            Vr2 = VariableResistor(30000,1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2,5);
            
            %Frequency cut off
            Vr3 = VariableResistor(2000,2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LOG,...
                3,4);
            
            
            o.layout.VarRs = [Vr1 ; Vr2; Vr3];
            
            OPA1 = OPAmp(0,4,5);
            o.layout.OPAmps = [OPA1];
            
            o.circuit = CircuitModel(o.layout);

        end
    end
end
