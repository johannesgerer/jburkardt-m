function pwl_approx_1d_test ( )

%*****************************************************************************80
%
%% PWL_APPROX_1D_TEST tests PWL_APPROX_1D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 August 2012
%
%  Author:
%
%    John Burkardt
%
  addpath ( '../r8lib' )
  addpath ( '../test_interp_1d' )

  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PWL_APPROX_1D_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the PWL_APPROX_1D library.\n' );
  fprintf ( 1, '  The R8LIB library is needed.\n' );
  fprintf ( 1, '  The test needs the TEST_INTERP_1D library.\n' );

  prob_num = p00_prob_num ( );
  for prob = 1 : prob_num
    for nc = [ 2, 4, 8, 16 ]
      for nd = [ 16, 64 ]
        pwl_approx_1d_test01 ( prob, nc, nd );
      end
    end
  end
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PWL_APPROX_1D_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  rmpath ( '../r8lib' )
  rmpath ( '../test_interp_1d' )

  return
end
