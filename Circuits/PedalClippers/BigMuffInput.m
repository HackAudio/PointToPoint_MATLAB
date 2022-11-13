classdef BigMuffInput < Circuit 
    % http://www.bigmuffpage.com/Big_Muff_Pi_versions_schematics_part1.html
    methods
        function [o] = BigMuffInput()
            
            o.layout.numNodes = 6;
            
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(4,0);
            voltage = 9; node = 6;
            o.layout.Vs = VoltageSource(voltage,node);
            
            R1 = Resistor(39e3,1,2);  % In->Cap
            R2 = Resistor(100e3,3,0);  % Base->Ground
            R3 = Resistor(470e3,3,4);  % Base->Collector
            R4 = Resistor(39e3,4,6);  % Collector->Vs
            R5 = Resistor(120,5,0);  % Emitter->Ground
            o.layout.Rs = [R1; R2; R3 ; R4; R5];
            
            C1 = Capacitor(1e-6,3,2); % Resistor->Base
            C2 = Capacitor(470e-12,3,4); % Base->Collector
            o.layout.Cs = [C1 ; C2]; 
            
            type = Semiconductor.SILICON; % Semiconductor.GERMANIUM;
            doping = Doping.NPN; 
            
            bjt1 = BJT(doping,type,3,4,5);
            
            % Options for modifying BJT (not necessary to include)
            %bjt1.setSaturationCurrent(1e-6);
            %bjt1.setEmissionCoeff(1.6);
            
            o.layout.BJTs = bjt1;
            
            o.layout.hasDCBlocker = true;
            
            o.circuit = CircuitModel(o.layout);
        end
    end
end