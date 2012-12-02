function quad = fejer2_integrate_fast ( f, n )

%*****************************************************************************80
%
%% FEJER2_INTEGRATE_FAST approximates an integral using a Fejer type 2 rule.
%
%  Discussion:
%
%    The function is integrated over the interval [-1,1].
%
%    The abscissas of the rule of order N are
%
%      x(1:n) = cos ( ( 0:n-1 ) / n )
%
%    The computation should be very efficient in MATLAB.
%
%  Modified:
%
%    08 October 2006
%
%  Author:
%
%    Joerg Waldvogel
%
%  Reference:
%
%    Charles Clenshaw, Alan Curtis,
%    A Method for Numerical Integration on an Automatic Computer,
%    Numerische Mathematik,
%    Volume 2, Number 1, December 1960, pages 197-205.
%
%    Lloyd Trefethen,
%    Is Gauss Quadrature Better than Clenshaw-Curtis?,
%    SIAM Review,
%    Volume 50, Number 1, 2008, pages 67-87.
%
%    Joerg Waldvogel,
%    Fast Construction of the Fejer and Clenshaw-Curtis Quadrature Rules
%    BIT Numerical Mathematics
%    Volume 43, Number 1, pages 1-18, 2003.
%
%  Parameters:
%
%    Input, function F, an expression, or the name of a function 
%    to integrate.
%
%    Input, integer N, the order of the rule to use.
%    N must be at least 1.
%
%    Output, real QUAD, the approximate integral of the function F
%    over the interval [-1,1], using the quadrature rule.
%
  if ( n == 1 )

    x = 0.0;
    w = 2.0;
    quad = w * feval ( f, x );

  else

    N = [ 1 : 2 : n-1 ]';
    L = length ( N );
    m = n - L;
    v0 = [ 2./N./(N-2); 1/N(end); zeros(m,1) ];
    v2 = -v0(1:end-1) - v0(end:-1:2);
    w = ifft ( v2 );
  
    x = cos ( pi * ( 0:n-1)' / n );
    fx = feval ( f, x ) ;

    quad = w' * fx;

  end

  return
end
