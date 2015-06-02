function [ nb, ni, np, ns, pr_bud, pr_bud_angular, r, seed ] = ...
  parameter_set ( nb, ni, np, ns, pr_bud, pr_bud_angular, r, seed )

%*****************************************************************************80
%
%% PARAMETER_SET allows the user to reset parameter values;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 December 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input/output, integer NB, the number of boundary points.
%
%    Input/output, integer NI, the number of interior points.
%
%    Input/output, integer NP, the total number of points.
%
%    Input/output, integer NS, the number of sample points.
%
%    Input/output, real PR_BUD, the probability that a boundary point will bud.
%
%    Input/output, real PR_BUD_ANGULAR, the probability that a boundary point bud
%    will be constrained to the boundary.
%
%    Input/output, real R, the radius of the circle.
%
%    Input/output, integer SEED, a seed for the random number generator.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Use the "who" command to see current variables\n' );
  fprintf ( 1, '  Reset any value using the usual MATLAB assignment statements.\n' );
  fprintf ( 1, '  To terminate assignments and resume the program, type "return".\n' );
  fprintf ( 1, '  To terminate the program, type "dbquit".\n' );

  keyboard

  return
end
