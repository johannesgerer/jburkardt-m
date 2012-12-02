function ng = ellipse_grid_count ( n, r, c )

%*****************************************************************************80
%
%% ELLIPSE_GRID_COUNT counts the grid points inside an ellipse.
%
%  Discussion:
%
%    The ellipse is specified as
%
%      ( ( X - C1 ) / R1 )^2 + ( ( Y - C2 ) / R2 )^2 = 1
%
%    The user supplies a number N.  There will be N+1 grid points along
%    the shorter axis.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    10 November 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the number of subintervals.
%
%    Input, real R(2), the half axis lengths.
%
%    Input, real C(2), the center of the ellipse.
%
%    Output, integer NG, the number of grid points inside the ellipse.
%
  if ( r(1) < r(2) )
    h = 2 * r(1) / ( 2 * n + 1 );
    ni = n;
    nj = ceil ( r(2) / r(1) ) * n;
  else
    h = 2 * r(2) / ( 2 * n + 1 );
    nj = n;
    ni = ceil ( r(1) / r(2) ) * n;
  end

  ng = 0;

  for j = 0 : nj
    i = 0;
    x = c(1);
    y = c(2) + j * h;
    ng = ng + 1;
    if ( 0 < j )
      ng = ng + 1;
    end
    while ( 1 )
      i = i + 1;
      x = c(1) + i * h;
      if ( 1 < ( ( x - c(1) ) / r(1) ).^2 + ( ( y - c(2) ) / r(2) ).^2 )
        break
      end
      ng = ng + 1;
      ng = ng + 1;
      if ( 0 < j )
        ng = ng + 1;
        ng = ng + 1;
      end
    end
  end

  return
end
