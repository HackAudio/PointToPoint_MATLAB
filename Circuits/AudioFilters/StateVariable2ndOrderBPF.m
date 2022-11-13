classdef StateVariable2ndOrderBPF < Circuit 
     
    methods
        function [o] =  StateVariable2ndOrderBPF 
            
            o.layout.numNodes = 9;
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(7,0);
            
            R1 = Resistor(10e3,1,2);
            R2 = Resistor(1e3,1,3);
            R3 = Resistor(10e3,4,7);
            R4 = Resistor(10e3,2,5);
            R5 = Resistor(10e3,2,9);
            o.layout.Rs = [R1; R2; R3; R4; R5];
            
            C1 = Capacitor(10.0e-9,6,7);
            C2 = Capacitor(10.0e-9,8,9);
            o.layout.Cs = [C1; C2];

            %cut off frequency pot 
            Vr1 = VariableResistor(32e3,1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                5,6);
            Vr2 = VariableResistor(32e3,1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                7,8);
            
            %Q (Bandwidth) pot
            Vr3 = VariableResistor(19e3,2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                3,4);
          
            
            o.layout.VarRs = [Vr1; Vr2; Vr3];
            
            
            OPA1 = OPAmp(4,2,5);
            OPA2 = OPAmp(0,6,7);
            OPA3 = OPAmp(0,8,9);
            o.layout.OPAmps = [OPA1; OPA2; OPA3];
            
            
            
            o.circuit = CircuitModel(o.layout);

        end
    end
end

