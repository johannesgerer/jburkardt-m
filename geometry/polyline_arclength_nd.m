function s = polyline_arclength_nd ( dim_num, n, p )

%*****************************************************************************80
%
%% POLYLINE_LENGTH_ND computes the length of a polyline in ND.
%
%  Discussion:
%
%    A polyline of order M is the geometric structure consisting of
%    the M-1 line segments that lie between successive elements of a list
%    of M points.
%
%    An ordinary line segment is a polyline of order 2.
%    The letter "V" is a polyline of order 3.
%    The letter "N" is a polyline of order 4, and so on.
%
%    DIST(I+1,I) = sqrt ( sum ( 1 <= J <= DIM_NUM ) ( X(I+1) - X(I) )**2 )
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
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer N, the number of points.
%
%    Input, real P(DIM_NUM,N), the points.
%
%    Output, real S(N), the arclength coordinates
%    of each point.  The first point has S(1) = 0 and the 
%    last point has S(N) = arclength of the entire polyline.
%
  s(1) = 0.0;

  for i = 2 : n

    s(i) = s(i-1) + sqrt ( sum ( ( p(1:dim_num,i) - p(1:dim_num,i-1) ).^2 ) );

  end

  return
end
