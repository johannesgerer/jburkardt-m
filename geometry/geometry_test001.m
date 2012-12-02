function geometry_test001 ( )

%*****************************************************************************80
%
%% TEST001 tests ANGLE_CONTAINS_POINT_2D.
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
  n_angle = 12;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST001\n' );
  fprintf ( 1, '  ANGLE_CONTAINS_POINT_2D sees if a point\n' );
  fprintf ( 1, '  lies within an angle.\n' );
  fprintf ( 1, '\n' );
%
%  An acute angle (45 degrees)
%
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

    r8vec_print ( 2, p1, '  Vertex P1' )
    r8vec_print ( 2, p2, '  Vertex P2' )
    r8vec_print ( 2, p3, '  Vertex P3' )

    fprintf ( 1, '\n' );
    fprintf ( 1, '       X            Y       Inside?\n' );
    fprintf ( 1, '\n' );

    for i = 0 : n_angle

      thetar = i * 2.0 * pi / n_angle;
%
%  For some bizarre MATLAB peculiarity, I can't say
%    p(1:2) = [ cos ( thetar ), sin ( thetar ) ];
%  MATLAB (Student 6.5) complains that COS has the wrong number
%  of arguments.  But write it out like this, and magically, everything
%  is fine.  People think I'm crabby for no reason...
%
      p(1,1) = cos ( thetar );
      p(2,1) = sin ( thetar );

      inside = angle_contains_point_2d ( p1, p2, p3, p );

      fprintf ( 1, '  %12f  %12f  %1d\n', p(1:2,1), inside );

    end

  end

  return
end
