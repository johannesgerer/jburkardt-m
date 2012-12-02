function a = tris_inverse ( n, alpha, beta, gamma )

%*****************************************************************************80
%
%% TRIS_INVERSE returns the inverse of the scalar tridiagonal matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 November 2007
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
%    Input, real ALPHA, BETA, GAMMA, the constant values associated with the 
%    subdiagonal, diagonal and superdiagonal of the matrix.
%
%    Output, real A(N,N), the inverse of the matrix.
%
  a = zeros ( n, n );

  d(1:n) = 0.0;
  d(n) = beta;
  for i = n - 1 : -1 : 1
    d(i) = beta - alpha * gamma / d(i+1);
  end

  for i = 1 : n
    for j = 1 : i
      a(i,j) = r8_mop ( i + j ) * alpha^(i-j) * prod ( d(i+1:n) ) / prod ( d(1:n+1-j) );
    end
    for j = i + 1 : n
      a(i,j) = r8_mop ( i + j ) * gamma^(j-i) * prod ( d(j+1:n) ) / prod ( d(1:n+1-i) );
    end
  end

  return
end
