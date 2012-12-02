function n = triangle_unit_lattice_point_num_2d ( s )

%*****************************************************************************80
%
%% TRIANGLE_UNIT_LATTICE_POINT_NUM_2D counts lattice points.
%
%  Discussion:
%
%    The triangle is assumed to be the unit triangle:
%
%    ( (0,0), (1,0), (0,1) )
%
%    or a copy of this triangle scaled by an integer S:
%
%    ( (0,0), (S,0), (0,S) ).
%
%    The routine returns the number of integer lattice points that appear
%    inside the triangle or on its edges or vertices.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 July 2009
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Matthias Beck, Sinai Robins,
%    Computing the Continuous Discretely,
%    Springer, 2006,
%    ISBN13: 978-0387291390,
%    LC: QA640.7.B43.
%
%  Parameters:
%
%    Input, integer S, the scale factor.
%
%    Output, integer N, the number of lattice points.
%
  n = ( ( s + 2 ) * ( s + 1 ) ) / 2;

  return
end
