function [ p, seed ] = tetrahedron_unit_sample_03 ( p_num, seed )

%*****************************************************************************80
%
%% TETRAHEDRON_UNIT_SAMPLE_03 selects points from the unit tetrahedron.
%
%  Discussion:
%
%    The unit tetrahedron has vertices (1,0,0), (0,1,0), (0,0,1), (0,0,0).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 August 2009
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
%    Output, real P(3,P_NUM), the points.
%
  for j = 1 : p_num

    [ r, seed ] = r8vec_uniform_01 ( 3, seed );

    e = r(1)**(1.0/3.0);
    f = sqrt ( r(2) );
    g = r(3);

    a =   1.0 - e;
    b = ( 1.0 - f )       * e;
    c = ( 1.0 - g ) * f   * e;
    d =         g   * f   * e;

    p(1,j) = a;
    p(2,j) = b;
    p(3,j) = c;

  end

  return
end
