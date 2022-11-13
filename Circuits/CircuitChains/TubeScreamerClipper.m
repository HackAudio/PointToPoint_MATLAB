classdef TubeScreamerClipper < CircuitChain
    
    methods
        function [o] = TubeScreamerClipper()
            
            % This is a "chain" of two different "circuit" types
            chain = {TubeScreamerToneStack,MatchedDiodeClipper};
            
            o.createChain(chain);
            
        end
        
    end
end