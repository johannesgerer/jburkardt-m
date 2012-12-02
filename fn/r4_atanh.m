function value = r4_atanh ( x )

%*****************************************************************************80
%
%% R4_ATANH evaluates the arc-hyperbolic tangent of an R4 argument.
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
%    Output, real VALUE, the arc-hyperbolic tangent of X.
%
  persistent atnhcs;
  persistent dxrel;
  persistent nterms;
  persistent sqeps;

  if ( isempty ( nterms ) )
    atnhcs = [ ...
    0.094395102393195492E+00;
    0.049198437055786159E+00;
    0.002102593522455432E+00;
    0.000107355444977611E+00;
    0.000005978267249293E+00;
    0.000000350506203088E+00;
    0.000000021263743437E+00;
    0.000000001321694535E+00;
    0.000000000083658755E+00;
    0.000000000005370503E+00;
    0.000000000000348665E+00;
    0.000000000000022845E+00;
    0.000000000000001508E+00;
    0.000000000000000100E+00;
    0.000000000000000006E+00 ];
    nterms = r4_inits ( atnhcs, 15, 0.1 * r4_mach ( 3 ) );
    dxrel = sqrt ( r4_mach ( 4 ) );
    sqeps = sqrt ( 3.0 * r4_mach ( 3 ) );
  end

  y = abs ( x );

  if ( y <= sqeps )
    value = x;
  elseif ( y <= 0.5 )
    value = x * ( 1.0 ...
      + r4_csevl ( 8.0 * x * x - 1.0, atnhcs, nterms ) );
  elseif ( y < 1.0 )
    value = 0.5 * log ( ( 1.0 + x ) / ( 1.0 - x ) );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R4_ATANH - Fatal error!\n' );
    fprintf ( 1, '  1 <= |X|.\n' );
    error ( 'R4_ATANH - Fatal error!' )
  end

  return
end
