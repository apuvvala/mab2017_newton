%% Testing Downshift Points of a Transmission Controller
%
% Test a transmission controller using a test harness and test sequence. 
% Copyright 2015 The MathWorks, Inc.

%%
% This example shows how to create a test harness to test the downshift
% points of a transmission controller. Simulate the model and observe the
% output of the component under test.
%
model = 'sltestTestSequenceExample';
open_system(model);
sim(model);

%%
% Open the test harness attached to the |shift_controller| subsystem, and
% open the Test Sequence block that supplies the test case to the component
% under test.
sltest.harness.open([model '/shift_controller'], 'controller_harness');
open_system('controller_harness/Test Sequence');

%%
% The Test Sequence block exercises the controller's downshift points in
% all four gears. 
% 
% <<sltestTestSequenceExample_TSB.png>>

%%
% Simulate the test harness to observe the controller output.

open_system('controller_harness/Floating Scope');
sim('controller_harness');

%% 
% Close the test harness.
sltest.harness.close([model '/shift_controller'], 'controller_harness');

%% 
% Close the model.
close_system(model, 0);

%%
clear model;


displayEndOfDemoMessage(mfilename)
