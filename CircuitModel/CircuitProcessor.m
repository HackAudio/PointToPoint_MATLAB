classdef CircuitProcessor < handle
    % Generic base class for all Circuits and CircuitChains
    
    methods (Abstract)
        
        [output] = process(o,input,numSamples,numChannels)
        
        [buffer] = processInPlace(o,buffer,numSamples,numChannels)
        
        [y] = processSample(o,x,channel)
        
        prepare(o,sampleRate,bufferSize)
        
        setSamples4Smooth(o,samples4Smooth)
        
        setParameters(o,parameters)
    end
end