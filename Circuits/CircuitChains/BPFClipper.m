classdef BPFClipper < CircuitChain
    
    methods
        function [o] = BPFClipper()
            
            % This is a "chain" of two different "circuit" types
            chain = {PassiveBPF,MatchedDiodeClipper};
            
            o.createChain(chain);
            
        end
        
    end
end