%% Using Waveform Generation Functions
%
% Use waveforms to test a component under test. Copyright 2015 The MathWorks, Inc.

%%
% This example shows how to create common output functions using 
% the Test Sequence Block. The example also demonstrates concatenating 
% these waveforms. For more information see
% <matlab:helpview(fullfile(docroot,'sltest','ug','define-function-based-signal-outputs.html'))
% Generate Function-Based Test Signals>.

%%
%
mdl = 'sltestTestSequenceSignalGenerationExample';
open_system(mdl);
open_system([mdl,'/Test Sequence']);

%%
%
% <<sltestTestSequenceSignalGenerationDemo_TSB.png>>

%%
% Simulate the model to view the signal output.
open_system([mdl,'/Scope']);
sim(mdl);

%% 
% Close the model.
close_system(mdl, 0);

%%
clear mdl;

displayEndOfDemoMessage(mfilename)
