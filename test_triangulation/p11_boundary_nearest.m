function boundary = p11_boundary_nearest ( m, n, point )

%*****************************************************************************80
%
%% P11_BOUNDARY_NEAREST returns a nearest boundary point in problem 11.
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
  q1 = [ ...
    0.00, 0.00; ...
    1.00, 0.00; ...
    0.75, 0.25; ...
    0.25, 0.25 ]';
  q2 = [ ...
    0.00, 0.00; ...
    0.25, 0.25; ...
    0.25, 0.75; ...
    0.00, 1.00 ]';
  q3 = [ ...
    0.50, 0.50; ...
    0.50, 0.25; ...
    0.75, 0.25; ...
    1.00, 0.50 ]';
  q4 = [ ...
    0.50, 0.50; ...
    0.25, 0.50; ...
    0.25, 0.25; ...
    0.50, 0.25 ]';
  q5 = [ ...
    0.50, 0.50; ...
    0.50, 1.00; ...
    0.25, 0.75; ...
    0.25, 0.50 ]';
  t1 = [ ...
    1.00, 0.00; ...
    1.00, 0.50; ...
    0.75, 0.25 ]';
  t2 = [ ...
    0.00, 1.00; ...
    0.25, 0.25; ...
    0.50, 1.00 ]';
  t3 = [ ...
    0.50, 0.50; ...
    1.00, 0.50; ...
    1.00, 1.00 ]';
  t4 = [ ...
    0.50, 0.50; ...
    1.00, 1.00; ...
    0.50, 1.00 ]';

  x1 =  0.0;
  x2 =  0.5;
  x3 = +1.0;
  y1 =  0.0;
  y2 =  0.5;
  y3 = +1.0;

  for j = 1 : n

    if ( point(1,j) <= x1 & point(2,j) <= y1 )

      boundary(1,j) = x1;
      boundary(2,j) = y1;

    elseif ( point(1,j) <= x1 & point(2,j) <= y3 )

      boundary(1,j) = x1;
      boundary(2,j) = point(2,j);

    elseif ( point(1,j) <= x1 & y3 <= point(2,j) )

      boundary(1,j) = x1;
      boundary(2,j) = y3;

    elseif ( point(1,j) <= x3 & point(2,j) <= y1 )

      boundary(1,j) = point(1,j);
      boundary(2,j) = y1;

    elseif ( quad_contains_point_2d ( q1, point(1:2,j) ) )

      boundary(1,j) = point(1,j);
      boundary(2,j) = y1;

    elseif ( quad_contains_point_2d ( q2, point(1:2,j) ) )

      boundary(1,j) = x1;
      boundary(2,j) = point(2,j);

    elseif ( triangle_contains_point_2d ( t1, point(1:2,j) ) )

      boundary(1,j) = x3;
      boundary(2,j) = point(2,j);

    elseif ( quad_contains_point_2d ( q3, point(1:2,j) ) )

      boundary(1,j) = point(1,j);
      boundary(2,j) = y2;

    elseif ( quad_contains_point_2d ( q4, point(1:2,j) ) )

      boundary(1,j) = x2;
      boundary(2,j) = y2;

    elseif ( quad_contains_point_2d ( q5, point(1:2,j) ) )

      boundary(1,j) = x2;
      boundary(2,j) = point(2,j);

    elseif ( triangle_contains_point_2d ( t2, point(1:2,j) ) )

      boundary(1,j) = point(1,j);
      boundary(2,j) = y3;

    elseif ( x1 <= point(1,j) & point(1,j) <= x2 & y3 <= point(2,j) )

      boundary(1,j) = point(1,j);
      boundary(2,j) = y3;

    elseif ( triangle_contains_point_2d ( t3, point(1:2,j) ) )

      boundary(1,j) = point(1,j);
      boundary(2,j) = y2;

    elseif ( triangle_contains_point_2d ( t4, point(1:2,j) ) )

      boundary(1,j) = x2;
      boundary(2,j) = point(2,j);

    elseif ( x2 <= point(1,j) & point(1,j) <= x3 & y3 <= point(2,j) )

      boundary(1,j) = x2;
      boundary(2,j) = y3;

    elseif ( x3 <= point(1,j) & point(2,j) <= y1 )

      boundary(1,j) = x3;
      boundary(2,j) = y1;

    elseif ( x3 <= point(1,j) & y1 <= point(2,j) & point(2,j) <= y2 )

      boundary(1,j) = x3;
      boundary(2,j) = point(2,j);

    elseif ( x3 <= point(1,j) & y2 <= point(2,j) & point(2,j) <= y3 )

      boundary(1,j) = x3;
      boundary(2,j) = y2;

    elseif ( x3 <= point(1,j) & y3 <= point(2,j) & point(2,j) <= point(1,j) )

      boundary(1,j) = x3;
      boundary(2,j) = y2;

    elseif ( x3 <= point(1,j) & y3 <= point(2,j) & point(1,j) <= point(2,j) )

      boundary(1,j) = x2;
      boundary(2,j) = y3;

    else

      fprintf ( 1, '\n' );
      fprintf ( 1, 'P11_BOUNDARY_NEAREST - Fatal error!\n' );
      fprintf ( 1, '  Orphan point = ( %f, %f )\n', point(1:2,j) );
      error ( 'P11_BOUNDARY_NEAREST - Fatal error!' );

    end

  end

  return
end
