function value = r8_lgmc ( x )

%*****************************************************************************80
%
%% R8_LGMC evaluates the log gamma correction factor for an R8 argument.
%
%  Discussion:
%
%    For 10 <= X, compute the log gamma correction factor so that
%
%      log ( gamma ( x ) ) = log ( sqrt ( 2 * pi ) )
%                          + ( x - 0.5 ) * log ( x ) - x
%                          + r8_lgmc ( x )
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
%    Output, real VALUE, the correction factor.
%
  persistent algmcs
  persistent nalgm
  persistent xbig
  persistent xmax

  if ( isempty ( nalgm ) )

    algmcs = [ ...
      +0.1666389480451863247205729650822, ...
      -0.1384948176067563840732986059135E-04, ...
      +0.9810825646924729426157171547487E-08, ...
      -0.1809129475572494194263306266719E-10, ...
      +0.6221098041892605227126015543416E-13, ...
      -0.3399615005417721944303330599666E-15, ...
      +0.2683181998482698748957538846666E-17, ...
      -0.2868042435334643284144622399999E-19, ...
      +0.3962837061046434803679306666666E-21, ...
      -0.6831888753985766870111999999999E-23, ...
      +0.1429227355942498147573333333333E-24, ...
      -0.3547598158101070547199999999999E-26, ...
      +0.1025680058010470912000000000000E-27, ...
      -0.3401102254316748799999999999999E-29, ...
      +0.1276642195630062933333333333333E-30 ]';

    nalgm = r8_inits ( algmcs, 15, r8_mach ( 3 ) );
    xbig = 1.0 / sqrt ( r8_mach ( 3 ) );
    xmax = exp ( min ( log ( r8_mach ( 2 ) / 12.0 ), ...
      - log ( 12.0 * r8_mach ( 1 ) ) ) );
  end

  if ( x < 10.0 )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_LGMC - Fatal error!\n' );
    fprintf ( 1, '  X must be at least 10.\n' );
    error ( 'R8_LGMC - Fatal error!' )

  elseif ( x < xbig )

    value = r8_csevl ( 2.0 * ( 10.0 / x ) ...
      * ( 10.0 / x ) - 1.0, algmcs, nalgm ) / x;

  elseif ( x < xmax )

    value = 1.0 / ( 12.0 * x );

  else

    value = 0.0;

  end

  return
end
