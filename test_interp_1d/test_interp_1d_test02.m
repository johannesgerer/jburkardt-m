function test_interp_1d_test02 ( nd )

%*****************************************************************************80
%
%% TEST_INTERP_1D_TEST02 evaluates each test function at ND sample points.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 August 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer ND, the number of sample points.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_INTERP_1D_TEST02\n' );
  fprintf ( 1, '  Use P00_F to sample each function.\n' );

  prob_num = p00_prob_num ( );

  a = 0.0;
  b = 1.0;
  x = r8vec_linspace ( nd, a, b );

  fprintf ( 1, '\n' );

  for prob = 1 : prob_num

    y = p00_f ( prob, nd, x );
    title = sprintf ( 'X, Y for problem %d', prob );
    r8vec2_print ( nd, x, y, title );

  end

  return
end
