function rs_to_xy_map_test ( )

%*****************************************************************************80
%
%% RS_TO_XY_MAP_TEST tests RS_TO_XY_MAP.
%
%  Location:
%
%    http://people.sc.fsu.edu/~jburkardt/m_src/triangle_poly_integral/rs_to_xy_map_test.m
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 April 2015
%
%  Author:
%
%    John Burkardt
%
  fprintf ( 1, '\n' );
  fprintf ( 1, 'RS_TO_XY_MAP_TEST:\n' );
  fprintf ( 1, '  RS_TO_XY_MAP determines the coefficients of the linear map\n' );
  fprintf ( 1, '  from a the reference in RS coordinates to the physical\n' );
  fprintf ( 1, '  triangle in XY coordinates:\n' );
  fprintf ( 1, '    X = a + b * R + c * S\n' );
  fprintf ( 1, '    Y = d + e * R + f * S\n' ); 

  tr = [ ...
    0.0, 0.0;
    1.0, 0.0;
    0.0, 1.0 ]';

  t = [ ...
    2.0, 0.0;
    3.0, 4.0;
    0.0, 3.0 ]';

  r8mat_print ( 2, 3, t, '  XY triangle vertices:' );

  [ a, b, c, d, e, f ] = rs_to_xy_map ( t );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Mapping coefficients are:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    X = %g + %g * R + %g * S\n', a, b, c );
  fprintf ( 1, '    Y = %g + %g * R + %g * S\n', d, e, f );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Apply map to RS triangle vertices.\n' );
  fprintf ( 1, '  Recover XY vertices (2,0), (3,4) and (0,3).\n' );
  fprintf ( 1, '\n' );
  for j = 1 : 3
    x = a + b * tr(1,j) + c * tr(2,j);
    y = d + e * tr(1,j) + f * tr(2,j);
    fprintf ( 1, '  V(%d) = ( %g, %g )\n', j, x, y ); 
  end

  return
end
