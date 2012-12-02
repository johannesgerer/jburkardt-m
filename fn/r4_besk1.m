function value = r4_besk1 ( x )

%*****************************************************************************80
%
%% R4_BESK1 evaluates the Bessel function K of order 1 of an R4 argument.
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
%    Output, real VALUE, the Bessel function K of order 1 of X.
%
  persistent bk1cs
  persistent ntk1
  persistent xmax
  persistent xmin
  persistent xsml

  if ( isempty ( ntk1 ) )

    bk1cs = [ ...
       0.0253002273389477705, ...
      -0.353155960776544876, ...
      -0.122611180822657148, ...
      -0.0069757238596398643, ...
      -0.0001730288957513052, ...
      -0.0000024334061415659, ...
      -0.0000000221338763073, ...
      -0.0000000001411488392, ...
      -0.0000000000006666901, ...
      -0.0000000000000024274, ...
      -0.0000000000000000070 ]';

    ntk1 = r4_inits ( bk1cs, 11, 0.1 * r4_mach ( 3 ) );
    xmin = exp ( max ( log ( r4_mach ( 1 ) ), ...
      - log ( r4_mach ( 2 ) ) ) + 0.01 );
    xsml = sqrt ( 4.0 * r4_mach ( 3 ) );
    xmax = - log ( r4_mach ( 1 ) );
    xmax = xmax - 0.5 * xmax * log ( xmax ) ...
      / ( xmax + 0.5 ) - 0.01;

  end

  if ( x <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R4_BESK1 = Fatal error!\n' );
    fprintf ( 1, '  X <= 0.\n' );
    error ( 'R4_BESK1 = Fatal error!' )
  elseif ( x <= xsml )
    y = 0.0;
    value = log ( 0.5 * x ) * r4_besi1 ( x ) + ( 0.75 ...
      + r4_csevl ( 0.5 * y - 1.0, bk1cs, ntk1 ) ) / x;
  elseif ( x <= 2.0 )
    y = x * x;
    value = log ( 0.5 * x ) * r4_besi1 ( x ) + ( 0.75 ...
      + r4_csevl ( 0.5 * y - 1.0, bk1cs, ntk1 ) ) / x;
  elseif ( x <= xmax )
    value = exp ( - x ) * r4_besk1e ( x );
  else
    value = 0.0;
  end

  return
end
