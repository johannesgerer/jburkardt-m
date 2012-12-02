function [ x, seed ] = uniform_in_parallelogram_map ( v1, v2, v3, n, seed )

%*****************************************************************************80
%
%% UNIFORM_IN_PARALLELOGRAM_MAP maps uniform points into a parallelogram.
%
%  Discussion:
%
%    The parallelogram is defined by three vertices, V1, V2 and V3.
%    The missing vertex V4 is equal to V2+V3-V1.
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
%  Reference:
%
%    Greg Turk,
%    Generating Random Points in a Triangle,
%    in Graphics Gems,
%    edited by Andrew Glassner,
%    AP Professional, 1990, pages 24-28.
%
%  Parameters:
%
%    Input, real V1(2), V2(2), V3(2), the vertices.
%
%    Input, integer N, the number of points.
%
%    Input/output, integer SEED, a seed for the random number generator.
%
%    Output, real X(2,N), the points.
%
  dim_num = 2;

  for j = 1 : n

    [ r, seed ] = r8vec_uniform_01 ( 2, seed );

    x(1:dim_num,j) = ( ( 1.0 - r(1) - r(2) ) * v1(1:dim_num) ...
                            + r(1)           * v2(1:dim_num) ...
                                   + r(2)    * v3(1:dim_num) )';

  end

  return
end
