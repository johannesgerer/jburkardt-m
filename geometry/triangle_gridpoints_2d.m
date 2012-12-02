function [ ngrid, g ] = triangle_gridpoints_2d ( t, nsub, maxgrid )

%*****************************************************************************80
%
%% TRIANGLE_GRIDPOINTS_2D computes gridpoints within a triangle in 2D.
%
%  Discussion:
%
%    The gridpoints are computed by repeated halving of the triangle.
%    The 0-th set of grid points is the vertices themselves.
%    The first set of grid points is the midpoints of the sides.
%    These points can be used to draw 4 triangles that make up the original
%    triangle.  The second set of grid points is the side midpoints and centers
%    of these four triangles.
%
%     NSUB                        NGRID
%    -----                        -----
%        0      1                  =  1  (centroid)
%        1      1 + 2              =  3  (vertices)
%        2      1 + 2 + 3          =  6
%        3      1 + 2 + 3 + 4      = 10
%        4      1 + 2 + 3 + 4 + 5  = 15
%
%    NGRID is the sum of the integers from 1 to NSUB+1 or
%
%      NGRID = (NSUB+1) * (NSUB+2) / 2
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
%  Parameters:
%
%    Input, real T(2,3), the triangle vertices.
%
%    Input, integer NSUB, the number of subdivisions.
%
%    Input, integer MAXGRID, the maximum number of grid points.
%
%    Output, integer NGRID, the number of grid points returned.
%
%    Output, real G(2,MAXGRID), the grid points.
%
  dim_num = 2;
  ngrid = 0;
%
%  Special case, NSUB = 0.
%
  if ( nsub == 0 )
    if ( 1 <= maxgrid )
      ngrid = 1;
      g(1,1) = ( t(1,1) + t(1,2) + t(1,3) ) / 3.0;
      g(2,1) = ( t(2,1) + t(2,2) + t(2,3) ) / 3.0;
    end
    return
  end

  for i = 0 : nsub

    for j = 0 : nsub - i

      if ( ngrid < maxgrid )

        ngrid = ngrid + 1;

        g(1,ngrid) = ( (        i     ) * t(1,1) ...
                     + (            j ) * t(1,2) ...
                     + ( nsub - i - j ) * t(1,3) ) ...
                     / ( nsub         );

        g(2,ngrid) = ( (        i     ) * t(2,1) ...
                     + (            j ) * t(2,2) ...
                     + ( nsub - i - j ) * t(2,3) ) ...
                     / ( nsub         );
      end

    end
  end

  return
end
