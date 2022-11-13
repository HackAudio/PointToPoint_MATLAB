classdef MarshallGuvnorPedal < CircuitChain
    
    methods
        function [o] =  MarshallGuvnorPedal()
            
            % This is a "chain" of two different "circuit" types
            chain = {GuvnorInput; GuvnorClipping; GuvnorTone; GuvnorOutput};  %params = [drive, bass control, mid control, treble control, output level]
            
            o.createChain(chain);
            
        end
        
    end
end

