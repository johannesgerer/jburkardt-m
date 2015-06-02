function test_interp_test ( )

%*****************************************************************************80
%
%% TEST_INTERP_TEST tests the TEST_INTERP library.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 July 2012
%
%  Author:
%
%    John Burkardt
%
  addpath ( '../r8lib' );

  timestamp (  );
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_INTERP_TEST\n' );
  fprintf ( 1, '  MATLAB version\n' );
  fprintf ( 1, '  Test the TEST_INTERP library.\n' );
  fprintf ( 1, '  This test also requires the R8LIB library.\n' );

  test_interp_test01 ( );
  test_interp_test02 ( );

  prob_num = p00_prob_num;
  for prob = 1 : prob_num
    p00_plot ( prob );
  end
%
%  Terminate.
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_INTERP_TEST\n' );
  fprintf ( 1, '  Normal end of execution.\n' );
  fprintf ( 1, '\n' );
  timestamp ( );

  rmpath ( '../r8lib' );

  return
end
