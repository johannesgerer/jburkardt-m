function pwl_interp_1d_test ( )

%*****************************************************************************80
%
%% PWL_INTERP_1D_TEST tests the PWL_INTERP_1D library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 October 2012
%
%  Author:
%
%    John Burkardt
%
  addpath ( '../test_interp' );
  addpath ( '../r8lib' );

  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PWL_INTERP_1D_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the PWL_INTERP_1D library.\n' );
  fprintf ( 1, '  The R8LIB library is needed.\n' );
  fprintf ( 1, '  The test needs the TEST_INTERP library.\n' );

  prob_num = p00_prob_num ( );
  for prob = 1 : prob_num
    pwl_interp_1d_test01 ( prob );
  end

  prob = 7;
  pwl_interp_1d_test02 ( prob );
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PWL_INTERP_1D_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  rmpath ( '../r8lib' );
  rmpath ( '../test_interp' );

  return
end
