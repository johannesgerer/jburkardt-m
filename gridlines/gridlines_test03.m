function gridlines_test03 ( )

%*****************************************************************************80
%
%% GRIDLINES_TEST03 tests GRID_TRIANGULAR.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 July 2010
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'GRIDLINES_TEST03\n' );
  fprintf ( 1, '  GRID_TRIANGULAR draws a triangular grid.\n' );

  axis ( [ 0.0, 1.0, 0.0, 1.0 ] );

  xval = [ 0.1, 0.95, 0.25 ];
  yval = [ 0.1, 0.2, 0.90 ];
  ngrid = 10;
  grid_triangular ( xval, yval, ngrid );

  xval = [ 0.8, 0.6, 0.7 ];
  yval = [ 0.9, 0.9, 0.7 ];
  ngrid = 3;
  grid_triangular ( xval, yval, ngrid );

  xlabel ( 'X' )
  ylabel ( 'Y' )
  title ( 'Triangular grids' )
  axis equal

  fprintf ( 1, '\n' );
  fprintf ( 1, 'Press return to continue.\n' )
  hold off
  pause
  clf

  return
end
