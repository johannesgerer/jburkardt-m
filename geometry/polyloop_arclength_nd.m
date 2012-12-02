function s = polyloop_arclength_nd ( dim_num, n, p )

%*****************************************************************************80
%
%% POLYLOOP_ARCLENGTH_ND computes the arclength of a polyloop in ND.
%
%  Discussion:
%
%    A polyloop of order N is the geometric structure consisting of
%    the N line segments that lie between successive elements of a list
%    of N points, with the last point joined to the first.
%
%    Warning: I just made up the word "polyloop".
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 February 2005
%
%  Author:
%
%    John Burkardt
%
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer N, the number of points.
%
%    Input, real P(DIM_NUM,N), the points.
%
%    Output, real S(N+1), the arclength coordinates
%    of each point.  The first point has two arc length values,
%    namely S(1) = 0 and S(N+1) = LENGTH.
%
  s(1) = 0.0;

  for i = 2 : n + 1

    if ( i <= n )
      j = i;
    else
      j = 1;
    end

    s(i) = s(i-1) + sqrt ( sum ( ( p(1:dim_num,j) - p(1:dim_num,i-1) ).^2 ) );

  end

  return
end
