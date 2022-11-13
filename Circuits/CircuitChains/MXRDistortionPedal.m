classdef MXRDistortionPedal < CircuitChain
    
    methods
        function [o] =  MXRDistortionPedal()
            
            % This is a "chain" of two different "circuit" types
            chain = {MXRopamp, MXRclipping};  %params = [drive, bass control, mid control, treble control, output level]
            
            o.createChain(chain);
            
        end
        
    end
end

