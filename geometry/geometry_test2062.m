function geometry_test2062 ( )

%*****************************************************************************80
%
%% TEST2062 tests TRIANGLE_AREA_HERON;
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
  dim_num = 3;

  t = [ ...
    1.0, 0.0, 0.0; ...
    0.0, 1.0, 0.0; ...
    0.0, 0.0, 1.0 ]';

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST2062\n' );
  fprintf ( 1, '  For a triangle in any dimension,\n' );
  fprintf ( 1, '  TRIANGLE_AREA_HERON computes the area;\n' );

  r8mat_transpose_print ( dim_num, 3, t, '  Triangle vertices:' );

  for j = 1 : 3

    s(j) = 0.0;

    jp1 = mod ( j, 3 ) + 1;

    for i = 1 : dim_num
      s(j) = s(j) + ( t(i,j) - t(i,jp1) ).^2;
    end

    s(j) = sqrt ( s(j) );

  end

  r8vec_print ( 3, s, '  Side lengths:' );

  area = triangle_area_heron ( s );

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The area is %f\n', area );

  return
end
