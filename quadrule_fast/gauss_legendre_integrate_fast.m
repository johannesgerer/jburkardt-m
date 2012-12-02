function quad = gauss_legendre_integrate_fast ( f, n )

%*****************************************************************************80
%
%% GAUSS_LEGENDRE_INTEGRATE_FAST applies a Gauss-Legendre quadrature rule.
%
%  Discussion:
%
%    The integration is carried out on the standard interval [-1,1].
%
%    The computation should be very efficient in MATLAB.
%
%  Modified:
%
%    03 March 2007
%
%  Author:
%
%    Lloyd Trefethen
%
%  Reference:
%
%    Lloyd Trefethen,
%    Is Gauss Quadrature Better than Clenshaw-Curtis?
%    SIAM Review,
%    Volume 50, Number 1, 2008, pages 67-87.
%
%  Parameters:
%
%    Input, function F ( x ), the function to be integrated.
%
%    Input, integer N, the order of the quadrature rule.
%
%    Output, real QUAD, the estimate for the integral of F(X).
%
  beta = 0.5 ./ sqrt ( 1 - ( 2 * ( 1:n ) ) .^ (-2) );

  tridiag = diag ( beta, 1 ) + diag ( beta, -1 );

  [ eigval, eigvec ] = eig ( tridiag );

  x = diag ( eigvec );
  [ x, i ] = sort ( x );
  w = 2 * eigval(1,i) .^ 2;

  quad = w * feval ( f, x );
 
  return
end
