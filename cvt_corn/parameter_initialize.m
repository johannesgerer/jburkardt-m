function [ nb, ni, np, ns, pr_bud, pr_bud_angular, r, seed ] = ...
  parameter_initialize ( )

%*****************************************************************************80
%
%% PARAMETER_INITIALIZE sets the initial values of parameters.
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
%    Output, integer NB, the number of boundary points.
%
%    Output, integer NI, the number of interior points.
%
%    Output, integer NP, the total number of points.
%
%    Output, integer NS, the number of sample points.
%
%    Output, real PR_BUD, the probability that a boundary point will bud.
%
%    Output, real PR_BUD_ANGULAR, the probability that a boundary point bud
%    will be constrained to the boundary.
%
%    Output, real R, the radius of the circle.
%
%    Output, integer SEED, a seed for the random number generator.
%
  nb = 30;
  ni = 60;
  np = ni + nb;
  ns = 10000;

  pr_bud = 0.05;
  pr_bud_angular = 0.30;

  r = 1.0;
%
%  Call RNG to initialize the random number generator with a random seed, 
%  and record that value in SEED.
%
  rng_struct = rng ( 'shuffle' );
  seed = rng_struct.Seed;

  return
end
