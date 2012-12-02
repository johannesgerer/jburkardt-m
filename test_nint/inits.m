function value = inits ( os, nos, eta )

%*****************************************************************************80
%
%% INITS estimates the order of an orthogonal series for a given accuracy.
%
%  Discussion:
%
%    Because this is a function, it is not possible to print out
%    warning error messages.  Therefore, if an error condition is
%    detected, a bogus value of the function is returned.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 March 2007
%
%  Author:
%
%    FORTRAN77 original version by Roger Broucke.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    David Kahaner, Cleve Moler, Steven Nash,
%    Numerical Methods and Software,
%    Prentice Hall, 1989,
%    ISBN: 0-13-627258-4,
%    LC: TA345.K34.
%
%  Parameters:
%
%    Input, real OS(NOS), the coefficients in the series.
%
%    Input, integer NOS, the number of coefficients.  NOS must be
%    at least 1, or an error condition arises.
%
%    Input, real ETA, the requested accuracy of the series.
%    Ordinarily, ETA will be chosen to be one-tenth machine precision.
%
%    Output, integer VALUE, the order of the series guaranteeing the
%    given accuracy.  However, on error, this value will be returned
%    as a negative number.
%

%
%  Fatal error.  Number of coefficients less than 1.
%  But an error message cannot be printed out because this is a function.
%
  if ( nos < 1 )
    value = - Inf;
    return
  end

  err = 0.0;

  i = 0;

  for ii = 1 : nos

    i = nos + 1 - ii;
    err = err + abs ( os(i) );

    if ( eta < err )
      i = nos + 1 - ii;
      break
    end

  end
%
%  Eta may be too small.  Accuracy cannot be guaranteed.
%  But an error message cannot be printed out because this is a function.
%
  if ( i == 0 )
    i = - nos;
  end

  value = i;

  return
end

