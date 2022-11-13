classdef LPFClipper2 < CircuitChain
    
    methods
        function [o] = LPFClipper2()
            
            % This is a "chain" of a "CircuitChain" with a "Circuit"
            chain = {LPFClipper,Passive1stOrderRCLPF};
            
            o.createChain(chain);
            
        end
        
    end
end