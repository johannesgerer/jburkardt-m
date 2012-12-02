function geometry_test056 ( )

%*****************************************************************************80
%
%% TEST056 tests PLANE_IMP_LINE_PAR_INT_3D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 April 2009
%
%  Author:
%
%    John Burkardt
%
  dim_num = 3;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST056\n' );
  fprintf ( 1, '  PLANE_IMP_LINE_PAR_INT_3D finds the \n' );
  fprintf ( 1, '    intersection of an implicit plane and\n' );
  fprintf ( 1, '    a parametric line, in 3D.\n' );

  a = 1.0;
  b = -2.0;
  c = -3.0;
  d = 6.0;
 
  f = 2.0;
  g = 1.0;
  h = 5.0;
  x0 = 3.0;
  y0 = 0.0;
  z0 = -7.0;
 
  [ intersect, p ] = plane_imp_line_par_int_3d ( a, b, c, d, x0, y0, z0, f, g, h );
 
  if ( intersect )
    fprintf ( 1, '\n' );
    fprintf ( 1, '  The plane and line intersect at \n' );
    fprintf ( 1, '  %f  %f  %f\n', p(1:dim_num) );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, '  The plane and the line do not intersect.\n' );
  end

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Expected answer:\n' );
  fprintf ( 1, '    The plane and line intersect at \n' );
  fprintf ( 1, '    7, 2, 3.\n' );

  return
end
