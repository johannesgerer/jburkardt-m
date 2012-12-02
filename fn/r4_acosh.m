function value = r4_acosh ( x )

%*****************************************************************************80
%
%% R4_ACOSH evaluates the arc-hyperbolic cosine of an R4 argument.
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
  persistent aln2
  persistent xmax

  if ( isempty ( xmax ) )
    aln2 = 0.69314718055994530942;
    xmax = 1.0 / sqrt ( r4_mach ( 3 ) );
  end

  if ( x < 1.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R4_ACOSH - Fatal error!\n' );
    fprintf ( 1, '  X < 1.\n' );
    error ( 'R4_ACOSH - Fatal error!' )
  end

  if ( x < xmax )
    value = log ( x + sqrt ( x * x - 1.0 ) );
  else
    value = aln2 + log ( x );
  end

  return
end
