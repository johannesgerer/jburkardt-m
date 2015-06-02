function parameter_print ( alg, nb, ni, np, ns, pr_bud, pr_bud_angular, r, ...
  seed )

%*****************************************************************************80
%
%% PARAMETER_PRINT prints the current values of parameters.
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
%    Input, integer ALG, chooses the CVT updating algorithm.
%
%    Input, integer NB, the number of boundary points.
%
%    Input, integer NI, the number of interior points.
%
%    Input, integer NP, the total number of points.
%
%    Input, integer NS, the number of sample points.
%
%    Input, real PR_BUD, the probability that a boundary point will bud.
%
%    Input, real PR_BUD_ANGULAR, the probability that a boundary point bud
%    will be constrained to the boundary.
%
%    Input, real R, the radius of the circle.
%
%    Input, integer SEED, a seed for the random number generator.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, '  Current parameter values:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  %12d = ALG, CVT update algorithm:\n', alg );
  fprintf ( 1, '                 1 = update circle+disk\n' );
  fprintf ( 1, '                 2 = update circle, then update disk.\n' );
  fprintf ( 1, '                 3 = update circle first, then circle+disk.\n' );
  fprintf ( 1, '  %12d = NB, number of points on boundary\n', nb );
  fprintf ( 1, '  %12d = NI, number of point in interior\n', ni );
  fprintf ( 1, '  %12d = NP, total number of points\n', np );
  fprintf ( 1, '  %12d = NS, number of sample points for Lloyd''s algorithm\n', ns );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  %12f = PR_BUD, probability a boundary point creates a bud.\n', pr_bud );
  fprintf ( 1, '  %12f = PR_BUD_ANGULAR, probability a boundary bud is constrained to the boundary.\n', pr_bud_angular );
  fprintf ( 1, '  %12f = R, radius of circle\n', r );
  fprintf ( 1, '  %12d = SEED, random number seed\n', seed );

  return
end
