function geometry_test029 ( )

%*****************************************************************************80
%
%% TEST029 tests HALFSPACE_IMP_TRIANGLE_INT_3D.
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

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST029\n' );
  fprintf ( 1, '  HALFSPACE_IMP_TRIANGLE_INT_3D finds\n' );
  fprintf ( 1, '    intersection points of an implicit\n' );
  fprintf ( 1, '    halfspace and a triangle.\n' );

  a =   1.0;
  b = - 2.0;
  c = - 3.0;
  d =   6.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, '  The implicitly defined bounding plane\n' );
  fprintf ( 1, '  has the form: A*X + B*Y + C*Z + D = 0.\n' );
  fprintf ( 1, '  A,B,C,D = %8f  %8f  %8f  %8f\n', a, b, c, d );

  ntest = 6;

  for i = 1 : ntest

    if ( i == 1 )
      t(1:dim_num,1:3) = [ ...
        0.0,  0.0,  0.0; ...
        0.0, -1.0,  0.0; ...
        0.0,  0.0, -2.0 ]';
    elseif ( i == 2 )
      t(1:dim_num,1:3) = [ ...
       -6.0,  0.0,  0.0; ...
        0.0, -1.0,  0.0; ...
        0.0,  0.0, -2.0 ]';
    elseif ( i == 3 )
      t(1:dim_num,1:3) = [ ...
        0.0,  0.0,  0.0; ...
        0.0,  3.0,  0.0; ...
        0.0,  0.0,  2.0 ]';
    elseif ( i == 4 )
      t(1:dim_num,1:3) = [ ...
       -6.0,  0.0,  0.0; ...
        0.0,  4.0,  0.0; ...
        0.0,  0.0,  3.0 ]';
    elseif ( i == 5 )
      t(1:dim_num,1:3) = [ ...
       -8.0,  0.0,  0.0; ...
        0.0, -1.0,  0.0; ...
        0.0,  0.0, -2.0 ]';
    elseif ( i == 6 )
      t(1:dim_num,1:3) = [ ...
        0.0,  0.0,  0.0; ...
        0.0,  4.0,  0.0; ...
        0.0,  0.0,  4.0 ]';
    end

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Case %d\n', i );

    r8mat_transpose_print ( dim_num, 3, t, '  Triangle vertices' );

    [ num_int, pint ] = halfspace_imp_triangle_int_3d ( a, b, c, d, t );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Number of intersection points is %d\n', num_int );

    r8mat_transpose_print ( dim_num, num_int, pint, '  Intersections:' );

  end

  return
end
