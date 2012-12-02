function x = scale_to_block01 ( dim_num, n, x )

%*****************************************************************************80
%
%% SCALE_TO_BLOCK01 translates and rescales data to fit in the unit block.
%
%  Discussion:
%
%    The minimum and maximum coordinate values M1(I) and M2(I) are
%    determined, and the maximum of M2(I) - M1(I) is used to scale
%    all the coordinates by the same factor.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    03 August 2005
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer DIM_NUM, the dimension of the space.
%
%    Input, integer N, the number of points.
%
%    Input/output, real X(DIM_NUM,N), the data to be modified.
%

%
%  Determine the extremes in each dimension.
%
  xrange = 0.0;
  for i = 1 : dim_num
    xmin(i) = min ( x(i,1:n) );
    xmax(i) = max ( x(i,1:n) );
    xrange = max ( xrange, xmax(i) - xmin(i) );
  end
%
%  Extend all the extremes so that the range is the same in each dimension.
%
  for i = 1 : dim_num
    xrange2 = xrange - ( xmax(i) - xmin(i) );
    xmax(i) = xmax(i) + 0.5 * xrange2;
    xmin(i) = xmin(i) - 0.5 * xrange2;
  end
%
%  Now map the data to [0,1], using a single dilation factor for all dimensions.
%
  if ( 0.0 == xrange )

    x(1:dim_num,1:n) = 0.5;

  else

    for i = 1 : dim_num
      x(i,1:n) = ( x(i,1:n) - xmin(i) ) / xrange;
    end

  end

  return
end
