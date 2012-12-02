function test_interp_1d_test01 ( )

%*****************************************************************************80
%
%% TEST_INTERP_1D_TEST01 simply prints the title of each function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 August 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_INTERP_1D_TEST01\n' );
  fprintf ( 1, '  Print the title of each function.\n' );

  prob_num = p00_prob_num ( );
  
  fprintf ( 1, '\n' );
  fprintf ( 1, '  There are %d functions available:\n', prob_num );
  fprintf ( 1, '  Index  Title\n' );
  fprintf ( 1, '\n' );

  for prob = 1 : prob_num

    title = p00_title ( prob );

    fprintf ( 1, '  %2d  %s\n', prob, title );

  end

  return
end
