function pwl_interp_2d_test ( )

%*****************************************************************************80
%
%% PWL_INTERP_2D_TEST tests PWL_INTERP_2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 October 2012
%
%  Author:
%
%    John Burkardt
%
  addpath ( '../r8lib' )
  addpath ( '../test_interp_2d' )

  n_test_num = 5;
  n_test = [ 2, 3, 4, 5, 9 ];

  timestamp ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PWL_INTERP_2D_TEST:\n' );
  fprintf ( 1, '  FORTRAN90 version\n' );
  fprintf ( 1, '  Test the PWL_INTERP_2D library.\n' );
  fprintf ( 1, '  The R8LIB library is needed.\n' );
  fprintf ( 1, '  The test needs the TEST_INTERP_2D library.\n' );

  prob_num = f00_num ( );
%
%  Numerical tests.
%
  for prob = 1 : prob_num
    for i = 1 : n_test_num
      n = n_test(i);
      pwl_interp_2d_test01 ( prob, n );
    end
  end
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PWL_INTERP_2D_TEST:\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  rmpath ( '../r8lib' )
  rmpath ( '../test_interp_2d' )

  return
end
