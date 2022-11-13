classdef LPFClipper < CircuitChain
    
    methods
        function [o] = LPFClipper()
            
            % This is a "chain" of two different "circuit" types
            chain = {Passive1stOrderRCLPF,MatchedDiodeClipper};
            
            o.createChain(chain);
            
        end
        
    end
end