function x = cc_abscissas ( n )

%*****************************************************************************80
%
%% CC_ABSCISSAS computes the Clenshaw Curtis abscissas.
%
%  Discussion:
%
%    The interval is [ -1, 1 ].
%
%    The abscissas are the cosines of equally spaced angles between
%    180 and 0 degrees, including the endpoints.
%
%      X(I) = cos ( ( ORDER - I ) * PI / ( ORDER - 1 ) )
%
%    except for the basic case ORDER = 1, when
%
%      X(1) = 0.
%
%    If the value of ORDER is increased in a sensible way, then
%    the new set of abscissas will include the old ones.  One such
%    sequence would be ORDER(K) = 2*K+1 for K = 0, 1, 2, ...
%
%    When doing interpolation with Lagrange polynomials, the Clenshaw Curtis
%    abscissas can be a better choice than regularly spaced abscissas.
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
%    Charles Clenshaw, Alan Curtis,
%    A Method for Numerical Integration on an Automatic Computer,
%    Numerische Mathematik,
%    Volume 2, Number 1, December 1960, pages 197-205.
%
%    Philip Davis, Philip Rabinowitz,
%    Methods of Numerical Integration,
%    Second Edition,
%    Dover, 2007,
%    ISBN: 0486453391,
%    LC: QA299.3.D28.
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
    theta(i) = ( n - i ) * pi ...
             / ( n - 1 );
  end

  x(1:n) = cos ( theta(1:n) );

  return
end
