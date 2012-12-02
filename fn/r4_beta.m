function value = r4_beta ( a, b )

%*****************************************************************************80
%
%% R4_BETA evaluates the beta function of R4 arguments.
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
%    Input, real A, B, the arguments.
%
%    Output, real VALUE, the beta function of A and B.
%
  persistent alnsml
  persistent xmax

  if ( isempty ( xmax ) )
    [ xmin, xmax ] = r4_gaml ( );
    alnsml = log ( r4_mach ( 1 ) );
  end

  if ( a <= 0.0 || b <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R4_BETA - Fatal error!\n' );
    fprintf ( 1, '  A and B must be greater than 0.\n' );
    fprintf ( 1, '  A = %g\n', a );
    fprintf ( 1, '  B = %g\n', b );
    error ( 'R4_BETA - Fatal error!' )
  end

  if ( a + b < xmax )
    value = r4_gamma ( a ) * r4_gamma ( b ) / r4_gamma ( a + b );
    return
  end

  value = r4_lbeta ( a, b );

  value = exp ( value );

  return
end
