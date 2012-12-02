function [ p, seed ] = triangle_unit_sample_03 ( p_num, seed )

%*****************************************************************************80
%
%% TRIANGLE_UNIT_SAMPLE_03 selects points from the unit triangle.
%
%  Discussion:
%
%    The unit triangle has vertices (1,0), (0,1), (0,0).
%
%    This routine uses Turk's rule #1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 August 2004
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
%    Input, integer P_NUM, the number of points.
%
%    Input/output, integer SEED, a seed for the random
%    number generator.
%
%    Output, real P(2,P_NUM), the points.
%

%
%  Generate the points using Turk's rule 1.
%
  for j = 1 : p_num

    [ r, seed ] = r8vec_uniform_01 ( 2, seed);

    a = 1.0            - sqrt ( r(2) );
    b = ( 1.0 - r(1) ) * sqrt ( r(2) );
    c =         r(1)   * sqrt ( r(2) );

    p(1,j) = a;
    p(2,j) = b;

  end

  return
end
