function x = f2_abscissas ( n )

%*****************************************************************************80
%
%% F2_ABSCISSAS computes Fejer Type 2 abscissas.
%
%  Discussion:
%
%    The interval is [-1,+1].
%
%    The abscissas are the cosines of equally spaced angles.
%    The angles are computed as N+2 equally spaced values between 0 and PI,
%    but with the first and last angle omitted.
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
  elseif ( n == 2 )
    x(1) = -0.5;
    x(2) =  0.5;
    return
  end

  for i = 1 : n
    theta(i) = ( n + 1 - i ) * pi ...
             / ( n + 1     );
  end

  x(1:n) = cos ( theta(1:n) );

  return
end
