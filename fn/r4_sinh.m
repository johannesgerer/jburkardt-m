function value = r4_sinh ( x )

%*****************************************************************************80
%
%% R4_SINH evaluates the hyperbolic sine of an R4 argument.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 September 2011
%
%  Author:
%
%    Original FORTRAN77 version by Wayne Fullerton.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Wayne Fullerton,
%    Portable Special Function Routines,
%    in Portability of Numerical Software,
%    edited by Wayne Cowell,
%    Lecture Notes in Computer Science, Volume 57,
%    Springer 1977,
%    ISBN: 978-3-540-08446-4,
%    LC: QA297.W65.
%
%  Parameters:
%
%    Input, real X, the argument.
%
%    Output, real VALUE, the hyperbolic sine of X.
%
  persistent nterms
  persistent sinhcs
  persistent sqeps
  persistent ymax

  if ( isempty ( nterms ) )

    sinhcs = [ ...
      0.1730421940471796, ...
      0.08759422192276048, ...
      0.00107947777456713, ...
      0.00000637484926075, ...
      0.00000002202366404, ...
      0.00000000004987940, ...
      0.00000000000007973, ...
      0.00000000000000009 ]';

    nterms = r4_inits ( sinhcs, 8, 0.1 * r4_mach ( 3 ) );
    sqeps = sqrt ( 6.0 * r4_mach ( 3 ) );
    ymax = 1.0 / sqrt ( r4_mach ( 3 ) );

  end

  y = abs ( x );

  if ( y <= sqeps )

    value = x;

  elseif ( y <= 1.0 )

    value = x * ( 1.0 + r4_csevl ( 2.0 * x * x - 1.0, sinhcs, nterms ) );

  else

    y = exp ( y );

    if ( ymax <= y )
      value = 0.5 * y;
    else
      value = 0.5 * ( y - 1.0 / y );
    end

    if ( x < 0.0 )
      value = - value;
    end

  end

  return
end
