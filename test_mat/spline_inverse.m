function a = spline_inverse ( n, x )

%*****************************************************************************80
%
%% SPLINE_INVERSE returns the inverse of the SPLINE matrix.
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
%    Input, real X(N-1), the parameters.
%
%    Output, real A(N,N), the inverse of the matrix.
%
  a = zeros ( n, n );

  d(n) = 2.0 * x(n-1);
  for i = n - 1 : -1 : 2
    d(i) = 2.0 * ( x(i-1) + x(i) ) - x(i) * x(i) / d(i+1);
  end
  d(1) = 2.0 * x(1) - x(1) * x(1) / d(2);

  e(1) = 2.0 * x(1);
  for i = 2 : n - 1
    e(i) = 2.0 * ( x(i-1) + x(i) ) - x(i-1) * x(i-1) / e(i-1);
  end
  e(n) = 2.0 * x(n-1) - x(n-1) * x(n-1) / e(n-1);

  for i = 1 : n
    for j = 1 : i
      a(i,j) = r8_mop ( i + j ) * prod ( x(j:i-1) ) ...
        * prod ( d(i+1:n) ) / prod ( e(j:n) );
    end
    for j = i + 1 : n
      a(i,j) = r8_mop ( i + j ) * prod ( x(i:j-1) ) ...
        * prod ( d(j+1:n) ) / prod ( e(i:n) );
    end
  end

  return
end
