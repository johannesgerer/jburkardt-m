function value = r4_cosh ( x )

%*****************************************************************************80
%
%% R4_COSH evaluates the hyperbolic cosine of an R4 argument.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 September 2011
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
%    Output, real VALUE, the hyperbolic cosine of X.
%
  persistent ymax

  if ( isempty ( ymax ) )
    ymax = 1.0 / sqrt ( r4_mach ( 3 ) );
  end

  y = exp ( abs ( x ) );

  value = 0.5 * y;

  if ( y < ymax )
    value = 0.5 * ( y + 1.0 / y );
  end

  return
end
