classdef BigMuffPedal < CircuitChain
    
    methods
        function [o] = BigMuffPedal()
            
            % This is a "chain" of two different "circuit" types
            chain = {BigMuffInput,BigMuffClipper,BigMuffToneStack,BigMuffOutput};
            
            o.createChain(chain);
            
        end
        
    end
end