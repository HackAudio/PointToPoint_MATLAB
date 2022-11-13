classdef StateVariable2ndOrderNFDepth < Circuit 
     
    methods
        function [o] =  StateVariable2ndOrderNFDepth
            
            o.layout.numNodes = 12;
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(11,0);
            
            R1 = Resistor(10e3,1,2);
            R2 = Resistor(1e3,1,3);
            R3 = Resistor(10e3,4,7);
            R4 = Resistor(10e3,2,5);
            R5 = Resistor(10e3,2,9);
            R6 = Resistor(10e3,5,10);
            R7 = Resistor(10e3,9,10);
            R8 = Resistor(10e3,10,11);
            R9 = Resistor(18e3,1,12);
            o.layout.Rs = [R1; R2; R3; R4; R5; R6; R7; R8; R9];
            
            C1 = Capacitor(10.0e-9,6,7);
            C2 = Capacitor(10.0e-9,8,9);
            o.layout.Cs = [C1; C2];


            %Frequency of notch
            Vr1 = VariableResistor(32e3,1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                5,6);
            Vr2 = VariableResistor(32e3,1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                7,8);
            
            %gain
            Vr3 = VariableResistor(19e3,2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                3,4);
            
            %notch depth
            Vr4 = VariableResistor(482e3,3,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                10,12);
          
            
            o.layout.VarRs = [Vr1; Vr2; Vr3; Vr4];
            
            
            OPA1 = OPAmp(4,2,5);
            OPA2 = OPAmp(0,6,7);
            OPA3 = OPAmp(0,8,9);
            OPA4 = OPAmp(0,10,11);
            o.layout.OPAmps = [OPA1; OPA2; OPA3; OPA4];
            
            
            o.circuit = CircuitModel(o.layout);

        end
    end
end
