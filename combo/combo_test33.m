function combo_test33 ( )

%*****************************************************************************80
%
%% COMBO_TEST33 tests RGF_G_TABLE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 July 2011
%
%  Author:
%
%    John Burkardt
%
  m = 6;

  fprintf ( 1, ' \n' );
  fprintf ( 1, 'COMBO_TEST33\n' );
  fprintf ( 1, '  RGF_G_TABLE tabulates generalized restricted\n' );
  fprintf ( 1, '  growth functions.\n' );
  fprintf ( 1, ' \n' );

  offset = 1;

  d = rgf_g_table ( m );

  for i = 0 : m
    for j = 0 : m - i
      fprintf ( 1, '%6d', d(i+offset,j+offset) );
    end
    fprintf ( 1, '\n' );
  end

  return
end
