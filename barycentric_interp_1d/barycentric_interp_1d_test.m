function barycentric_interp_1d_test ( )

%*****************************************************************************80
%
%% BARYCENTRIC_INTERP_1D_TEST tests the BARYCENTRIC_INTERP_1D library.
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
  addpath ( '../test_interp_1d' )

  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BARYCENTRIC_INTERP_1D_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the BARYCENTRIC_INTERP_1D library.\n' );
  fprintf ( 1, '  The R8LIB library is needed.\n' );
  fprintf ( 1, '  These test needs the TEST_INTERP_1D library.\n' );

  prob_num = p00_prob_num ( );
  for prob = 1 : prob_num
    for nd = [ 4, 8, 16, 32, 64, 1000 ]
      barycentric_interp_1d_test01 ( prob, nd );
    end
  end

  prob_num = p00_prob_num ( );
  for prob = 1 : prob_num
    for nd = [ 4, 8, 16, 32, 64, 1000 ]
      barycentric_interp_1d_test02 ( prob, nd );
    end
  end

  prob_num = p00_prob_num ( );
  for prob = 1 : prob_num
    for nd = [ 4, 8, 16, 32, 64, 1000 ]
      barycentric_interp_1d_test03 ( prob, nd );
    end
  end
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'BARYCENTRIC_INTERP_1D_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  rmpath ( '../r8lib' )
  rmpath ( '../test_interp_1d' )
  
  return
end
