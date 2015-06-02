function nearest_interp_1d_test ( )

%*****************************************************************************80
%
%% NEAREST_INTERP_1D_TEST tests the NEAREST_INTERP_1D library.
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
  addpath ( '../r8lib' )
  addpath ( '../test_interp' )

  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'NEAREST_INTERP_1D_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the NEAREST_INTERP_1D library.\n' );
  fprintf ( 1, '  The R8LIB library is needed.\n' );
  fprintf ( 1, '  The test needs the TEST_INTERP library.\n' );

  prob_num = p00_prob_num ( );

  ni = 11;
  for prob = 1 : prob_num
    nearest_interp_1d_test01 ( prob, ni );
  end

  for prob = 1 : prob_num
    nearest_interp_1d_test02 ( prob );
  end
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'NEAREST_INTERP_1D_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  rmpath ( '../r8lib' )
  rmpath ( '../test_interp' )

  return
end
