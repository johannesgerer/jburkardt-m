function test_tri_int_test01 ( )

%*****************************************************************************80
%
%% TEST01 tests GET_PROB_NUM and P00_TITLE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 April 2007
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST01\n' );
  fprintf ( 1, '  GET_PROB_NUM reports the number of problems.\n' );
  fprintf ( 1, '  P00_TITLE returns a title for each problem.\n' );

  prob_num = get_prob_num ( 'DUMMY' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The number of problems available is %d\n', prob_num );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  The problem titles:\n' );
  fprintf ( 1, '\n' );

  for problem = 1 : prob_num

    title = p00_title ( problem );

    fprintf ( 1,'  %8d  %s\n', problem, title );

  end

  return
end
