function v = setsim ( n )

%*****************************************************************************80
%
%% SETSIM defines the simplex.
%
%  Discussion:
%
%    This routine is specified by the user, and defines a simplex
%    in N dimensions by listing its N+1 vertices.
%
%    In this simple example, the vertices are the N unit direction 
%    vectors, and the zero vector.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 June 2003
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the spatial dimension.
%
%    Output, real V(N+1,N), the coordinates of the N+1 vertices.
%
  v(1:n+1,1:n) = 0.0;

  for i = 1 : n
    v(i,i) = 1.0;
  end

  return
end
