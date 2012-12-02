function [ x, w ] = fejer2_rule_compute ( n )

%*****************************************************************************80
%
%% FEJER2_RULE_COMPUTE computes a Fejer type 2 quadrature rule.
%
%  Modified:
%
%    05 March 2007
%
%  Author:
%
%    Joerg Waldvogel
%
%  Reference:
%
%    Joerg Waldvogel,
%    Fast Construction of the Fejer and Clenshaw-Curtis Quadrature Rules,
%    BIT Numerical Mathematics
%    Volume 43, Number 1, pages 1-18, 2003.
%
%  Parameters:
%
%    Input, integer N, the order of the rule.
%
%    Output, real X(N), W(N), the abscissas and weights of the rule.
%
  if ( n == 1 )

    x(1) = 0.0;
    w(1) = 2.0;

  else

    N = [ 1 : 2 : n ]';
    L = length ( N );
    m = n + 1 - L;
  
    v0 = [ 2./N./(N-2); 1/N(L); zeros(m,1) ];
    v2 = -v0(1:n+1) - v0(n+2:-1:2);

    w = ifft ( v2 );
    x = cos ( pi * ( n:-1:1)' / ( n + 1 ) );

    w = w(2:n+1);

  end

  return
end
