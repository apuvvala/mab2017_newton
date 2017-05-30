%% Using When Decomposition to Write Tests
%
% Assess a model using a When decomposition sequence. 
% Copyright 2015 The MathWorks, Inc.

%%
% This example shows how to use When decomposition in a Test Sequence
% block to author assessments in a test harness. The example model
% implements a simple signal tracker that operates in three modes:
% off (0), slow (1) and quick (2). Simulate the model and observe the
% output and error of the signal tracker.
%
mdl = 'sltestTestSequenceWhenExample';
open_system(mdl);
open_system([mdl '/Scope']);
sim(mdl);

%%
% Open the test harness attached to the |SimpleTracker| subsystem, and
% open the Test Sequence block named |Test Assessment| that assesses
% the behavior of |SimpleTracker|.
%
% The Test Sequence block uses When decomposition to determine the
% appropriate assertions to run depending on the |SimpleTracker| mode.
% The |CheckError| step is a When decomposition step, and it has three
% substeps, |OffMode|, |SlowMode|, and |QuickMode| that are active when
% mode is *0*, *1* or *otherwise*, respectively.

open_system(mdl);
sltest.harness.open([mdl '/SimpleTracker'],'SimpleTrackerHarness');
open_system('SimpleTrackerHarness/Test Assessment');

%%
%
% <<sltestTestSequenceUsingWhenAssessment.png>>

%%
% Simulate the test harness to run the assessments.
open_system('SimpleTrackerHarness/Scope');
sim('SimpleTrackerHarness');

%%
% Close the test harness and main model.
close_system(mdl, 0);

%%
clear mdl;

displayEndOfDemoMessage(mfilename)
