function prob = brunbirthday ( nw )

% For this script the default configuration should be 'ithaca_2009b
 
% nw is the number of workers use 4 as the default

  if nargin < 1 || nw > 4 || nw < 1; nw = 4; end
 
% Since the batch command is inside a function, we wait for the job to
% complete before retrieving the results and setting the return value
% of prob.
% If you want to continue working in Matlab while the job runs, issue the
% my_job = batch(..); from the Command Window. Check for 'finished' 
% by using state = get(my_job,'state')

% Create a batch job for the birthday simulation
%
  my_job = batch ( 'birthdayscript', ...
    'FileDependencies', 'birthday.m', ...
    'matlabpool', nw );
%
% birthdayscript.m uses a parfor loop (matlabpool)
% The job requires one worker to run the script and two
% additional workers for a matlabool
%
% Wait for the job to complete
%
  wait ( my_job );
%
%  Retrieve output from the job
%
  results = getAllOutputArguments(my_job);
  prob = results{1}.prob;
%
% If the cell array results is empty (say 1 x 0), the script submitted
% by 'batch' has failed.
 
% Could alternatively use the load command 
% prob = load(my_job, 'prob')

%
% Clean up after the job
%
  destroy(my_job);
