classdef CircuitProcessor < handle
    % Generic base class for all Circuits and CircuitChains
    
    methods (Abstract)
        
        [output] = process(o,input,numSamples,numChannels)
        
        [buffer] = processInPlace(o,buffer,numSamples,numChannels)
        
        [y] = processSample(o,x,channel)
        
        prepare(o,sampleRate,bufferSize)
        
        setParameterUpdateIntervalInSamples(o,samples4Smooth)

        setSmoothResponseTimeMilliseconds(o,milliseconds)
        
        setParametersWithSmoothing(o,parameters)

        setParametersNoSmoothing(o,parameters)
    end
end