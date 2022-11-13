classdef TubeScreamerInput < Circuit 
    
    methods
        function [o] = TubeScreamerInput()
            
            o.layout.numNodes = 6;
            
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(5,0);
            voltage = 9; node = 4;
            Vs1 = VoltageSource(voltage,node);
            Vs2 = VoltageSource(4.5, 6);
            o.layout.Vs = [Vs1;Vs2];
            
            R1 = Resistor(1e3,2,3);  % Capacitor->Base
            R2 = Resistor(510e3,3,6);  % Collector->Vs
            R3 = Resistor(10e3,5,0);  % Emitter->Ground
            o.layout.Rs = [R1; R2; R3 ];
            
            C1 = Capacitor(.02e-6,1,2);
            o.layout.Cs = C1; % In->Base
            
            type = Semiconductor.SILICON; % Semiconductor.GERMANIUM;
            doping = Doping.NPN; 
            
            bjt1 = BJT(doping,type,3,4,5);
            
            % Options for modifying BJT (not necessary to include)
            %bjt1.setSaturationCurrent(10e-9);
            %bjt1.setEmissionCoeff(1.6);
            
            o.layout.BJTs = bjt1;
            
            o.layout.hasDCBlocker = true;
            
            o.circuit = CircuitModel(o.layout);
        end
    end
end