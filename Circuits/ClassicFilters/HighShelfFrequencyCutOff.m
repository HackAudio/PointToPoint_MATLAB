classdef HighShelfFrequencyCutOff  < Circuit  
  
    methods
        function [o] =  HighShelfFrequencyCutOff()
            
            o.layout.numNodes = 5;
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(5,0);
            
            R1 = Resistor(250000,1,4);
            R2 = Resistor(60000,3,4); 
            R3 = Resistor(250000,4,5);
            
            o.layout.Rs = [R1; R2; R3];
            
            C1 = Capacitor(130e-9,2,3);
            o.layout.Cs = [C1];
            
            %Boost/Cut 
            Vr1 = VariableResistor(500,1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                1,2);

            Vr2 = VariableResistor(500,1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2,5);
            
            %Frequency cut off
            Vr3 = VariableResistor(200000,2,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LOG,...
                3,0);
            
            
            o.layout.VarRs = [Vr1 ; Vr2; Vr3];
            
            OPA1 = OPAmp(0,4,5);
            o.layout.OPAmps = [OPA1];
            
            o.circuit = CircuitModel(o.layout);

        end
    end
end
