function quad = clenshaw_curtis_integrate_fast ( f, n )

%*****************************************************************************80
%
%% CLENSHAW_CURTIS_INTEGRATE_FAST applies a Clenshaw Curtis quadrature rule.
%
%  Discussion:
%
%    The computation should be very efficient in MATLAB.
%
%  Modified:
%
%    05 March 2007
%
%  Author:
%
%    Lloyd Trefethen
%
%  Reference:
%
%    Philip Davis, Philip Rabinowitz,
%    Methods of Numerical Integration,
%    Second Edition,
%    Dover, 2007,
%    ISBN: 0486453391,
%    LC: QA299.3.D28.
%
%    Lloyd Trefethen,
%    Is Gauss Quadrature Better than Clenshaw-Curtis?,
%    SIAM Review,
%    Volume 50, Number 1, 2008, pages 67-87.
%
%    Joerg Waldvogel,
%    Fast Construction of the Fejer and Clenshaw-Curtis Quadrature Rules,
%    BIT Numerical Mathematics,
%    Volume 43, Number 1, 2003, pages 1-18.
%
%  Parameters:
%
%    Input, function F ( x ), the function to be integrated.
%
%    Input, integer N, the order of the rule.
%
%    Output, real QUAD, the estimate for the integral of F(X).
%
  if ( n == 1 )

    w(1) = 2.0;
    x(1) = 0.0;
    quad = w * feval ( f, x );
 
  else

    x = cos ( pi * (0:n-1)' / ( n - 1 ) );
    fx = feval ( f, x ) / ( 2 * ( n - 1 ) );
    g = real ( fft ( fx ([1:n (n-1):-1:2] )));
    a = [ g(1); g(2:(n-1))+g(2*(n-1):-1:(n+1)); g(n) ];
    w = 0 * a';
    w(1:2:end) = 2 ./ ( 1 - (0:2:(n-1)).^2);
    quad = w * a;

  end

  return
end
