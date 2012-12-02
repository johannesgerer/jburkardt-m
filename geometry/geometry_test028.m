function geometry_test028 ( )

%*****************************************************************************80
%
%% TEST028 tests HALFPLANE_CONTAINS_POINT_2D
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
  fprintf ( 1, 'TEST028\n' );
  fprintf ( 1, '  HALFPLANE_CONTAINS_POINT_2D determines whether a\n' );
  fprintf ( 1, '  halfplane bounded by (XA,YA):(XB,YB) contains the\n' );
  fprintf ( 1, '  point (X,Y).\n' );
  fprintf ( 1, '\n' );

  for j = 1 : ntest

    if ( j == 1 )

      p1(1:dim_num) = [ 0.0, 0.0 ];
      p2(1:dim_num) = [ 2.0, 0.0 ];
      p(1:dim_num) = [ 1.0, 1.0 ];

      expected = 1;

    elseif ( j == 2 )

      p1(1:dim_num) = [ 0.0, 0.0 ];
      p2(1:dim_num) = [ 2.0, 0.0 ];
      p(1:dim_num) = [ 1.0, -1.0 ];

      expected = 0;

    elseif ( j == 3 )

      p1(1:dim_num) = [ -5.0, -5.0 ];
      p2(1:dim_num) = [ 10.0, 10.0 ];
      p(1:dim_num) = [ -1.0, +1.0 ];

      expected = 1;

    elseif ( j == 4 )

      p1(1:dim_num) = [ 3.0, 150.0 ];
      p2(1:dim_num) = [ 1.0, 50.0 ];
      p(1:dim_num) = [ 2.0, 200.0 ];

      expected = 0;

    end

    temp = halfplane_contains_point_2d ( p1, p2, p );

    fprintf ( 1, '\n' );
    fprintf ( 1, '  P1 = %12f  %12f\n', p1(1:dim_num) );
    fprintf ( 1, '  P2 = %12f  %12f\n', p2(1:dim_num) );
    fprintf ( 1, '  P =  %12f  %12f\n', p(1:dim_num) );
    fprintf ( 1, '  Contains? = %d,  Correct = %d\n', temp, expected );

  end

  return
end
