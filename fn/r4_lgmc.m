function value = r4_lgmc ( x )

%*****************************************************************************80
%
%% R4_LGMC evaluates the log gamma correction factor for an R4 argument.
%
%  Discussion:
%
%    For 10 <= X, compute the log gamma correction factor so that
%
%      log ( gamma ( x ) ) = log ( sqrt ( 2 * pi ) )
%                          + ( x - 0.5 ) * log ( x ) - x
%                          + r4_lgmc ( x )
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
%    Output, real VALUE, the correction factor.
%
  persistent algmcs
  persistent nalgm
  persistent xbig
  persistent xmax

  if ( isempty ( nalgm ) )

    algmcs = [ ...
      0.166638948045186, ...
     -0.0000138494817606, ...
      0.0000000098108256, ...
     -0.0000000000180912, ...
      0.0000000000000622, ...
     -0.0000000000000003 ]';

    nalgm = r4_inits ( algmcs, 6, r4_mach ( 3 ) );
    xbig = 1.0 / sqrt ( r4_mach ( 3 ) );
    xmax = exp ( min ( log ( r4_mach ( 2 ) / 12.0 ), ...
      - log ( 12.0 * r4_mach ( 1 ) ) ) );
  end

  if ( x < 10.0 )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'R4_LGMC - Fatal error!\n' );
    fprintf ( 1, '  X must be at least 10.\n' );
    error ( 'R4_LGMC - Fatal error!' )

  elseif ( x < xbig )

    value = r4_csevl ( 2.0 * ( 10.0 / x ) ...
      * ( 10.0 / x ) - 1.0, algmcs, nalgm ) / x;

  elseif ( x < xmax )

    value = 1.0 / ( 12.0 * x );

  else

    value = 0.0;

  end

  return
end
