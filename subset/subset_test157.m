function subset_test157 ( )

%*****************************************************************************80
%
%% TEST157 tests YTB_ENUM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 April 2009
%
%  Author:
%
%    John Burkardt
%
  n = 10;
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST157\n' );
  fprintf ( 1, '  YTB_ENUM counts Young tableau.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  N    YTB(N)\n' );
  fprintf ( 1, '\n' );

  for i = 0 : n
    pi = ytb_enum ( i );
    fprintf ( 1, '  %8d  %8d\n', i, pi );
  end

  return
end
