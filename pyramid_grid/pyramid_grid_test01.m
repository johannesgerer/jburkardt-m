function pyramid_grid_test01 ( )

%*****************************************************************************80
%
%% PYRAMID_GRID_TEST01 tests PYRAMID_GRID_SIZE.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 August 2014
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'PYRAMID_GRID_TEST01\n' );
  fprintf ( 1, '  PYRAMID_GRID_SIZE determines the size of a\n' );
  fprintf ( 1, '  pyramid grid with N+1 points along each edge.\n' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '   N    Size\n' );
  fprintf ( 1, '\n' );
  for n = 0 : 10
    ng = pyramid_grid_size ( n );
    fprintf ( 1, '  %2d  %6d\n', n, ng );
  end

  return
end
