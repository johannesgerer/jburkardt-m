function test_interp_2d_test01 ( )

%*****************************************************************************80
%
%% TEST_INTERP_2D_TEST01 simply prints the title of each grid and function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 August 2012
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST_INTERP_2D_TEST01\n' );
  fprintf ( 1, '  For each grid and function, print the title.\n' );

  g_num = g00_num ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  GRIDS:\n' );
  fprintf ( 1, '  Index  Title\n' );
  fprintf ( 1, '\n' );

  for gi = 1 : g_num

    gt = g00_title ( gi );

    fprintf ( 1, '  %2d  %s\n', gi, gt );

  end

  f_num = f00_num ( );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  FUNCTIONS:\n' );
  fprintf ( 1, '  Index  Title\n' );
  fprintf ( 1, '\n' );

  for fi = 1 : f_num

    ft = f00_title ( fi );

    fprintf ( 1, '  %2d  %s\n', fi, ft );

  end

  return
end
