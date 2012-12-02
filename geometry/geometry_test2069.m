function geometry_test2069 ( )

%*****************************************************************************80
%
%% TEST2069 tests TRIANGLE_CONTAINS_LINE_PAR_3D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 February 2007
%
%  Author:
%
%    John Burkardt
%
  dim_num = 3;

  p0 = [ 3.0, 0.0, -7.0 ];
  pd = [ 2.0, 1.0, 5.0 ];
  t = [ ...
    8.0, 4.0, 2.0; ...
    9.0, 0.0, 5.0; ...
    2.0, 1.0, 2.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST2069\n' );
  fprintf ( 1, '  TRIANGLE_CONTAINS_LINE_PAR_3D determines whether\n' );
  fprintf ( 1, '    a triangle "contains" a parametric line in 3D.\n' );

  r8mat_transpose_print ( dim_num, 3, t, '  Triangle vertices:' );

  norm = sqrt ( sum ( pd(1:dim_num).^2 ) );
  pd(1:dim_num) = pd(1:dim_num) / norm;

  r8vec_print ( dim_num, p0, '  Parametric base point P0:' );
  r8vec_print ( dim_num, pd, '  Parametric direction PD:' );

  [ inside, pint ] = triangle_contains_line_par_3d ( t, p0, pd );

  if ( inside )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  The triangle contains the line.\n' );
    r8vec_print ( dim_num, pint, '  Intersection point:' );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, '  The triangle does not contain the line.\n' );
    r8vec_print ( dim_num, pint, '  The intersection point:' );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Expected answer:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '    The triangle contains the line, and\n' );
  fprintf ( 1, '    the intersection point is at:\n' );
  fprintf ( 1, '      ( 7, 2, 3 ).\n' );

  return
end
