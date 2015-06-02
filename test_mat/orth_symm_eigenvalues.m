function lambda = orth_symm_eigenvalues ( n )

%*****************************************************************************80
%
%% ORTH_SYMM_EIGENVALUES returns eigenvalues of the ORTH_SYMM matrix.
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
%    Output, real LAMBDA(N,1), the eigenvalues.
%
  lambda = zeros ( n, 1 );

  m = floor ( ( n + 1 ) / 2 );
  lambda(1:m,1)   = +1.0;
  lambda(m+1:n,1) = -1.0;

  return
end
