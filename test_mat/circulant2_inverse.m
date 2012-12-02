function a = circulant2_inverse ( n )

%*****************************************************************************80
%
%% CIRCULANT2_INVERSE returns the inverse of the CIRCULANT2 matrix.
%
%  Discussion:
%
%    The Moore Penrose generalized inverse is computed, so even if
%    the circulant is singular, this routine returns a usable result.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Output, real A(N,N), the matrix.
%
  lambda = circulant2_eigenvalues ( n );

  b(1:n,1:n) = 0.0;

  for i = 1 : n
    if ( lambda(i) ~= 0.0 )
      b(i,i) = 1.0 / conj ( lambda(i) );
    end
  end

  f = fourier ( n );

  a(1:n,1:n) = real ( f(1:n,1:n)' * b(1:n,1:n) * f(1:n,1:n) );

  return
end
