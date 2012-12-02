function p10_story ( )

%*****************************************************************************80
%
%% P10_STORY prints the "story" for problem 10.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 February 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    None
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  100 uniformly random X values between -2 and 5 were selected, and\n' );
  fprintf ( 1, '  the formula Y = 2 + 5 * X + 10 * N(0,1) was evaluated, where N(0,1)\n' );
  fprintf ( 1, '  represents random normal values with 0 mean and unit variance.\n' );

  return
end
