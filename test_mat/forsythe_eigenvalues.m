function lambda = forsythe_eigenvalues ( alpha, beta, n )

%*****************************************************************************80
%
%% FORSYTHE_EIGENVALUES returns the eigenvalues of the FORSYTHE matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real ALPHA, BETA, define the matrix.  A typical 
%    value of ALPHA is the square root of the machine precision; a typical
%    value of BETA is 0.0.
%
%    Input, integer N, the order of A.
%
%    Output, complex LAMBDA(N,1), the eigenvalues.
%
  lambda = zeros ( n, 1 );

  for i = 1 : n
    angle = 2 * i * pi /n;
    w = exp ( c8_i ( ) * angle );
    lambda(i,1) = beta + ( abs ( alpha ) )^( 1.0 / n ) * w;
  end

  return
end
