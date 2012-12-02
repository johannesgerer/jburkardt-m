function arc_length = polyline_length_nd ( dim_num, nk, pk )

%*****************************************************************************80
%
%% POLYLINE_LENGTH_ND computes the length of a polyline in ND.
%
%  Discussion:
%
%    A polyline of order NK is the geometric structure consisting of
%    the NK-1 line segments that lie between successive elements of a list
%    of NK points.
%
%    An ordinary line segment is a polyline of order 2.
%    The letter "V" is a polyline of order 3.
%    The letter "N" is a polyline of order 4, and so on.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 March 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer NK, the number of points defining the polyline.
%
%    Input, real PK(DIM_NUM,NK), the points defining the polyline.
%
%    Output, real ARC_LENGTH, the length of the polyline.
%
  arc_length = 0.0;

  for i = 2 : nk

    arc_length = arc_length ...
      + sqrt ( sum ( ( pk(1:dim_num,i) - pk(1:dim_num,i-1) ).^2 ) );

  end

  return
end
