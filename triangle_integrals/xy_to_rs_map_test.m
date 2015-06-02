function xy_to_rs_map_test ( )

%*****************************************************************************80
%
%% XY_TO_RS_MAP_TEST tests XY_TO_RS_MAP.
%
%  Location:
%
%    http://people.sc.fsu.edu/~jburkardt/m_src/triangle_integrals/xy_to_rs_map_test.m
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
  fprintf ( 1, 'XY_TO_RS_MAP_TEST:\n' );
  fprintf ( 1, '  XY_TO_RS_MAP determines the coefficients of the linear map\n' );
  fprintf ( 1, '  from a general triangle in XY coordinates to the reference\n' );
  fprintf ( 1, '  triangle in RS coordinates:\n' );
  fprintf ( 1, '    R = a + b * X + c * Y\n' );
  fprintf ( 1, '    S = d + e * X + f * Y\n' ); 

  t = [ ...
    2.0, 0.0;
    3.0, 4.0;
    0.0, 3.0 ]';

  r8mat_print ( 2, 3, t, '  XY triangle vertices:' );

  [ a, b, c, d, e, f ] = xy_to_rs_map ( t );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Mapping coefficients are:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    R = %g + %g * X + %g * Y\n', a, b, c );
  fprintf ( 1, '    S = %g + %g * X + %g * Y\n', d, e, f );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Apply map to XY triangle vertices.\n' );
  fprintf ( 1, '  Recover RS vertices (0,0), (1,0) and (0,1).\n' );
  fprintf ( 1, '\n' );
  for j = 1 : 3
    r = a + b * t(1,j) + c * t(2,j);
    s = d + e * t(1,j) + f * t(2,j);
    fprintf ( 1, '  V(%d) = ( %g, %g )\n', j, r, s ); 
  end

  return
end
