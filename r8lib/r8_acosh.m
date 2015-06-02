function value = r8_acosh ( x )

%*****************************************************************************80
%
%% R8_ACOSH evaluates the arc-hyperbolic cosine of an R8 argument.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 September 2011
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
%    Output, real VALUE, the arc-hyperbolic cosine of X.
%
  persistent dln2;
  persistent xmax;

  if ( isempty ( xmax ) )
    dln2 = 0.69314718055994530941723212145818;
    xmax = 1.0 / sqrt ( r8_tiny ( ) );
  end

  if ( x < 1.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_ACOSH - Fatal error!\n' );
    fprintf ( 1, '  X < 1.0\n' );
    error ( 'R8_ACOSH - Fatal error!' )
  elseif ( x < xmax )
    value = log ( x + sqrt ( x * x - 1.0 ) );
  else
    value = dln2 + log ( x );
  end

  return
end
