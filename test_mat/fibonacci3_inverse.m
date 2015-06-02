function a = fibonacci3_inverse ( n )

%*****************************************************************************80
%
%% FIBONACCI3_INVERSE returns the inverse of the FIBONACCI3 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 July 2011
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
%    Output, real A(N,N), the inverse of the matrix.
%
  a = zeros ( n, n );

  d(n) = 1.0;
  for i = n - 1 : -1 : 1
    d(i) = 1.0 + 1.0 / d(i+1);
  end

  for i = 1 : n
    for j = 1 : i
      a(i,j) = r8_mop ( i + j ) * prod ( d(i+1:n) ) / prod ( d(1:n+1-j) );
    end
    for j = i + 1 : n
      a(i,j) =                    prod ( d(j+1:n) ) / prod ( d(1:n+1-i) );
    end
  end

  return
end
