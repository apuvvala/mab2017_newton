%% Creating Baseline Tests
%
% Verify simulation result against a baseline dataset created from a model. 
% Copyright 2015 The MathWorks, Inc.

%%
% This example shows you how to create baselines tests for a model.  
% The example uses the model |sltestBaselineBasicExample| to generate a baseline dataset  
% of expected results by simulating the model. The baseline test case checks that the simulation 
% results produce the same output as the baseline dataset, which determines the pass/fail
% criteria of the test case.  
%

%% Open the Model and Test Manager
% Open the model.
mdl = 'sltestBaselineBasicExample';
open_system(mdl);

%%
% From the model, select *Analysis > Test Manager* to open the Test Manager.

%% 
% To create a new test file, in the Test Manager toolstrip, click *New > Test File > Blank Test File*.

%%
% Name the test file |ExampleTestFile|, and save it in a writable folder.

%%
% <<sltestNewTestFileAfterCreationPix.png>>

%% Capture baseline
% Under *System Under Test*, enter |sltestBaselineBasicExample| for *Model*.
% To capture a baseline for the test case, click *Capture*
% in the *Baseline Criteria* section. Save the file in a writable folder.

%%
% <<sltestBaselineTestCaseAfterSetupPix.png>>

%% 
% Click *Run* from the toolstrip to execute the test.

%%
% <<sltestBaselineTestCaseJustBeforeRunningPix.png>>

%% Expanding Results 
% After the test completes, expand all rows in the *Results and Artifacts* pane. The test case passes 
% because the simulation results match the baseline results.

%%
% <<sltestResultsAfterExpansionPix.png>>

%% Visualize Baseline Results
% Select the option button for |Out2| under *Baseline Criteria Result* to visualize 
% the data comparison.

%%
% <<sltestResultsComparisonPlotted1Pix.png>>

%% Visualize Simulation Outputs 
% Select the check boxes for |Out1| and |Out2| under *Sim Output* to
% visualize the simulation outputs.

%%
% <<sltestResultsOutputsPlotted1Pix.png>>

%%
% On the command line, change the value of |gain2_var|.
gain2_var = 6;

%%
% In the Test Manager, switch to the *Test Browser* pane. Select the test case, and click *Run*. 
% The test fails because the |gain2_var| parameter value changes the simulation results, which no
% match the baseline.

%%
% <<sltestResultsComparisonPlotted2Pix.png>>

%%
% <<sltestResultsOutputsPlotted2Pix.png>>

%% 
close_system(mdl, 0);
clear mdl;


displayEndOfDemoMessage(mfilename)
