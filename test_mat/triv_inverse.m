function a = triv_inverse ( n, x, y, z )

%*****************************************************************************80
%
%% TRIV_INVERSE returns the inverse of the TRIV matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 November 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    CM daFonseca, J Petronilho,
%    Explicit Inverses of Some Tridiagonal Matrices,
%    Linear Algebra and Its Applications,
%    Volume 325, 2001, pages 7-21.
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Input, real X(N-1), Y(N), Z(N-1), the vectors that define
%    the subdiagonal, diagonal, and superdiagonal of A.
%
%    Output, real A(N,N), the inverse of the matrix.
%
  d(n) = y(n);
  for i = n - 1 : -1 : 1
    d(i) = y(i) - x(i) * z(i) / d(i+1);
  end

  e(1) = y(1);
  for i = 2 : n
    e(i) = y(i) - x(i-1) * z(i-1) / e(i-1);
  end

  for i = 1 : n
    for j = 1 : i
      a(i,j) = r8_mop ( i + j ) * prod ( x(j:i-1) ) ...
        * prod ( d(i+1:n) ) / prod ( e(j:n) );
    end
    for j = i + 1 : n
      a(i,j) = r8_mop ( i + j ) * prod ( z(i:j-1) ) ...
        * prod ( d(j+1:n) ) / prod ( e(i:n) );
    end
  end

  return
end
