function lagrange_interp_1d_test ( )

%*****************************************************************************80
%
%% LAGRANGE_INTERP_1D_TEST tests LAGRANGE_INTERP_1D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 August 2012
%
%  Author:
%
%    John Burkardt
%
  addpath ( '../r8lib' )
  addpath ( '../test_interp_1d' )

  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LAGRANGE_INTERP_1D_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the LAGRANGE_INTERP_1D library.\n' );
  fprintf ( 1, '  The R8LIB library is needed.\n' );
  fprintf ( 1, '  The test needs the TEST_INTERP_1D library.\n' );

  prob_num = p00_prob_num ( );
  for prob = 1 : prob_num
    for nd = [ 4, 8, 16, 32, 64, 256 ]
      lagrange_interp_1d_test02 ( prob, nd );
    end
  end

  prob_num = p00_prob_num ( );
  for prob = 1 : prob_num
    for nd = [ 4, 8, 16, 32, 64, 256 ]
      lagrange_interp_1d_test03 ( prob, nd );
    end
  end
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LAGRANGE_INTERP_1D_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  rmpath ( '../r8lib' )
  rmpath ( '../test_interp_1d' )

  return
end
