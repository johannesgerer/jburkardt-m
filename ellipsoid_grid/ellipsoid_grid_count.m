function ng = ellipsoid_grid_count ( n, r, c )

%*****************************************************************************80
%
%% ELLIPSOID_GRID_COUNT counts the grid points inside an ellipsoid.
%
%  Discussion:
%
%    The ellipsoid is specified as
%
%      ( ( X - C1 ) / R1 )^2 
%    + ( ( Y - C2 ) / R2 )^2 
%    + ( ( Z - C3 ) / R3 )^2 = 1
%
%    The user supplies a number N.  There will be N+1 grid points along
%    the shortest axis.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    05 September 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of subintervals.
%
%    Input, real R(3), the half axis lengths.
%
%    Input, real C(3), the center of the ellipsoid.
%
%    Output, integer NG, the number of grid points inside the ellipsoid.
%
  if ( r(1) == min ( r ) )
    h = 2 * r(1) / ( 2 * n + 1 );
    ni = n;
    nj = ceil ( r(2) / r(1) ) * n;
    nk = ceil ( r(3) / r(1) ) * n;
  elseif ( r(2) == min ( r ) )
    h = 2 * r(2) / ( 2 * n + 1 );
    nj = n;
    ni = ceil ( r(1) / r(2) ) * n;
    nk = ceil ( r(3) / r(2) ) * n;
  else
    h = 2 * r(3) / ( 2 * n + 1 );
    nk = n;
    ni = ceil ( r(1) / r(3) ) * n;
    nj = ceil ( r(2) / r(3) ) * n;
  end

  ng = 0;

  for k = 0 : nk
    z = c(3) + k * h;
    for j = 0 : nj
      y = c(2) + j * h;
      for i = 0 : ni
        x = c(1) + i * h;
        if ( 1 < ( ( x - c(1) ) / r(1) ).^2 ...
               + ( ( y - c(2) ) / r(2) ).^2 ...
               + ( ( z - c(3) ) / r(3) ).^2 )
          break
        end
%
%  At least one point is generated, but more possible by symmetry.
%
        np = 1;
        if ( 0 < i )
          np = 2 * np;
        end
        if ( 0 < j )
          np = 2 * np;
        end
        if ( 0 < k )
          np = 2 * np;
        end
        ng = ng + np;

      end
    end
  end

  return
end
