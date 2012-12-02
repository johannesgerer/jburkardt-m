function test_interp_nd_test01 ( )

%*****************************************************************************80
%
%% TEST_INTERP_ND_TEST01 prints the title of each test function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 August 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_INTERP_ND_TEST01\n' );
  fprintf ( 1, '  P00_TITLE returns the problem title.\n' );

  prob_num = p00_prob_num ( );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  There are a total of %d problems.\n', prob_num );
  fprintf ( 1, '\n' );

  for prob = 1 : prob_num
    title = p00_title ( prob );
    fprintf ( 1, '%2d  "%s"\n', prob, title );
  end

  return
end