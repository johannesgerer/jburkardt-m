function [ blocks, goal, seed ] = count_pose_random ( seed )

%*****************************************************************************80
%
%% COUNT_POSE_RANDOM poses a problem for the game "The Count is Good"
%
%  Discussion:
%
%    The French television show "The Count is Good" has a game that goes
%    as follows:
%
%      A number is chosen at random between 100 and 999.  This is the GOAL.
%
%      Six numbers are randomly chosen from the set 1, 2, 3, 4, 5, 6, 7, 8,
%      9, 10, 25, 50, 75, 100.  These numbers are the BLOCKS.
%
%      The player must construct a formula, using some or all of the blocks,
%      (but not more than once), and the operations of addition, subtraction,
%      multiplication and division.  Parentheses should be used to remove
%      all ambiguity.  However, it is forbidden to use subtraction in a
%      way that produces a negative result, and all division must come out
%      exactly, with no remainder.
%
%    This routine poses a sample problem from the show.  The point is,
%    to determine how to write a program that can solve such a problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 June 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Raymond Seroul,
%    Programming for Mathematicians,
%    Springer Verlag, 2000, page 355-357.
%
%  Parameters:
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, integer BLOCKS(6), the six numbers available for the formula.
%
%    Output, integer GOAL, the goal number.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  stuff = [ 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 25, 50, 75, 100 ];

  [ goal, seed ] = i4_uniform ( 100, 999, seed );

  [ ind, seed ] = ksub_random ( 14, 6, seed );

  blocks(1:6) = stuff(ind(1:6));

  return
end
