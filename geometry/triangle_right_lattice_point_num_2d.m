function n = triangle_right_lattice_point_num_2d ( a, b )

%*****************************************************************************80
%
%% TRIANGLE_RIGHT_LATTICE_POINT_NUM_2D: count lattice points.
%
%  Discussion:
%
%    The triangle is assumed to be a right triangle which, without loss
%    of generality, has the coordinates:
%
%    ( (0,0), (a,0), (0,b) )
%
%    The routine returns the number of integer lattice points that appear
%    inside the triangle or on its edges or vertices.
%
%    The formula for this function occurred to me (JVB) after some thought,
%    on 06 July 2009.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    06 July 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer A, B, define the vertices.
%
%    Output, integer N, the number of lattice points.
%
  n = ( ( a + 1 ) * ( b + 1 ) + i4_gcd ( a, b ) + 1 ) / 2;

  return
end
