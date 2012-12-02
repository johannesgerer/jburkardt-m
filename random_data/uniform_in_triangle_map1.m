function [ x, seed ] = uniform_in_triangle_map1 ( v1, v2, v3, n, seed )

%*****************************************************************************80
%
%% UNIFORM_IN_TRIANGLE_MAP1 maps uniform points into a triangle.
%
%  Discussion:
%
%    The triangle is defined by three vertices.  This routine
%    uses Turk's rule #1.
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
%
%  Generate the points using Turk's rule 1.
%
  for j = 1 : n

    [ r, seed ] = r8vec_uniform_01 ( 2, seed );

    a = 1.0 - sqrt ( r(2) );
    b = ( 1.0 - r(1) ) * sqrt ( r(2) );
    c = r(1) * sqrt ( r(2) );

    x(1:dim_num,j) = ( a * v1(1:dim_num) ...
                     + b * v2(1:dim_num) ...
                     + c * v3(1:dim_num) )';

  end

  return
end
