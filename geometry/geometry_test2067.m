function geometry_test2067 ( )

%*****************************************************************************80
%
%% TEST2067 tests TRIANGLE_CIRCUMCIRCLE_2D, TRIANGLE_CIRCUMCIRCLE_2D_2;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 May 2005
%
%  Author:
%
%    John Burkardt
%
  dim_num = 2;
  ntest = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST2067\n' );
  fprintf ( 1, '  For a triangle in 2D:\n' );
  fprintf ( 1, '  TRIANGLE_CIRCUMCIRCLE_2D computes the circumcenter.\n' );
  fprintf ( 1, '  TRIANGLE_CIRCUMCIRCLE_2D_2 computes the circumcenter.\n' );

  for i = 1 : ntest

    if ( i == 1 )
      t(1:dim_num,1:3) = [ ...
         0.0,  0.0; ...
         1.0,  0.0; ...
         0.0,  1.0 ]';
    elseif ( i == 2 )
      t(1:dim_num,1:3) = [ ...
         0.0,  0.0; ...
         1.0,  0.0; ...
         0.5,  0.86602539 ]';
    elseif ( i == 3 )
      t(1:dim_num,1:3) = [ ...
         0.0,  0.0; ...
         1.0,  0.0; ...
         0.5, 10.0 ]';
    elseif ( i == 4 )
      t(1:dim_num,1:3) = [ ...
         0.0,  0.0; ...
         1.0,  0.0; ...
        10.0,  2.0 ]';
    end

    r8mat_transpose_print ( dim_num, 3, t, '  Triangle vertices:' );

    [ r, center ] = triangle_circumcircle_2d ( t );

    r8vec_print ( dim_num, center, '  Circumcenter' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Circumradius: %f\n', r );

    [ r, center ] = triangle_circumcircle_2d_2 ( t );

    r8vec_print ( dim_num, center, '  Circumcenter2' );
    fprintf ( 1, '\n' );
    fprintf ( 1, '  Circumradius2: %f\n', r );

  end

  return
end
