function lagrange_approx_1d_test ( )

%*****************************************************************************80
%
%% LAGRANGE_APPROX_1D_TEST tests LAGRANGE_APPROX_1D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 August 2012
%
%  Author:
%
%    John Burkardt
%
  addpath ( '../test_interp_1d' )
  addpath ( '../r8lib' )

  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LAGRANGE_APPROX_1D_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the LAGRANGE_APPROX_1D library.\n' );
  fprintf ( 1, '  These tests need the TEST_INTERP_1D libraries.\n' );

  prob_num = p00_prob_num ( );
  for prob = 1 : prob_num
    for m = [ 0, 1, 2, 3, 4, 8, 16 ]
      for nd = [ 16, 64, 1000 ]
        lagrange_approx_1d_test02 ( prob, m, nd );
      end
    end
  end

  prob_num = p00_prob_num ( );
  for prob = 1 : prob_num
    for m = [ 0, 1, 2, 3, 4, 8, 16 ]
      for nd = [ 16, 64, 1000 ]
        lagrange_approx_1d_test03 ( prob, m, nd );
      end
    end
  end
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'LAGRANGE_APPROX_1D_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  rmpath ( '../test_interp_1d' )
  rmpath ( '../r8lib' )

  return
end
