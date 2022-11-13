classdef ActiveBPFVarClipperNeg < Circuit 
    % Active BPF clipper with variable resistors
    methods
        function [o] = ActiveBPFVarClipperNeg()
            o.layout.numNodes = 7;
            
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(7,0);
            % E-T has R1=10k;R2=10k;R3=5.5k;R4=10k
            % Gain amplitude = R3/R2
            
            % R1=100k ; R2=20k ; R3=25k ;c R4=10k
            R1 = Resistor(700,2,0); % low cut off
            R2 = Resistor(10e3,4,0);
            R3 = Resistor(10e3,4,5);
            R4 = Resistor(700,5,6); % high cut-off
            o.layout.Rs = [R1;R2;R3;R4];
            
            % Higher R = lower frequency
            % High freq Pot
            Vr1 = VariableResistor(15e3,1,...
                VariableResistorDirection.INVPROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                3,0);

            % Low freq pot
            Vr2 = VariableResistor(15e3,2,...
                VariableResistorDirection.PROPORTIONAL,...
                VariableResistorSkew.LINEAR,...
                6,7);

            o.layout.VarRs = [Vr1 ; Vr2];

            % E-T has C1=0.1e-6;C2=0.1e-6
            % E-T says to make C1 = C2
            C1 = Capacitor(.1e-6,1,2);
            C2 = Capacitor(.1e-6,7,0);
            o.layout.Cs = [C1;C2];
            
            OPA1 = OPAmp(2,4,5);
            o.layout.OPAmps = [OPA1];

            % Can add the diode at 2,0 and 5,0
            % I like the 5,0 clipping more -Dan
            D1 = Diode(Semiconductor.SILICON,Configuration.SINGLE,0,7);
            o.layout.Ds = [D1];
            
            o.circuit = CircuitModel(o.layout);
        end
    end
end