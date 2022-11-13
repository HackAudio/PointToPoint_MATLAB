classdef ActiveBPF < Circuit 
    
    methods
        function [o] = ActiveBPF()
            
            o.layout.numNodes = 5;
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(5,0);
            R1 = Resistor(10000.0,3,0);
            o.layout.Rs = [R1];
            
            C1 = Capacitor(100e-9,1,2);
            C2 = Capacitor(106e-9,5,0);
            o.layout.Cs = [C1; C2];
            
            %low pass cut off frequency pot
            Vr1 = VariableResistor(16e3,1,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                2,0);
            
            %high pass cutt off frequency pot
            Vr2 = VariableResistor(4700,2,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                4,5);
            
            %gain pot
            Vr3 = VariableResistor(10e3,3,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                3,4);
            o.layout.VarRs = [Vr1 ; Vr2; Vr3];
            
            o.layout.OPAmps = OPAmp(2,3,4);
            
            o.circuit = CircuitModel(o.layout);

        end
    end
end

