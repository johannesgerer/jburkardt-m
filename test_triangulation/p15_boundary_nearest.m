function boundary = p15_boundary_nearest ( m, n, point )

%*****************************************************************************80
%
%% P15_BOUNDARY_NEAREST returns a nearest boundary point in problem 15.
%
%  Discussion:
%
%    The nearest boundary point assignment is incorrect for regions
%    14 and 16, and for regions 21 and 23.  The boundary between each
%    of these pairs of regions is actually a parabola, but we have not
%    bothered to model these exactly.
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
  for j = 1 : n

    x = point(1,j);
    y = point(2,j);
%
%  INTERIOR REGIONS.
%
%  Region 1
%
    if ( -8.0 <=     x              & ...
         -9.0 <= y + x              & ...
                     y - x <= 8.0 )

      boundary(1,j) = -8.0;
      boundary(2,j) = y;
%
%  Region 2
%
    elseif (             y + x <= -9.0 & ...
              -1.0 <=     y             & ...
                          y - x <= -3.0 & ...
                              y <=  0.5 )

      boundary(1,j) = x;
      boundary(2,j) = -1.0;
%
%  Region 3
%
    elseif ( -3.0 <= y - x             & ...
                              x <=  2.0 & ...
                          y     <=  0.0 & ...
               0.0 <=     x             )

      boundary(1,j) = 2.0;
      boundary(2,j) = y;

%
%  Region 4
%
    elseif (  0.0 <= y                  & ...
                               x <=  2.0 & ...
                           y     <=  0.5 & ...
                0.0 <=     x             )

      boundary(1,j) = 2.0;
      boundary(2,j) = 0.0;
%
%  Region 5
%
    elseif (  2.0 <=      x             & ...
               0.0 <=  y                 & ...
                           y - x <= -8.0 & ...
                           y     <=  0.5 )
      boundary(1,j) = x;
      boundary(2,j) = 0.0;
%
%  Region 6
%
    elseif ( -8.0 <= y - x             & ...
                              x <=  8.0 & ...
                          y + x <=  9.0 )
      boundary(1,j) = 8.0;
      boundary(2,j) = y;
%
%  Region 7
%
    elseif (  9.0 <= y + x             & ...
                          y     <=  1.0 & ...
               3.0 <= y - x             & ...
               0.5 <= y                 )

      boundary(1,j) = x;
      boundary(2,j) = 1.0;
%
%  Region 8
%
    elseif (             y - x <=  3.0 & ...
              -2.0 <=     x             & ...
               0.0 <= y                 & ...
                              x <=  0.0 )

      boundary(1,j) = -2.0;
      boundary(2,j) = y;
%
%  Region 9
%
    elseif (              y     <=  0.0 & ...
               -2.0 <=     x             & ...
               -0.5 <= y                 & ...
                               x <=  0.0 )

      boundary(1,j) = -2.0;
      boundary(2,j) =  0.0;
%
%  Region 10
%
    elseif (                  x <= -2.0 & ...
                           y     <=  0.0 & ...
                8.0 <= y - x             & ...
                0.5 <= y                 )

      boundary(1,j) = x;
      boundary(2,j) = 0.0;
%
%  EXTERIOR REGIONS.
%
%  Region 11
%
    elseif (  -1.0 <= y                 & ...
                               x <= -8.0 & ...
                           y     <=  0.0 )

      boundary(1,j) = -8.0;
      boundary(2,j) = y;
%
%  Region 12
%
    elseif (              y     <= -1.0 & ...
                               x <= -8.0 )

      boundary(1,j) = -8.0;
      boundary(2,j) = -1.0;
%
%  Region 13
%
    elseif (                  x <=  2.0 & ...
                           y     <= -1.0 & ...
               -8.0 <=     x             )

      boundary(1,j) = x;
      boundary(2,j) = -1.0;
%
%  Region 14
%  The boundary between regions 14 and 16 is only set approximately.
%
    elseif (                  x <=  3.0 & ...
                           y     <= -1.0 & ...
                2.0 <=     x             )

      boundary(1,j) =  2.0;
      boundary(2,j) = -1.0;
%
%  Region 15
%
    elseif (   2.0 <=     x             & ...
               -1.0 <= y                 & ...
                           y - x <= -2.0 )

      boundary(1,j) =  2.0;
      boundary(2,j) = y;
%
%  Region 16
%  The boundary between regions 14 and 16 is only set approximately.
%
    elseif ( (                 x <= 3.0 & ...
                            y     <= 0.0 & ...
                -2.0 <= y - x            )     ...
            |                                   ...
              (                 x <= 8.0 & ...
                            y     <= 0.0 & ...
                 3.0 <=     x            ) )

      boundary(1,j) = x;
      boundary(2,j) = 0.0;
%
%  Region 17
%
    elseif (   8.0 <=     x             & ...
                           y     <=  0.0 )

      boundary(1,j) = 8.0;
      boundary(2,j) = 0.0;
%
%  Region 18
%
    elseif (              y     <= 1.0  & ...
                8.0 <=     x             & ...
                0.0 <= y                 )

      boundary(1,j) = 8.0;
      boundary(2,j) = y;
%
%  Region 19
%
    elseif (   8.0 <=     x             & ...
                1.0 <= y                 )

      boundary(1,j) = 8.0;
      boundary(2,j) = 1.0;
%
%  Region 20
%
    elseif (  -2.0 <=     x             & ...
                1.0 <= y                 & ...
                               x <= 8.0 )

      boundary(1,j) = x;
      boundary(2,j) = 1.0;
%
%  Region 21
%  The boundary between regions 21 and 23 is only set approximately.
%
    elseif (                  x <= -2.0 & ...
                1.0 <= y                & ...
               -3.0 <=     x             )

      boundary(1,j) = -2.0;
      boundary(2,j) = 1.0;
%
%  Region 22
%
    elseif (                  x <= -2.0 & ...
                           y     <=  1.0 & ...
                2.0 <= y - x             )

      boundary(1,j) = -2.0;
      boundary(2,j) = y;
%
%  Region 23
%  The boundary between regions 21 and 23 is only set approximately.
%
    elseif ( (             y - x <=  2.0 & ...
                 0.0 <= y                 & ...
                -3.0 <=     x                   ...
              ) | (                              ...
                                x <= -3.0 & ...
                 0.0 <= y                 & ...
                -8.0 <=     x ) )

      boundary(1,j) = x;
      boundary(2,j) = 1.0;
%
%  Region 24
%
    elseif ( x <= -8.0 & ...
              0.0 <= y )

      boundary(1,j) = -8.0;
      boundary(2,j) = 0.0;
%
%  Somehow, a point missed all the regions.
%  This should not happen.
%
    else

      fprintf ( 1, '\n' );
      fprintf ( 1, 'P15_BOUNDARY_NEAREST - Fatal error!\n' );
      fprintf ( 1, '  Orphan point = ( %f, %f )\n', point(1:2,j) );
      error ( 'P15_BOUNDARY_NEAREST - Fatal error!' );

    end

  end

  return
end
