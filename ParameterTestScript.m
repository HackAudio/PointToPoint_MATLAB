%ParamerterTestCircuit.m
clear; clc; close all;

PointToPointIncludes; % adds all folders to path


% Circuit Examples
circuit = GuvnorInput;
% CircuitChain Examples

circuit =  GuvnorInput;

%circuit = LPFClipper; 
%circuit = LPFClipper2;

Fs = 48000; Ts = 1/Fs;
bufferSize = 0; % doesn't do anything yet
circuit.prepare(Fs,bufferSize);


%%%%%%% TYPES OF ANALYSES (Set as many as you want to "true")
waveform = true;
frequencyResponse = false;
thdPlot = false;
dcSweep = false;
%%%%%%%


% WAVEFORM
if (waveform)
    
    f = 200;
    numOfCycles = 3;

    durSec = numOfCycles / f;
    t = [0:Ts:durSec].';
    x = sin(2*pi*f*t);
    [numSamples,channels] = size(x);
    figure; hold on;
    
    t = [0:length(x)-1] * Ts;
    
    for resistorValue = 0:.1:1

        circuit.setParameters([resistorValue; 0.1]);

        for c = 1:channels
            [y] = circuit.process(x,numSamples,c);
        end
    
        plot(t,x,t,y);
        hold on;
    end
    hold off;
    set(gca,'FontSize',14);
    title('Waveform');
    xlabel('Time (sec.)');
    ylabel('Amplitude');
end

% FREQUENCY RESPONSE
if (frequencyResponse)
    
    x = [1;zeros(8191,1)];
    [numSamples,channels] = size(x);
    figure; 
    for resistorValue = 0:.1:1
        circuit.setParameters([resistorValue]);

        
        for c = 1:channels
            [y] = circuit.process(x,numSamples,c);
        end
        
        [H,W] = freqz(y,1,numSamples,Fs);
        Amp = 20*log10(abs(H));
        
        semilogx(W,Amp);
        hold on;
    end
    hold off;
    axis([20 20000 -20 20]);
    set(gca,'FontSize',14);
    title('Amplitude Reponse');
    xlabel('Freq. (Hz)');
    ylabel('Amplitude (dB)');
end

% THD 
if (thdPlot)
    f = 2000;
    numOfCycles = 200;
    durSec = numOfCycles / f;
    t = [0:Ts:durSec].';
    x = sin(2*pi*f*t);
    [numSamples,channels] = size(x);
   
    for resistorValue = 0:.1:1
        circuit.setParameters([1; resistorValue]);
        
        for c = 1:channels
            [y] = circuit.process(x,numSamples,c);
        end

        figure;
        thd(y,Fs);
    end
end
 
% DC SWEEP
if (dcSweep)
    
    minValue = -1;
    maxValue = 1;
    stepSize = 0.01;
    
    x = [ minValue : stepSize : maxValue ].';
    [numSamples,channels] = size(x);
    
    figure;
    for resistorValue = 0:.1:1
        %circuit.setParameters([resistorValue; 0.6; 0.7; 0.9; 0.8]);
        for c = 1:channels
            [y] = circuit.process(x,numSamples,c);
        end
        
        plot(x,x,x,y); 
        hold on;
    end
    hold off;
    set(gca,'FontSize',14);
    title('DC Sweep');
    xlabel('Input Amplitude');
    ylabel('Output Amplitude');
end
