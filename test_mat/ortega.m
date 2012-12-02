function a = ortega ( n, u, v, d )

%*****************************************************************************80
%
%% ORTEGA returns the ORTEGA matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 September 2008
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    James Ortega,
%    Generation of Test Matrices by Similarity Transformations,
%    Communications of the ACM,
%    Volume 7, 1964, pages 377-378.
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%    2 <= N.
%
%    Input, real U(N), V(N), vectors which define the matrix.
%    U'V must not equal -1.0.  If, in fact, U'V = 0, and U, V and D are
%    integers, then the matrix, inverse, eigenvalues, and eigenvectors 
%    will be integers.
%
%    Input, real D(N), the desired eigenvalues.
%
%    Output, real A(N,N), the matrix.
%
  u = u(:);
  v = v(:);
  
  vtu = v' * u;

  beta = 1.0 / ( 1.0 + vtu );

  a = zeros(n,n);

  for j = 1 : n
    for i = 1 : n

      a(i,j) = 0.0;

      for k = 1 : n

        if ( i == k )
          bik = 1.0 + u(i) * v(k);
        else
          bik =       u(i) * v(k);
        end

        if ( k == j )
          ckj = 1.0 - beta * u(k) * v(j);
        else
          ckj =     - beta * u(k) * v(j);
        end

        a(i,j) = a(i,j) + bik * d(k) * ckj;

      end
    end
  end

  return
end
