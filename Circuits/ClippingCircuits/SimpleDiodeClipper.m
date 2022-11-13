classdef SimpleDiodeClipper < Circuit 
    
    methods
        function [o] = SimpleDiodeClipper()
            
            o.layout.numNodes = 2;
            
            o.layout.Vin = VoltageInput(1,0);
            o.layout.Vout = VoltageOutput(2,0);
            R = Resistor(10e3,1,2);
            o.layout.Rs = R;
            
            D1 = Diode(Semiconductor.SILICON,Configuration.SINGLE,2,0);
            D2 = Diode(Semiconductor.SILICON,Configuration.SINGLE,0,2);

            o.layout.Ds = [D1 ; D2];
            
            o.circuit = CircuitModel(o.layout);
        end
    end
end