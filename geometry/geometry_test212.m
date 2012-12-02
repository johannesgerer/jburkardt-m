function geometry_test212 ( )

%*****************************************************************************80
%
%% TEST212 tests TRIANGLE_SAMPLE, TRIANGLE_XY_TO_XSI_2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 April 2007
%
%  Author:
%
%    John Burkardt
%
  dim_num = 2;

  seed = 123456789;
  t = [ ...
     4.0, 2.0; ...
     1.0, 5.0; ...
    -2.0, 2.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST212\n' );
  fprintf ( 1, '  TRIANGLE_SAMPLE samples a triangle.\n' );
  fprintf ( 1, '  TRIANGLE_XY_TO_XSI_2D converts XY to XSI coordinates.\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  We are computing the XSI coordinates just to verify\n' );
  fprintf ( 1, '  that the points are inside the triangle.\n' );

  r8mat_transpose_print ( dim_num, 3, t, '  Triangle vertices:' );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  Sample points (X,Y) and (XSI1,XSI2,XSI3) coordinates:\n' );
  fprintf ( 1, '\n' );

  for i = 1 : 10

    [ p, seed ] = triangle_sample ( t, 1, seed );

    xsi = triangle_xy_to_xsi_2d ( t, p );

    fprintf ( 1, '  %10f  %10f    %10f  %10f  %10f\n', ...
      p(1:dim_num), xsi(1:dim_num+1) );

  end

  return
end
