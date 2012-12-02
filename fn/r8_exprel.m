function value = r8_exprel ( x )

%*****************************************************************************80
%
%% R8_EXPREL evaluates the exponential relative error term of an R8 argument.
%
%  Discussion:
%
%    The relative error term is ( exp ( x ) - 1 ) / x.
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
%    Output, real VALUE, the exponential relative error term
%    at X.
%
  persistent nterms
  persistent xbnd

  if ( isempty ( nterms ) )
    alneps = log ( r8_mach ( 3 ) );
    xn = 3.72 - 0.3 * alneps;
    xln = log ( ( xn + 1.0 ) / 1.36 );
    nterms = r8_aint ( xn - ( xn * xln + alneps ) / ( xln + 1.36 ) + 1.5 );
    xbnd = r8_mach ( 3 );
  end

  absx = abs ( x );

  if ( absx < xbnd )
    value = 1.0;
  elseif ( absx <= 0.5 )
    value = 0.0;
    for i = 1 : nterms
      value = 1.0 + value * x / ( nterms + 2 - i );
    end
  else
    value = ( exp ( x ) - 1.0 ) / x;
  end

  return
end
