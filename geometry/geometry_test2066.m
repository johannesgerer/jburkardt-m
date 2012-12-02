function geometry_test2066 ( )

%*****************************************************************************80
%
%% TEST2066 tests TRIANGLE_CENTROID_2D;
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
  dim_num = 2;
  ntest = 4;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST2066\n' );
  fprintf ( 1, '  For a triangle in 2D:\n' );
  fprintf ( 1, '  TRIANGLE_CENTROID_2D computes the centroid.\n' );

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

    centroid = triangle_centroid_2d ( t );

    r8vec_print ( dim_num, centroid, '  Centroid:' );
 
  end

  return
end
