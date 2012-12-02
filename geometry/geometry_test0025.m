function geometry_test0025 ( )

%*****************************************************************************80
%
%% TEST0025 tests ANGLE_RAD_2D;
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    04 December 2010
%
%  Author:
%
%    John Burkardt
%
  ntest = 6;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0025\n' );
  fprintf ( 1, '  ANGLE_RAD_2D computes the angle between two rays;\n' );
  fprintf ( 1, '\n' );

  for j = 1 : ntest

    if ( j == 1 )

      p1(1:2,1) = [ 1.0; 0.0 ];
      p2(1:2,1) = [ 0.0; 0.0 ];
      p3(1:2,1) = [ 1.0; 1.0 ];

    elseif ( j == 2 )

      p1(1:2,1) = [ 1.0; 0.0 ];
      p2(1:2,1) = [ 0.0; 0.0 ];
      p3(1:2,1) = [ 0.0; 1.0 ];

    elseif ( j == 3 )

      p1(1:2,1) = [ 1.0; -1.0 ];
      p2(1:2,1) = [ 0.0;  0.0 ];
      p3(1:2,1) = [ 0.0;  1.0 ];

    elseif ( j == 4 )

      p1(1:2,1) = [  1.0; 0.0 ];
      p2(1:2,1) = [  0.0; 0.0 ];
      p3(1:2,1) = [ -1.0; 0.0 ];

    elseif ( j == 5 )

      p1(1:2,1) = [ 1.0;  0.0 ];
      p2(1:2,1) = [ 0.0;  0.0 ];
      p3(1:2,1) = [ 0.0; -1.0 ];

    elseif ( j == 6 )

      p1(1:2,1) = [ 1.0;  0.0 ];
      p2(1:2,1) = [ 0.0;  0.0 ];
      p3(1:2,1) = [ 1.0; -0.01 ];

    end

    angle = angle_rad_2d ( p1, p2, p3 );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  Angle = %f\n', angle );

  end

  return
end
