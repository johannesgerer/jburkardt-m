function [ b, c, d ] = least_set ( npoint, x, f, w, nterms )

%*****************************************************************************80
%
%% LEAST_SET defines a least squares polynomial for given data.
%
%  Discussion:
%
%    This routine is based on ORTPOL by Conte and deBoor.
%
%    The polynomial may be evaluated at any point X by calling LEAST_VAL.
%
%    Thanks to Andrew Telford for pointing out a mistake in the form of
%    the check that there are enough unique data points, 25 June 2008.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 June 2008
%
%  Author:
%
%    Original FORTRAN77 version by Samuel Conte, Carl deBoor.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Samuel Conte, Carl deBoor,
%    Elementary Numerical Analysis,
%    Second Edition,
%    McGraw Hill, 1972,
%    ISBN: 07-012446-4,
%    LC: QA297.C65.
%
%  Parameters:
%
%    Input, integer NPOINT, the number of data values.
%
%    Input, real F(NPOINT), the data values at the points X(*).
%
%    Input, real X(NPOINT), the abscissas of the data points.
%    At least NTERMS of the values in X must be distinct.
%
%    Input, real W(NPOINT), the weights associated with
%    the data points.  Each entry of W should be positive.
%
%    Input, integer NTERMS, the number of terms to use in the
%    approximating polynomial.  NTERMS must be at least 1.
%    The degree of the polynomial is NTERMS-1.
%
%    Output, real B(NTERMS), C(NTERMS), D(NTERMS), are quantities
%    defining the least squares polynomial for the input data,
%    which will be needed to evaluate the polynomial.
%
  tol = 0.0;
%
%  Make sure at least NTERMS-1 X values are unique.
%
  unique_num = r8vec_unique_count ( npoint, x, tol );

  if ( unique_num < nterms )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LEAST_SET - Fatal error!\n' );
    fprintf ( 1, '  The number of distinct X values must be\n' );
    fprintf ( 1, '  at least NTERMS = %d\n', nterms );
    fprintf ( 1, '  but the input data has only %d\n', unique_num );
    fprintf ( 1, '  distinct entries.\n' );
    error ( 'LEAST_SET - Fatal error!' );
  end
%
%  Make sure all W entries are positive.
%
  for i = 1 : npoint
    if ( w(i) <= 0.0 )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'LEAST_SET - Fatal error!\n' );
      fprintf ( 1, '  All weights W must be positive,\n' );
      fprintf ( 1, '  but W(%d) = %f.\n', i, w(i) );
      error ( 'LEAST_SET - Fatal error!' );
    end
  end
%
%  Start inner product summations at zero.
%
  b(1:nterms) = 0.0;
  c(1:nterms) = 0.0;
  d(1:nterms) = 0.0;
  s(1:nterms) = 0.0;
%
%  Set the values of P(-1,X) and P(0,X) at all data points.
%
  pjm1(1:npoint) = 0.0;
  pj(1:npoint) = 1.0;
%
%  Now compute the value of P(J,X(I)) as
%
%    P(J,X(I)) = ( X(I) - B(J) ) * P(J-1,X(I)) - C(J) * P(J-2,X(I))
%
%  where
%
%    S(J) = < P(J,X), P(J,X) >
%    B(J) = < x*P(J,X), P(J,X) > / < P(J,X), P(J,X) >
%    C(J) = S(J) / S(J-1)
%
%  and the least squares coefficients are
%
%    D(J) = < F(X), P(J,X) > / < P(J,X), P(J,X) >
%
  for j = 1 : nterms

    d(j) = d(j) + sum ( w(1:npoint) .* f(1:npoint) .* pj(1:npoint) );
    b(j) = b(j) + sum ( w(1:npoint) .* x(1:npoint) .* pj(1:npoint).^2 );
    s(j) = s(j) + sum ( w(1:npoint) .* pj(1:npoint).^2 );

    d(j) = d(j) / s(j);

    if ( j == nterms )
      c(j) = 0.0;
      return
    end

    b(j) = b(j) / s(j);

    if ( j == 1 )
      c(j) = 0.0;
    else
      c(j) = s(j) / s(j-1);
    end

    for i = 1 : npoint
      p = pj(i);
      pj(i) = ( x(i) - b(j) ) * pj(i) - c(j) * pjm1(i);
      pjm1(i) = p;
    end

  end

  return
end


