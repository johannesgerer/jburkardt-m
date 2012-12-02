function x = f1_abscissas_ab ( a, b, n )

%*****************************************************************************80
%
%% F1_ABSCISSAS_AB computes Fejer type 1 abscissas for the interval [A,B].
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 July 2012
%
%  Author:
%
%    John Burkardt
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
%    Walter Gautschi,
%    Numerical Quadrature in the Presence of a Singularity,
%    SIAM Journal on Numerical Analysis,
%    Volume 4, Number 3, 1967, pages 357-362.
%
%    Joerg Waldvogel,
%    Fast Construction of the Fejer and Clenshaw-Curtis Quadrature Rules,
%    BIT Numerical Mathematics,
%    Volume 43, Number 1, 2003, pages 1-18.
%
%  Parameters:
%
%    Input, real A, B, the endpoints of the interval.
%
%    Input, integer N, the order of the rule.
%
%    Output, real X(N), the abscissas.
%
  if ( n == 1 )
    x(1) = 0.5 * ( b + a );
    return
  end

  for i = 1 : n
    theta(i) = ( 2 * n - 2 * i + 1 ) * pi ...
             / ( 2 * n             );
  end

  x(1:n) = 0.5 * ( ( b + a ) + ( b - a ) * cos ( theta(1:n) ) );

  return
end
