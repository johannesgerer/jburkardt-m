function a = wilk21_inverse ( n )

%*****************************************************************************80
%
%% WILK21_INVERSE returns the inverse of the WILK21 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 November 2007
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

  for i = 1 : n
    y(i) = round ( abs ( i - ( n + 1 ) / 2.0 ) );
  end

  d(n) = y(n);
  for i = n - 1 : -1 : 1
    d(i) = y(i) - 1.0 / d(i+1);
  end

  e(1) = y(1);
  for i = 2 : n
    e(i) = y(i) - 1.0 / e(i-1);
  end

  for i = 1 : n
    for j = 1 : i
      a(i,j) = r8_mop ( i + j ) * prod ( d(i+1:n) ) / prod ( e(j:n) );
    end
    for j = i + 1 : n
      a(i,j) = r8_mop ( i + j ) * prod ( d(j+1:n) ) / prod ( e(i:n) );
    end
  end

  return
end
