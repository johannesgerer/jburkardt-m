function match = birthday ( groupsize )

% BIRTHDAY Simulates a single trial of the Birthday Paradox
%
%    MATCH = BIRTHDAY(GROUPSIZE) creates a randomly selected birthday for
%    every member of a group of size GROUPSIZE and tests whether any of 
%    the selected birthdays match.  MATCH is 1 if two or more members of 
%    the group share the same birthday and 0 otherwise.
%
%    Example:
%    match = birthday(30)

%
%  MATCH will stay 0 unless we find two people with the same birthday.
%
  match = 0;
%
% Initialize list of taken birthdays
%
  bdaylist = zeros(1, groupsize);

  for person = 1 : groupsize
%
%  Randomly select a birthdate for the individual.
%
    birthdate = ceil ( 365.25 * rand ( ) );
%
%  Does someone already have this birthday?
%  If so, MATCH = 1 and we can return immediately.
%
    if any ( birthdate == bdaylist )
      match = 1;
      return;
    end
%
%  Otherwise, add the birthdate to the list and continue.
%
    bdaylist(person) = birthdate;

  end
    
  return
end
