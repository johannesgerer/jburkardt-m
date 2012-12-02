function radius = radius_maximus ( dim_num, n, z, walls )

%*****************************************************************************80
%
%% RADIUS_MAXIMUS finds the biggest possible nonintersecting sphere.
%
%  Discussion:
%
%    We are given a set of N points in DIM_NUM space.  We imagine that
%    at each point simultaneously, a sphere begins to expand.
%    Each sphere stops expanding as soon as it touches another sphere.
%    The radius of these spheres is to be computed.
%
%    If WALLS is true, then the spheres must not extend outside the
%    "walls" of the unit hypersquare.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the number of spatial dimensions.
%
%    Input, integer N, the number of points.
%
%    Input, real Z(DIM_NUM,N), the point coordinates.
%    If WALLS is TRUE, these values must be between 0 and 1.
%
%    Input, logical WALLS, is TRUE if the spheres must not extend
%    outside the unit hypercube.  If WALLS is FALSE, then this
%    restriction is not imposed.
%
%    Output, real RADIUS(N), the radius of the
%    maximal nonintersecting sphere around each point.
%
  FIXED = 0;
  FREE = 1;

  if ( walls )
    if ( any ( z(1:dim_num,1:n) < 0.0 ) )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'RADIUS_MAXIMUS - Fatal error!\n' );
      fprintf ( 1, '  Some coordinate is less than 0.\n' );
      error ( 'RADIUS_MAXIMUS - Fatal error!' );
    elseif ( any ( 1.0 < z(1:dim_num,1:n) ) )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'RADIUS_MAXIMUS - Fatal error!\n' );
      fprintf ( 1, '  Some coordinate is greater than 1.\n' );
      error ( 'RADIUS_MAXIMUS - Fatal error!' );
    end
  end
%
%  Initially, all points are "free".
%
  radius(1:n) = 0.0;
  status(1:n) = FREE;

  while ( 1 )
%
%  If all points are fixed, we're done.
%
    if ( all ( status(1:n) == FIXED ) )
      break
    end
%
%  Look at all the free points.
%  Imagine an expanding sphere at each free point, and determine
%  which such sphere will first have to stop expanding.
%
    next = -1;
    radius_min = r8_huge ( );

    for j1 = 1 : n

      if ( status(j1) == FREE )

        if ( walls )
          radius_i = min ( min ( z(1:dim_num,j1) ), min ( 1.0 - z(1:dim_num,j1) ) );
        else
          radius_i = r8_huge ( );
        end

        for j2 = 1 : n

          if ( j2 ~= j1 )

            distance_j = sqrt ( sum ( ( z(1:dim_num,j1) - z(1:dim_num,j2) ).^2 ) );

            if ( status(j2) == FREE )
              radius_i = min ( radius_i, distance_j / 2.0 );
            else
              radius_i = min ( radius_i, distance_j - radius(j2) );
            end

          end

        end

        if ( radius_i < radius_min )
          next = j1;
          radius_min = radius_i;
        end

      end

    end

    if ( next == -1 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'RADIUS_MAXIMUS - Fatal error!\n' );
      fprintf ( 1, '  There were points left to handle, but could\n' );
      fprintf ( 1, '  not choose the "next" one to work on.\n' );
      error ( 'RADIUS_MAXIMUS - Fatal error!' );
    end

    radius(next) = radius_min;
    status(next) = FIXED;

  end

  return
end
