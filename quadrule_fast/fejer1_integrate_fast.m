function quad = fejer1_integrate_fast ( f, n )

%*****************************************************************************80
%
%% FEJER1_INTEGRATE_FAST approximates an integral using a Fejer type 1 rule.
%
%  Discussion:
%
%    The function is integrated over the interval [-1,1].
%
%    The abscissas of the rule of order N are
%
%      x(1:n) = cos ( ( 2 * (1:n) - 1 ) / ( 2 * n ) )
%
%    The computation should be very efficient in MATLAB.
%
%  Modified:
%
%    07 October 2006
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
%    Fast Construction of the Fejer and Clenshaw-Curtis Quadrature Rules,
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
  N = [ 1 : 2 : n-1 ]';
  L = length ( N );
  m = n - L;
  k = [ 0 : m-1 ]';
  temp1 = exp ( i * pi * k / n );
  temp2 = zeros ( L+1, 1 );
  v0 = [ 2 * temp1 ./ ( 1 - 4 * k .^ 2 ); temp2 ];
  v1 = v0(1:end-1) + conj ( v0(end:-1:2) );
  w = ifft ( v1 );
  
  x = cos ( pi * ( (1:n)' - 1 / 2 ) / n );
  fx = feval ( f, x );

  quad = w' * fx;

  return
end
