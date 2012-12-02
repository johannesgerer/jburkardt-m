function geometry_test0315 ( )

%*****************************************************************************80
%
%% TEST0315 tests HEXAGON_CONTAINS_POINT_2D
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
  N = 40;

  h = [ 0.2,  0.4; ...
        0.4,  0.2; ...
        0.8,  0.0; ...
        1.0,  0.6; ...
        0.4,  1.0; ...
        0.2,  0.8 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0315\n' );
  fprintf ( 1, '  HEXAGON_CONTAINS_POINT_2D reports if a hexagon\n' );
  fprintf ( 1, '  contains a point.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  We will call the function repeatedly, and draw\n' );
  fprintf ( 1, '  a sketch of an irregular hexagon in the unit square.\n' );
  fprintf ( 1, '\n' );

  for i = 1 : N
    x(2) = real ( N - i ) / real ( N - 1 );
    fprintf ( 1, '  ' );
    for j = 1 : N
      x(1) = real ( j - 1 ) / real ( N - 1 );
      if ( hexagon_contains_point_2d ( h, x ) )
        fprintf ( 1, '*' );
      else
        fprintf ( 1, '-' );
      end
    end
    fprintf ( 1, '\n' );
  end

  return
end
