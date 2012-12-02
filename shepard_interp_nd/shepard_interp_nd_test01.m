function shepard_interp_nd_test01 ( prob, p, m, nd )

%*****************************************************************************80
%
%% SHEPARD_INTERP_ND_TEST01 tests SHEPARD_INTERP_ND on an irregular grid.
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
%    Input, integer ND, the number of data points.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SHEPARD_INTERP_ND_TEST01:\n' );
  fprintf ( 1, '  Interpolate data from TEST_INTERP_ND problem #%d\n', prob );
  fprintf ( 1, '  using Shepard interpolation with P = %g\n', p );
  fprintf ( 1, '  spatial dimension M = %d\n', m );
  fprintf ( 1, '  and an irregular grid of ND = %d data points.\n', nd );
%
%  Set problem parameters:
%
  seed = 123456789;
  [ c, seed ] = r8vec_uniform_01 ( m, seed );
  [ w, seed ] = r8vec_uniform_01 ( m, seed );

  [ xd, seed ] = r8mat_uniform_01 ( m, nd, seed );
  
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
