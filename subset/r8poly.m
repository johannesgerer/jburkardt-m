function [ a, val ] = r8poly ( n, a, x0, iopt )

%*****************************************************************************80
%
%% R8POLY performs operations on real polynomials in power or factorial form.
%
%  Discussion:
%
%    The power sum form of a polynomial is
%
%      P(X) = A1 + A2 * X + A3 * X**2 + ... + (AN+1) * X**N
%
%    The Taylor expansion at C has the form
%
%      P(X) = A1 + A2 * (X-C) + A3 * (X-C)**2+... + (AN+1) * (X-C)**N
%
%    The factorial form of a polynomial is
%
%      P(X) = A1 + A2 * X + A3 * (X) * (X-1) + A4 * (X) * (X-1) * (X-2) + ...
%        + (AN+1) * (X) * (X-1) *...* (X-N+1)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    05 July 2004
%
%  Author:
%
%    Original FORTRAN77 version by Albert Nijenhuis, Herbert Wilf.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    A Nijenhuis and H Wilf,
%    Combinatorial Algorithms,
%    Academic Press, 1978, second edition,
%    ISBN 0-12-519260-6.
%
%  Parameters:
%
%    Input, integer N, the number of coefficients in the polynomial
%    (in other words, the polynomial degree + 1)
%
%    Input/output, real A(N), the coefficients of the polynomial.  Depending
%    on the option chosen, these coefficients may be overwritten by those
%    of a different form of the polynomial.
%
%    Input, real X0, for IOPT = -1, 0, or positive, the value of the
%    argument at which the polynomial is to be evaluated, or the
%    Taylor expansion is to be carried out.
%
%    Input, integer IOPT, a flag describing which algorithm is to
%    be carried out:
%
%    -3: Reverse Stirling.  Input the coefficients of the polynomial in
%    factorial form, output them in power sum form.
%
%    -2: Stirling.  Input the coefficients in power sum
%    form, output them in factorial form.
%
%    -1: Evaluate a polynomial which has been input
%    in factorial form.
%
%    0:  Evaluate a polynomial input in power sum form.
%
%    1 or more:  Given the coefficients of a polynomial in
%    power sum form, compute the first IOPT coefficients of
%    the polynomial in Taylor expansion form.
%
%    Output, real A(N), depending on the option, is either the
%    same as the input value of A, or else the requested new polynomial
%    coefficients.
%
%    Output, real VAL, for IOPT = -1 or 0, the value of the
%    polynomial at the point X0.
%
  val = 0.0;

  n1 = min ( n, iopt );
  n1 = max ( 1, n1 );

  if ( iopt < -1 )
    n1 = n;
  end

  delta = ( mod ( max ( -iopt, 0 ), 2 ) );

  w = - n * delta;

  if ( -2 < iopt )
    w = w + x0;
  end

  for m = 1 : n1

    val = 0.0;
    z = w;

    for i = m : n
      z = z + delta;
      val = a(n+m-i) + z * val;
      if ( iopt ~= 0 & iopt ~= -1 )
        a(n+m-i) = val;
      end
    end

    if ( iopt < 0 )
      w = w + 1.0;
    end

  end

  return
end
