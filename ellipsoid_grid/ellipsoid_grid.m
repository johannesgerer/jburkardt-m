function xyz = ellipsoid_grid ( n, r, c, ng )

%*****************************************************************************80
%
%% ELLIPSOID_GRID generates the grid points inside an ellipsoid.
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
%    Input, integer NG, the number of grid points inside the ellipsoid.
%
%    Output, real XYZ(3,NG), the grid point coordinates.
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

  xyz = zeros ( 3, ng );

  ng2 = 0;

  for k = 0 : nk
    z = c(3) + k * h;
    for j = 0 : nj
      y = c(2) + j * h;
      for i = 0 : ni
        x = c(1) + i * h;
%
%  If we have left the ellipsoid, the I loop is completed.
%
        if ( 1 < ( ( x - c(1) ) / r(1) ).^2 ...
               + ( ( y - c(2) ) / r(2) ).^2 ...
               + ( ( z - c(3) ) / r(3) ).^2 )
          break
        end
%
%  At least one point is generated, but more possible by symmetry.
%
        p = [ x, y, z ]';
        np = 1;
        if ( 0 < i )
          q = p;
          q(1,:) = 2 * c(1) - q(1,:);
          p = [ p, q ];
          np = 2 * np;
        end
        if ( 0 < j )
          q = p;
          q(2,:) = 2 * c(2) - q(2,:);
          p = [ p, q ];
          np = 2 * np;
        end
        if ( 0 < k )
          q = p;
          q(3,:) = 2 * c(3) - q(3,:);
          p = [ p, q ];
          np = 2 * np;
        end
        xyz(1:3,ng2+1:ng2+np) = p(1:3,1:np);
        ng2 = ng2 + np;
      end
    end
  end

  return
end
