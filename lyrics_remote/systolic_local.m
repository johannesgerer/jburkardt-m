    sched = findResource('scheduler','configuration','local');
    pjob  = createParallelJob('configuration', 'local',...
                    'PathDependencies',{'/Users/ecliff/Desktop/lyrics/'});

    % Set the number of workers
    set(pjob, 'MinimumNumberOfWorkers', 3);
    set(pjob, 'MaximumNumberOfWorkers', 3);
    hndl=@systolicLyricsFilter;
    task= createTask(pjob, hndl, 1, {'mjam.wav'});
   
    submit(pjob);
    waitForState(pjob, 'finished');
    disp('Parallel Job is finished')
    results = getAllOutputArguments(pjob);
%
%  Clean up the job
%
  destroy(pjob);

    [tune, fs] = wavread('mjam.wav');
    disp('Play the original version')
    sound(tune, fs)
    
    disp('Play the filtered version')
    sound(results{3}, fs)

