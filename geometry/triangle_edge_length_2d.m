function edge_length = triangle_edge_length_2d ( t )

%*****************************************************************************80
%
%% TRIANGLE_EDGE_LENGTH_2D returns edge lengths of a triangle in 2D.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 August 2009
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real T(2,3), the triangle vertices.
%
%    Output, real EDGE_LENGTH(3,1), the length of the edges.
%
  for j1 = 1 : 3
    j2 = i4_wrap ( j1 + 1, 1, 3 );
    edge_length(j1,1) = sqrt ( ( t(1,j2) - t(1,j1) )^2 ...
                             + ( t(2,j2) - t(2,j1) )^2 );
  end

  return
end
