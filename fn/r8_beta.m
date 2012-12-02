function value = r8_beta ( a, b )

%*****************************************************************************80
%
%% R8_BETA evaluates the beta function of R8 arguments.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 September 2011
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
%    Input, real A, B, the arguments.
%
%    Output, real VALUE, the beta function of A and B.
%
  persistent alnsml
  persistent xmax

  if ( isempty ( xmax ) )
    [ xmin, xmax ] = r8_gaml ( );
    alnsml = log ( r8_mach ( 1 ) );
  end

  if ( a <= 0.0 || b <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_BETA - Fatal error!\n' );
    fprintf ( 1, '  A and B must be greater than 0.\n' );
    error ( 'R8_BETA - Fatal error!' )
  end

  if ( a + b < xmax )
    value = r8_gamma ( a ) * r8_gamma ( b ) / r8_gamma ( a + b );
    return
  end

  value = r8_lbeta ( a, b );

  value = exp ( value );

  return
end
