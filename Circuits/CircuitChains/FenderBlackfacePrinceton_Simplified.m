classdef FenderBlackfacePrinceton_Simplified < CircuitChain
    
    methods
        function [o] =  FenderBlackfacePrinceton_Simplified()
            
            % This is a "chain" of two different "circuit" types
            chain = {FenderBlackfaceInput; FenderPrincetonToneStack};  %params = [Volume, bass control, treble control]
            
            o.createChain(chain);
            
        end
    end
end