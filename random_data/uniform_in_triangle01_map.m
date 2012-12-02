function [ x, seed ] = uniform_in_triangle01_map ( n, seed )

%*****************************************************************************80
%
%% UNIFORM_IN_TRIANGLE01_MAP maps uniform points into the unit triangle.
%
%  Discussion:
%
%    The triangle is defined by the three vertices (1,0), (0,1) and (0,0).
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
%    Input, integer N, the number of points.
%
%    Input/output, integer SEED, a seed for the random number generator.
%
%    Output, real X(2,N), the points.
%
  dim_num = 2;
%
%  Generate the points using barycentric coordinates.
%
  for j = 1 : n

    [ r, seed ] = r8vec_uniform_01 ( dim_num, seed );

    if ( 1.0 < sum ( r(1:dim_num) ) )
      r(1:dim_num) = 1.0 - r(1:dim_num);
    end

    x(1:dim_num,j) = r(1:dim_num)';

  end

  return
end
