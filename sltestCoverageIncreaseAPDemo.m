%% Extend Model Coverage of a Test Case
%
% Increase coverage of a test case by generating tests using Simulink(R) 
% Design Verifier(TM). Copyright 2016 The MathWorks, Inc.

%%
% This example shows you how to 
% extend coverage of a test case beyond an initial 
% test case. You start by measuring coverage for the initial
% test which uses timeseries data. Then you can
% add new test cases to the Test Manager and 
% simulate them and review aggregate coverage.
%
% This example builds on the workflow from another example,
% <matlab:showdemo('sltestRequirementsTestingAutopilotDemo') Requirements-Based Testing for Model Development>

%% Paths and Example Files
%
% Enter the following to store paths and filenames for the example and set
% the current folder.
%
filePath = fullfile(matlabroot,'toolbox','simulinktest','simulinktestdemos');
rollModel = 'RollAutopilotRevised';
testHarness = 'RollReference_LoggedDataTest';
testFile = 'RollRefTest.mldatx';

%% Background and Workflow for the Example
% 
% Tests commonly use timeseries
% inputs to exercise the model or a particular model component. Timeseries
% inputs can include logged data from simulation or from physical measurements.
% Logged data can cover important simulation cases, but not necessarily
% achieve full model coverage. If you have Simulink(R) Test(TM) and
% Simulink(R) Design Verifier(TM), you can generate test cases to increase
% test coverage and view cumulative coverage from a the new test cases.
%
% This example uses an updated version of the |Roll Reference| subsystem, 
% a test case, and a test harness for a timeseries input. The basic
% workflow is:

%%
% # Measure model coverage with the timeseries input
% # Generate additional test cases for coverage not achieved in the first
% test case.
% # Run the test cases and measure cumulative model coverage. 

%%
% The |Roll Reference| subsystem is one component of an autopilot control
% system. The subsystem controls the reference angle of the aircraft's roll
% axis.

%% The Test Case and Timeseries Test Harness
%
% The model contains a test harness |RollReference_LoggedDataTest|, which
% uses timeseries data from the base workspace. The test case 
% collects MCDC coverage for the |Roll Reference| subsystem.

%% Run the Test and View Coverage Results
% 
% Set the current folder to a writable location. Open the test file
% |RollRefTest|:
sltest.testmanager.view;
sltest.testmanager.load(fullfile(filePath,testFile));

%%
%
% <<autopilot_coverage_topup_timeseries_testcase_initial.png>>
%
%%
% In the *Test Browser*, expand the *Logged Data and Coverage* test suite. 
% Highlight the |RollReference Timeseries Input| test
% case and click *Run*. 

%%
% When simulation completes, in the *Results and Artifacts* pane, select 
% the test case. In the test results, expand the *Coverage Results*
% section. The results show that the test
% achieves partial coverage for the |Roll Reference| subsystem:
%
% * Decision coverage: 80%
% * Condition coverage: 70%
% * MCDC 25%

%%
% <<autopilot_coverage_initial_result_new.png>>

%% Generate Tests to Increase Model Coverage
%
% To generate additional tests for missing coverage data,
% right click the coverage result,  and then select "Add Tests for Missing Coverage".
% This will open the dialog box shown below. In the "Test Case" dropdown, select 
% "Create a new test case" option. Then click "OK".

%%
% <<add_tests_for_missing_coverage.png>>

%%
% This will launch Simulink(R) Design Verifier(TM) and
% create a new test case in the test browser:

%%
% <<new_test_case_after_adding_missing_coverage.png>>


%% Run the New Test Case
%
% Highlight the "New Test Case 1" and click *Run*.

%%
% When simulation completes, in the *Results and
% Artifacts* section, select the result set and expand the *Aggregated
% Coverage Results*. The coverage results show the coverage result for
% the new test.
%
% * Decision: 100%
% * Condition: 100%
% * MCDC: 100%

%%
% <<autopilot_coverage_new_test_case.png>>

%%
clear filePath reqDoc rollModel testFile testHarness topModel;
sltest.testmanager.clearResults;
sltest.testmanager.close;
close_system('RollAutopilotRevised',0);


