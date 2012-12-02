function x = daub2_transform_inverse ( n, y )

%*****************************************************************************80
%
%% DAUB2_TRANSFORM_INVERSE inverts the DAUB2 transform of a vector.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 July 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the dimension of the vector.
%    N must be a power of 2.
%
%    Input, real Y(N), the transformed vector.
%
%    Output, real X(N), the original vector.
%
  c = [ 7.071067811865475E-01, ...
        7.071067811865475E-01 ];

  x(1:n,1) = y(1:n);
  z(1:n,1) = 0.0;

  m = 1;

  while ( m * 2 <= n )

    for i = 1 : m
      z(2*i-1,1) = c(1) * ( x(i) + x(i+m) );
      z(2*i,1)   = c(2) * ( x(i) - x(i+m) );
    end

    x(1:2*m,1) = z(1:2*m);

    m = m * 2;

  end

  return
end
