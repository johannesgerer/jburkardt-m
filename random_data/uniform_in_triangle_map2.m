function [ x, seed ] = uniform_in_triangle_map2 ( v1, v2, v3, n, seed )

%*****************************************************************************80
%
%% UNIFORM_IN_TRIANGLE_MAP2 maps uniform points into a triangle.
%
%  Discussion:
%
%    The triangle is defined by three vertices.  This routine
%    uses Turk's rule #2.
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

    if ( 1.0 < r(1) + r(2) )
      r(1:2) = 1.0 - r(1:2);
    end

    x(1:dim_num,j) = ( ( 1.0 - r(1) - r(2) ) * v1(1:dim_num) ...
                             + r(1)          * v2(1:dim_num) ...
                                    + r(2)   * v3(1:dim_num) )';

  end

  return
end
