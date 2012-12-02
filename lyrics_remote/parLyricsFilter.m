function results = parLyricsFilter ( )
              
% Create a parallel job
pjob = createParallelJob('configuration', 'local');

% Ensure that there are exactly three labs participating
set(pjob, 'MinimumNumberOfWorkers', 3);
set(pjob, 'MaximumNumberOfWorkers', 3);

% Add a single task
createTask(pjob, @systolicLyricsFilter, 1, {'mjam.wav'});

% Submit the job to the cluster and wait for results
submit(pjob);
waitForState(pjob, 'finished');

% Get the results
results = getAllOutputArguments(pjob);

% Destroy the job
destroy(pjob);
