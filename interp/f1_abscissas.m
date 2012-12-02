function x = f1_abscissas ( n )

%*****************************************************************************80
%
%% F1_ABSCISSAS computes Fejer type 1 abscissas.
%
%  Discussion:
%
%    The interval is [ -1, +1 ].
%
%    The abscissas are the cosines of equally spaced angles, which
%    are the midpoints of N equal intervals between 0 and PI.
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
%    Input, integer N, the order of the rule.
%
%    Output, real X(N), the abscissas.
%
  if ( n == 1 )
    x(1) = 0.0;
    return
  end

  for i = 1 : n
    theta(i) = ( 2 * n - 2 * i + 1 ) * pi ...
             / ( 2 * n             );
  end

  x(1:n) = cos ( theta(1:n) );

  return
end
