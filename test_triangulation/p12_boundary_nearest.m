function boundary = p12_boundary_nearest ( m, n, point )

%*****************************************************************************80
%
%% P12_BOUNDARY_NEAREST returns a nearest boundary point in problem 12.
%
%  Discussion:
%
%    Actually, we only need "reasonably accurate" values when the point
%    to be tested is outside the region, and not to far from it.  Since
%    the politics of interior propinquity are surprisingly complicated for
%    this region, we will plump for a simple, approximate scheme.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 April 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, the spatial dimension.
%
%    Input, integer N, the number of points.
%
%    Input, real POINT(M,N), the coordinates of the points.
%
%    Output, real BOUNDARY(M,N), points on the boundary
%    that are nearest to each point.
%
  x1 = 0.000;
  x2 = 0.500;
  x2p5 = 0.5625;
  x3 = 0.625;
  x3p5 = 0.8125;
  x4 = 1.000;
  y1 = 0.000;
  y2 = 0.250;
  y2p5 = 0.31250;
  y3 = 0.375;
  y4 = 1.000;

  t1(1:2,1:3) = [ ...
    0.0000, 0.0000; ...
    0.5000, 0.0000; ...
    0.2500, 0.2500 ]';

  q1(1:2,1:4) = [ ...
    0.0000, 0.0000; ...
    0.2500, 0.2500; ...
    0.2500, 0.7500; ...
    0.0000, 1.0000 ]';

  t2(1:2,1:3) = [ ...
    0.5000, 0.0000; ...
    0.5000, 0.2500; ...
    0.2500, 0.2500 ]';

  q2(1:2,1:4) = [ ...
    0.2500, 0.2500; ...
    0.5000, 0.2500; ...
    0.5000, 0.3125; ...
    0.2500, 0.3125 ]';

  q3(1:2,1:4) = [ ...
    0.2500, 0.3125; ...
    0.5000, 0.2125; ...
    0.5000, 0.3750; ...
    0.2500, 0.375 ]';

  q4(1:2,1:4) = [ ...
    0.5000, 0.3750; ...
    0.5000, 1.0000; ...
    0.2500, 0.7500; ...
    0.2500, 0.375 ]';

  t3(1:2,1:3) = [ ...
    0.5000, 1.0000; ...
    0.0000, 1.0000; ...
    0.2500, 0.7500 ]';

  q5(1:2,1:4) = [ ...
    0.5000, 0.0000; ...
    0.5625, 0.0000; ...
    0.5625, 0.0625; ...
    0.5000, 0.1250 ]';

  q6(1:2,1:4) = [ ...
    0.6250, 0.0000; ...
    0.6250, 0.1250; ...
    0.6625, 0.0625; ...
    0.6625, 0.0000 ]';

  t4(1:2,1:3) = [ ...
    0.5000, 0.1250; ...
    0.5625, 0.0625; ...
    0.6250, 0.1250 ]';

  t5(1:2,1:3) = [ ...
    0.5000, 0.3750; ...
    0.6250, 0.3750; ...
    0.5625, 0.4375 ]';

  q7(1:2,1:4) = [ ...
    0.5000, 0.3750; ...
    0.5625, 0.4375; ...
    0.5625, 1.0000; ...
    0.5000, 1.0000 ]';

  q8(1:2,1:4) = [ ...
    0.6250, 0.3750; ...
    0.6250, 1.0000; ...
    0.5626, 1.0000; ...
    0.5625, 0.4375 ]';

  t6(1:2,1:3) = [ ...
    0.6250, 0.0000; ...
    1.0000, 0.0000; ...
    0.8125, 0.1875 ]';

  q9(1:2,1:4) = [ ...
    0.6250, 0.0000; ...
    0.8125, 0.1875; ...
    0.8125, 0.2500; ...
    0.6250, 0.2500 ]';

  q10(1:2,1:4) = [ ...
    0.6250, 0.2500; ...
    0.8125, 0.2500; ...
    0.8125, 0.3125; ...
    0.6250, 0.3125 ]';

  q11(1:2,1:4) = [ ...
    0.6250, 0.3125; ...
    0.8125, 0.3125; ...
    0.8125, 0.3750; ...
    0.6250, 0.3750 ]';

  q12(1:2,1:4) = [ ...
    0.6250, 0.3750; ...
    0.8125, 0.3750; ...
    0.8125, 0.8125; ...
    0.6250, 1.0000 ]';

  q13(1:2,1:4) = [ ...
    1.0000, 0.0000; ...
    1.0000, 1.0000; ...
    0.8125, 0.8125; ...
    0.8125, 0.1875 ]';

  t7(1:2,1:3) = [ ...
    0.6250, 1.0000; ...
    0.8125, 0.8125; ...
    1.0000, 1.0000 ]';

  for j = 1 : n
%
%  Column 1
%
    if ( point(1,j) <= x1 & point(2,j) <= y1 )

      boundary(1,j) = x1;
      boundary(2,j) = y1;

    elseif ( point(1,j) <= x1 & point(2,j) <= y4 )

      boundary(1,j) = x1;
      boundary(2,j) = point(2,j);

    elseif ( point(1,j) <= x1 & y4 <= point(2,j) )

      boundary(1,j) = x1;
      boundary(2,j) = y4;
%
%  Column 2
%
    elseif ( point(1,j) <= x2 & point(2,j) <= y1 )

      boundary(1,j) = point(1,j);
      boundary(2,j) = y1;

    elseif ( triangle_contains_point_2d ( t1, point(1:2,j) ) )

      boundary(1,j) = point(1,j);
      boundary(2,j) = y1;

    elseif ( quad_contains_point_2d ( q1, point(1:2,j) ) )

      boundary(1,j) = x1;
      boundary(2,j) = point(2,j);

    elseif ( quad_contains_point_2d ( t2, point(1:2,j) ) )

      boundary(1,j) = x2;
      boundary(2,j) = point(2,j);

    elseif ( quad_contains_point_2d ( q2, point(1:2,j) ) )

      boundary(1,j) = x2;
      boundary(2,j) = y2;

    elseif ( quad_contains_point_2d ( q3, point(1:2,j) ) )

      boundary(1,j) = x2;
      boundary(2,j) = y3;

    elseif ( quad_contains_point_2d ( q4, point(1:2,j) ) )

      boundary(1,j) = x2;
      boundary(2,j) = point(2,j);

    elseif ( triangle_contains_point_2d ( t3, point(1:2,j) ) )

      boundary(1,j) = point(1,j);
      boundary(2,j) = y4;

    elseif ( point(1,j) <= x2 & y4 <= point(2,j) )

      boundary(1,j) = point(1,j);
      boundary(2,j) = y4;
%
%  Under the H crossbar.
%
    elseif ( point(1,j) <= x2p5 & point(2,j) <= y1 )

      boundary(1,j) = x2;
      boundary(2,j) = y1;

    elseif ( point(1,j) <= x3 & point(2,j) <= y1 )

      boundary(1,j) = x3;
      boundary(2,j) = y1;

    elseif ( quad_contains_point_2d ( q5, point(1:2,j) ) )

      boundary(1,j) = x2;
      boundary(2,j) = point(2,j);

    elseif ( quad_contains_point_2d ( q6, point(1:2,j) ) )

      boundary(1,j) = x3;
      boundary(2,j) = point(2,j);

    elseif ( triangle_contains_point_2d ( t4, point(1:2,j) ) )

      boundary(1,j) = point(1,j);
      boundary(2,j) = y2;
%
%  In the H crossbar.
%
    elseif ( point(1,j) <= x3 & y2 <= point(2,j) & point(2,j) <= y2p5 )

      boundary(1,j) = point(1,j);
      boundary(2,j) = y2;

    elseif ( point(1,j) <= x3 & y2p5 <= point(2,j) & point(2,j) <= y3 )

      boundary(1,j) = point(1,j);
      boundary(2,j) = y3;
%
%  Above the H crossbar.
%
    elseif ( triangle_contains_point_2d ( t5, point(1:2,j) ) )

      boundary(1,j) = point(1,j);
      boundary(2,j) = y3;

    elseif ( quad_contains_point_2d ( q7, point(1:2,j) ) )

      boundary(1,j) = x2;
      boundary(2,j) = point(2,j);

    elseif ( quad_contains_point_2d ( q8, point(1:2,j) ) )

      boundary(1,j) = x3;
      boundary(2,j) = point(2,j);

    elseif ( point(1,j) <= x2p5 & y4 <= point(2,j) )

      boundary(1,j) = x2;
      boundary(2,j) = y4;

    elseif ( point(1,j) <= x3 & y4 <= point(2,j) )

      boundary(1,j) = x3;
      boundary(2,j) = y4;
%
%  Column 4
%
    elseif ( point(1,j) <= x4 & point(2,j) <= y1 )

      boundary(1,j) = point(1,j);
      boundary(2,j) = y1;

    elseif ( triangle_contains_point_2d ( t6, point(1:2,j) ) )

      boundary(1,j) = point(1,j);
      boundary(2,j) = y1;

    elseif ( quad_contains_point_2d ( q9, point(1:2,j) ) )

      boundary(1,j) = x3;
      boundary(2,j) = point(2,j);

    elseif ( quad_contains_point_2d ( q10, point(1:2,j) ) )

      boundary(1,j) = x3;
      boundary(2,j) = y2;

    elseif ( quad_contains_point_2d ( q11, point(1:2,j) ) )

      boundary(1,j) = x3;
      boundary(2,j) = y3;

    elseif ( quad_contains_point_2d ( q12, point(1:2,j) ) )

      boundary(1,j) = x3;
      boundary(2,j) = point(2,j);

    elseif ( quad_contains_point_2d ( q13, point(1:2,j) ) )

      boundary(1,j) = x4;
      boundary(2,j) = point(2,j);

    elseif ( triangle_contains_point_2d ( t7, point(1:2,j) ) )

      boundary(1,j) = point(1,j);
      boundary(2,j) = y4;

    elseif ( point(1,j) <= x4 & y4 <= point(2,j) )

      boundary(1,j) = point(1,j);
      boundary(2,j) = y4;
%
%  Column 5
%
    elseif ( x4 <= point(1,j) & point(2,j) <= y1 )

      boundary(1,j) = x4;
      boundary(2,j) = y1;

    elseif ( x4 <= point(1,j) & point(2,j) <= y4 )

      boundary(1,j) = x4;
      boundary(2,j) = point(2,j);

    elseif ( x4 <= point(1,j) & y4 <= point(2,j) )

      boundary(1,j) = x4;
      boundary(2,j) = y4;
    else

      fprintf ( 1, '\n' );
      fprintf ( 1, 'P12_BOUNDARY_NEAREST - Fatal error!\n' );
      fprintf ( 1, '  Orphan point = ( %f, %f )\n', point(1:2,j) );
      error ( 'P12_BOUNDARY_NEAREST - Fatal error!' );

    end

  end

  return
end

