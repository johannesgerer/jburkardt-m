function x = scale_to_cube01 ( dim_num, n, x )

%*****************************************************************************80
%
%% SCALE_TO_CUBE01 translates and rescales data to the unit hypercube.
%
%  Discussion:
%
%    In each coordinate dimension I, the minimum and maximum coordinate
%    values M1(I) and M2(I) are determined.
%
%    Then, in each coordinate, the points are rescaled as
%
%      X(I) -> ( X(I) - M1(I) ) / ( M2(I) - M1(I) ).
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
  for i = 1 : dim_num
    xmin(i) = min ( x(i,1:n) );
    xmax(i) = max ( x(i,1:n) );
  end

  for i = 1 : dim_num
    if ( 0.0 < xmax(i) - xmin(i) )
      x(i,1:n) = ( x(i,1:n) - xmin(i) ) / ( xmax(i) - xmin(i) );
    else
      x(i,1:n) = 0.5;
    end
  end

  return
end
