function geometry_test0495 ( )

%*****************************************************************************80
%
%% TEST0495 tests PARALLELEPIPED_POINT_DIST_3D.
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
  dim_num = 3;
  ntest = 7;
%
%  Center of box.
%
  xtest(1) = 1.0;
  ytest(1) = 4.0;
  ztest(1) = 0.5;
%
%  The middle of a face.
%
  xtest(2) = 1.0;
  ytest(2) = 0.0;
  ztest(2) = 0.5;
%
%  The middle of an edge.
%
  xtest(3) = 0.0;
  ytest(3) = 4.0;
  ztest(3) = 1.0;
%
%  A corner.
%
  xtest(4) = 2.0;
  ytest(4) = 8.0;
  ztest(4) = 1.0;
%
%  Close to a face.
%
  xtest(5) = -0.5;
  ytest(5) = 4.0;
  ztest(5) = 0.5;
%
%  Close to an edge.
%
  xtest(6) = 1.0;
  ytest(6) = -1.0;
  ztest(6) = -1.0;
%
%  Close to a corner.
%
  xtest(7) = 3.0;
  ytest(7) = 9.0;
  ztest(7) = 2.0;

  fprintf ( 1, '\n' );
  fprintf ( 1, 'TEST0495\n' );
  fprintf ( 1, '  PARALLELEPIPED_POINT_DIST_3D computes the distance \n' );
  fprintf ( 1, '    from a point to a box (parallelipiped) in 3D.\n' );
  fprintf ( 1, '\n' );

  p1(1:dim_num,1) = [ 0.0; 0.0; 0.0 ];
  p2(1:dim_num,1) = [ 2.0; 0.0; 0.0 ];
  p3(1:dim_num,1) = [ 0.0; 8.0; 0.0 ];
  p4(1:dim_num,1) = [ 0.0; 0.0; 1.0 ];

  fprintf ( 1, '  The 4 box corners that are specified:\n' );
  fprintf ( 1, '\n' );
  fprintf ( 1, '  1  %10f  %10f  %10f\n', p1(1:dim_num,1) );
  fprintf ( 1, '  2  %10f  %10f  %10f\n', p2(1:dim_num,1) );
  fprintf ( 1, '  3  %10f  %10f  %10f\n', p3(1:dim_num,1) );
  fprintf ( 1, '  4  %10f  %10f  %10f\n', p4(1:dim_num,1) );

  fprintf ( 1, '\n' );
  fprintf ( 1, '    I                   P                  Distance to box\n' );
  fprintf ( 1, '\n' );

  for i = 1 : ntest

    p(1,1) = xtest(i);
    p(2,1) = ytest(i);
    p(3,1) = ztest(i);

    dist = parallelepiped_point_dist_3d ( p1, p2, p3, p4, p );

    fprintf ( 1, '  %3d  %10f  %10f  %10f  %12f\n', i, p(1:dim_num,1), dist );

  end

  return
end
