function value = r4_besk0 ( x )

%*****************************************************************************80
%
%% R4_BESK0 evaluates the Bessel function K of order 0 of an R4 argument.
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
%    Output, real VALUE, the Bessel function K of order 0 of X.
%
  persistent bk0cs
  persistent ntk0
  persistent xmax
  persistent xsml

  if ( isempty ( ntk0 ) )

    bk0cs = [ ...
      -0.03532739323390276872, ...
       0.3442898999246284869, ...
       0.03597993651536150163, ...
       0.00126461541144692592, ...
       0.00002286212103119451, ...
       0.00000025347910790261, ...
       0.00000000190451637722, ...
       0.00000000001034969525, ...
       0.00000000000004259816, ...
       0.00000000000000013744, ...
       0.00000000000000000035 ]';

    ntk0 = r4_inits ( bk0cs, 11, 0.1 * r4_mach ( 3 ) );
    xsml = sqrt ( 4.0 * r4_mach ( 3 ) );
    xmax = - log ( r4_mach ( 1 ) );
    xmax = xmax - 0.5 * xmax * log ( xmax ) ...
      / ( xmax + 0.5 ) - 0.01;
  end

  if ( x <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R4_BESK0 = Fatal error!\n' );
    fprintf ( 1, '  X <= 0.\n' );
    error ( 'R4_BESK0 = Fatal error!' )
  elseif ( x <= xsml )
    y = 0.0;
    value = - log ( 0.5 * x ) * r4_besi0 ( x ) ...
      - 0.25 + r4_csevl ( 0.5 * y - 1.0, bk0cs, ntk0 );
  elseif ( x <= 2.0 )
    y = x * x;
    value = - log ( 0.5 * x ) * r4_besi0 ( x ) ...
      - 0.25 + r4_csevl ( 0.5 * y - 1.0, bk0cs, ntk0 );
  elseif ( x <= xmax )
    value = exp ( - x ) * r4_besk0e ( x );
  else
    value = 0.0;
  end

  return
end
