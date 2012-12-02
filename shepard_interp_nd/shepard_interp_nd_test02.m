function shepard_interp_nd_test02 ( prob, p, m, n1d )

%*****************************************************************************80
%
%% SHEPARD_INTERP_ND_TEST02 tests SHEPARD_INTERP_ND on a regular N1D^M grid.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 September 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROB, the problem number.
%
%    Input, real P, the power used in the distance weighting.
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N1D, the number of points in 1D.
%

%
%  Set problem parameters:
%
  seed = 123456789;
  [ c, seed ] = r8vec_uniform_01 ( m, seed );
  [ w, seed ] = r8vec_uniform_01 ( m, seed );

  nd = n1d^m;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'SHEPARD_INTERP_ND_TEST02:\n' );
  fprintf ( 1, '  Interpolate data from TEST_INTERP_ND problem #%d\n', prob );
  fprintf ( 1, '  using Shepard interpolation with P = %g\n', p );
  fprintf ( 1, '  spatial dimension M = %d\n', m );
  fprintf ( 1, '  and a regular grid of N1D^M = %d data points.\n', nd );

  a = 0.0;
  b = 1.0;
  x1d = r8vec_linspace ( n1d, a, b );

  xd = zeros ( m, nd );
  for i = 1 : m
    xd = r8vec_direct_product ( i, n1d, x1d, m, nd, xd );
  end
  
  zd = p00_f ( prob, m, c, w, nd, xd );
%
%  #1:  Does interpolant match function at interpolation points?
%
  ni = nd;
  xi = xd;
  zi = shepard_interp_nd ( m, nd, xd, zd, p, ni, xi );

  int_error = norm ( zi - zd ) / ni;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  L2 interpolation error averaged per interpolant node = %g\n', int_error );
%
%  #2: Approximation test.  Estimate the integral (f-interp(f))^2.
%
  ni = 1000;
  [ xi, seed ] = r8mat_uniform_01 ( m, ni, seed );
  zi = shepard_interp ( m, nd, xd, zd, p, ni, xi );
  ze = p00_f ( prob, m, c, w, ni, xi );

  app_error = norm ( zi - ze ) / ni;

  fprintf ( 1, '  L2 approximation error averaged per 1000 samples = %g\n', app_error );

  return
end
