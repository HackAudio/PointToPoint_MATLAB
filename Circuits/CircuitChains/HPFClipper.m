classdef HPFClipper < CircuitChain
    
    methods
        function [o] = HPFClipper()
            
            % This is a "chain" of two different "circuit" types
            chain = {Passive1stOrderRCHPF,MatchedDiodeClipper};
            
            o.createChain(chain);
            
        end
        
    end
end