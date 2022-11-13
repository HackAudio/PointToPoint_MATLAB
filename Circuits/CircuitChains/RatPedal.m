classdef RatPedal < CircuitChain
    
    methods
        function [o] =  RatPedal()
            
            % This is a "chain" of two different "circuit" types
            chain = {RatClipper,RatToneStack,RatOutput};  %params = [drive, bass control, mid control, treble control, output level]
            
            o.createChain(chain);
            
        end
        
    end
end

