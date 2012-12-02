function length = polyloop_length_nd ( dim_num, nk, pk )

%*****************************************************************************80
%
%% POLYLOOP_LENGTH_ND computes the length of a polyloop in ND.
%
%  Discussion:
%
%    A polyloop of order NK is the geometric structure consisting of
%    the NK line segments that lie between successive elements of a list
%    of NK points, with the last point joined to the first.
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
%    Input, integer DIM_NUM, the spatial dimension.
%
%    Input, integer NK, the number of points defining the polyloop.
%
%    Input, real PK(DIM_NUM,NK), the points defining the polyloop.
%
%    Output, real LENGTH, the length of the polyloop.
%
  length = 0.0;

  for i = 2 : nk + 1

    if ( i <= nk )
      j = i;
    else
      j = 1;
    end

    length = length + sqrt ( sum ( ( pk(1:dim_num,j) - pk(1:dim_num,i-1) ).^2 ) );

  end

  return
end
