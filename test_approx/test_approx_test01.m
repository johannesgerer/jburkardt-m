function test_approx_test01 ( )

%*****************************************************************************80
%
%% TEST_APPROX_TEST01 shows how P00_TITLE can be called.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 August 2011
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_APPROX_TEST01\n' );
  fprintf ( 1, '  Demonstrate some of the bookkeeping routines.\n' );
  fprintf ( 1, '  P00_PROB_NUM returns the number of problems.\n' );
  fprintf ( 1, '  P00_TITLE returns the problem title.\n' );
  fprintf ( 1, '  P00_LIMIT returns the problem limits.\n' );

  prob_num = p00_prob_num ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Number of problems = %d\n', prob_num );
  fprintf ( 1, '\n' );

  for prob = 1 : prob_num

    title = p00_title ( prob );
    fprintf ( 1, '  %2d  %s\n', prob, title );

  end

  return
end
