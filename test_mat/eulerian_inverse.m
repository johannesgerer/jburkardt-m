function a = eulerian_inverse ( n )

%*****************************************************************************80
%
%% EULERIAN_INVERSE computes the inverse of the Eulerian matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Output, real A(N,N), the inverse of the Eulerian matrix.
%

%
%  Set up the Eulerian matrix.
%
  b = eulerian ( n, n );
%
%  Compute the inverse A of a unit lower triangular matrix B.
%
  for  j = 1 : n

    for i = 1 : n

      if ( i < j )

        a(i,j) = 0.0;

      elseif ( i == j )

        a(i,j) = 1.0;

      elseif ( j < i )

        a(i,j) = - b(i,j:i-1) * a(j:i-1,j);

      end

    end

  end

  return
end
