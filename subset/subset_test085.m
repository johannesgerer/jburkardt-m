function subset_test085 ( )

%*****************************************************************************80
%
%% TEST085 tests PENT_ENUM.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2003
%
%  Author:
%
%    John Burkardt
%
  n = 10;
  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST085\n' );
  fprintf ( 1, '  PENT_ENUM counts points in pentagons.\n' );
  fprintf ( 1, '\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  N    Pent(N)\n' );
  fprintf ( 1, '\n' );

  for i = 0 : n 
    p = pent_enum ( i );
    fprintf ( 1, '  %8d  %8d\n', i, p );
  end

  return
end
