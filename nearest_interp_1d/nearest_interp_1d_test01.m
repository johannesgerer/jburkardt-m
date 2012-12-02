function nearest_interp_1d_test01 ( prob, ni )

%*****************************************************************************80
%
%% NEAREST_INTERP_1D_TEST01 tests NEAREST_INTERP_1D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 August 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROB, the index of the problem.
%
%    Input, integer NI, the number of interpolation points.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'NEAREST_INTERP_1D_TEST01\n' );
  fprintf ( 1, '  Sample the nearest neighbor interpolant for problem #%d\n', prob );

  nd = p00_data_num ( prob );
  d = p00_data ( prob, 2, nd );
  xd = d(1,:)';
  yd = d(2,:)';
  xd_min = min ( xd );
  xd_max = max ( xd );

  xi = r8vec_linspace ( ni, xd_min, xd_max );
  yi = nearest_interp_1d ( nd, xd, yd, ni, xi );

  title = sprintf ( 'X, Y for problem %d', prob );
  r8vec2_print ( ni, xi, yi, title );

  return
end
