classdef Circuit < CircuitProcessor
    % Generic base class for all Circuits
    
    properties
        layout;
        circuit;
    end
    
    methods
        function [o] = Circuit()
            o.layout = CircuitLayout;
        end
        
        function [output] = process(o,input,numSamples,numChannels)
            output = o.circuit.process(input,numSamples,numChannels);
        end
        
        function [buffer] = processInPlace(o,buffer,numSamples,numChannels)
            buffer = o.circuit.processInPlace(buffer,numSamples,numChannels);
        end
        
        function [y] = processSample(o,x,channel)
            y = o.circuit.processSample(x,channel);
        end
        
        function prepare(o,sampleRate,bufferSize)
            o.circuit.prepare(sampleRate,bufferSize);
        end
        
        function setParameterUpdateIntervalInSamples(o,samples4Smooth)
            o.circuit.setParameterUpdateIntervalInSamples(samples4Smooth);
        end
        
        function setSmoothResponseTimeMilliseconds(o,milliseconds)
            o.circuit.setSmoothResponseTimeMilliseconds(milliseconds);
        end

        function [remainingParameters] = setParametersWithSmoothing(o,parameters)
            remainingParameters = o.circuit.setParametersWithSmoothing(parameters);
        end

        function [remainingParameters] = setParametersNoSmoothing(o,parameters)
            remainingParameters = o.circuit.setParametersNoSmoothing(parameters);
        end
    end
end