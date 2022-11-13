classdef CircuitLayout
    properties 
        numNodes = 0;
        Vin;
        Vout;
        Vs;
        Rs;
        VarRs;
        Cs;
        OPAmps;
        Ds;
        BJTs;
        Tube12AX7s;
        hasDCBlocker = false;
    end
    
    methods
        function [o] = CircuitLayout()
            o.Vin = VoltageInput(1,0);
            o.Vout = VoltageOutput(2,0);
            o.Vs = [];
            o.Rs = [];
            o.VarRs = [];
            o.Cs = [];
            o.OPAmps = [];
            o.Ds = [];
            o.BJTs = [];
            o.Tube12AX7s = [];
        end
    end
    
    
end