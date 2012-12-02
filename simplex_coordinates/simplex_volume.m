function volume = simplex_volume ( n, x )

%*****************************************************************************80
%
%% SIMPLEX_VOLUME computes the volume of a simplex.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 September 2010
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the spatial dimension.
%
%    Input, real X(N,N+1), the coordinates of the vertices
%    of a simplex in N dimensions.
%
%    Output, real VOLUME, the volume of the simplex.
%
  a(1:n,1:n) = x(1:n,1:n);
  for j = 1 : n
    a(1:n,j) = a(1:n,j) - x(1:n,n+1);
  end

  volume = abs ( det ( a ) );
  for i = 1 : n
    volume = volume / i;
  end

  return
end
