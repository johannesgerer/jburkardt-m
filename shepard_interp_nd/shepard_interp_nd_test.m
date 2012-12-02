function shepard_interp_nd_test ( )

%*****************************************************************************80
%
%% SHEPARD_INTERP_ND_TEST tests SHEPARD_INTERP_ND.
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
  addpath ( '../r8lib' )
  addpath ( '../test_interp_nd' )

  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SHEPARD_INTERP_ND_TEST:\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the SHEPARD_INTERP_ND library.\n' );
  fprintf ( 1, '  The R8LIB library is needed.\n' );
  fprintf ( 1, '  This test needs the TEST_INTERP_ND library.\n' );
%
%  Look at Shepard interpolant on an irregular grid.
%
  nd = 25;

  prob_num = p00_prob_num ( );

  for prob = 1 : prob_num

    for m = 2 : 3 : 5

      for p = [ 1.0, 2.0, 4.0, 8.0 ];
        shepard_interp_nd_test01 ( prob, p, m, nd );
      end

    end
  end
%
%  Look at Shepard interpolant on a regular N1D^M grid.
%
  n1d = 5;

  prob_num = p00_prob_num ( );

  for prob = 1 : prob_num

    for m = 2 : 3 : 5

      for p = [ 1.0, 2.0, 4.0, 8.0 ];
        shepard_interp_nd_test02 ( prob, p, m, n1d );
      end

    end
  end
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'SHEPARD_INTERP_ND_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  rmpath ( '../r8lib' )
  rmpath ( '../test_interp_nd' )

  return
end
