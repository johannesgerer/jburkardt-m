%% Script for the Birthday Paradox simulation

% Define paramenters for simulation

  numtrials = 2e5;
  groupsize = 30;

% Preallocate some memory for the matches

  matches = zeros(1, numtrials);

  parfor trial = 1:numtrials

    matches(trial) = birthday(groupsize);
    
  end

% Probability is the sum of matches divided by number of trials

  prob = sum ( matches ) / numtrials;
