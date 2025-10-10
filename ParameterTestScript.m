%ParamerterTestCircuit.m
clear; clc; close all;

PointToPointIncludes; % adds all folders to path


% Circuit Example 
circuit = Sallen_Key_A_Low_Pass; 
% Note: Sallen_Key_A_Low_Pass has "1" parameter

% CircuitChain Examples
%circuit =  MarshallGuvnorPedalChain;
% Note: MarshallGuvnorPedalChain is made of 4 circuits
% Ma_G_Input -> Ma_G_Drive -> Ma_G_Tone -> Ma_G_Output
% Input  has "1" parameter (#1 in array)
% Drive  has "0" parameters
% Tone   has "3" parameters (2-4 in array)
% Output has "1" parameter (#5 in array)
 
Fs = 48000; Ts = 1/Fs;
bufferSize = 0; % doesn't do anything yet
circuit.prepare(Fs,bufferSize);


%%%%%%% TYPES OF ANALYSES (Set as many as you want to "true")
waveform = false;
frequencyResponse = false;
thdPlot = false;
dcSweep = false;
%%%%%%%


% WAVEFORM
if (waveform)
    
    f = 200;
    numOfCycles = 15;

    durSec = numOfCycles / f;
    t = [0:Ts:durSec].';
    x = sin(2*pi*f*t);
    [numSamples,channels] = size(x);
    figure; hold on;
    
    t = [0:length(x)-1] * Ts;
    
    for resistorValue = 0:.1:1

        circuit.setParametersNoSmoothing([resistorValue; 1; 1; 1 ; 1]);

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
        circuit.setParametersNoSmoothing([resistorValue]);

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
        circuit.setParametersNoSmoothing([resistorValue ; 0.5 ; 0.5 ; 0.5 ; 0.5]);
        
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
        circuit.setParametersNoSmoothing([resistorValue; 1; 1; 1; 1]);
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
