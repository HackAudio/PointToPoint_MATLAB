classdef BigMuffClipper < CircuitChain
    % Big Muff tone with a classic matched diode clipper
    
    methods
        function [o] = BigMuffClipper()
            
            % This is a "chain" of two different "circuit" types
            chain = {BigMuffToneStack,MatchedDiodeClipper};
            
            o.createChain(chain);
            
        end
        
    end
end