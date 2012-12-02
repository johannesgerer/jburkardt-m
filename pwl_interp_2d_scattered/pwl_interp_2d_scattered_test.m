function pwl_interp_2d_scattered_test ( )

%*****************************************************************************80
%
%% PWL_INTERP_2D_SCATTERED_TEST tests PWL_INTERP_2D_SCATTERED_PRB.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 October 2012
%
%  Author:
%
%    John Burkardt
%
  addpath ( '../pwl_interp_2d_scattered' )
  addpath ( '../test_interp_2d' )
  addpath ( '../r8lib' )

  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PWL_INTERP_2D_SCATTERED_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test PWL_INTERP_2D_SCATTERED.\n' );
  fprintf ( 1, '  The R8LIB library is needed.\n' );
  fprintf ( 1, '  This test also needs the TEST_INTERP_2D library.\n' );

  pwl_interp_2d_scattered_test01 ( );
  pwl_interp_2d_scattered_test02 ( );
%
%  Numerical tests.
%
  prob_num = f00_num ( );

  for prob = 1 : prob_num
    pwl_interp_2d_scattered_test03 ( prob );
  end
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PWL_INTERP_2D_SCATTERED_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  rmpath ( '../pwl_interp_2d_scattered' )
  rmpath ( '../test_interp_2d' )
  rmpath ( '../r8lib' )

  return
end

