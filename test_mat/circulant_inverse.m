function a = circulant_inverse ( n, x )

%*****************************************************************************80
%
%% CIRCULANT_INVERSE returns the inverse of the CIRCULANT matrix.
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
%    01 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Input, real X(N), the values that define the circulant matrix.
%
%    Output, real A(N,N), the matrix.
% 
  lambda = circulant_eigenvalues ( n, x );

  b(1:n,1:n) = 0.0;

  for i = 1 : n
    if ( lambda(i) ~= 0.0 )
      b(i,i) = 1.0 / conj ( lambda(i) );
    end
  end

  f = fourier ( n );

  a(1:n,1:n) = real ( f' * b * f );

  return
end
