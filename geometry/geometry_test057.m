function geometry_test057 ( )

%*****************************************************************************80
%
%% TEST057 tests PLANE_IMP_SEGMENT_NEAR_3D.
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
  fprintf ( 1, 'TEST057\n' ); 
  fprintf ( 1, '  PLANE_IMP_SEGMENT_NEAR_3D finds the point\n' ); 
  fprintf ( 1, '    on a line segment nearest a plane.\n' ); 
 
  for i = 1 : 2
 
    p1(1:dim_num) = [ 3.0, 0.0, -7.0 ];
 
    if ( i == 1 )
      p2(1:dim_num) = [ 9.0, 3.0, 8.0 ];
    elseif ( i == 2 )
      p2(1:dim_num) = [ 5.0, 1.0, -2.0 ];
    end
 
    a = 1.0;
    b = -2.0;
    c = -3.0;
    d = 6.0;
 
    [ dist, p, pn ] = plane_imp_segment_near_3d ( p1, p2, a, b, c, d );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  The distance between the plane and the\n' ); 
    fprintf ( 1, '  line segment is %f\n', dist );
    fprintf ( 1, '\n' ); 
    fprintf ( 1, '  A nearest point on the line segment is\n' ); 
    fprintf ( 1, '  %f  %f  %f\n', pn(1:dim_num) );
    fprintf ( 1, '\n' ); 
    fprintf ( 1, '  A nearest point on the plane is\n' ); 
    fprintf ( 1, '  %f  %f  %f\n', p(1:dim_num) );
 
  end
 
  return
end
