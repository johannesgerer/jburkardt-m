function value = r8_besi1 ( x )

%*****************************************************************************80
%
%% R8_BESI1 evaluates the Bessel function I of order 1 of an R8 argument.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    29 September 2011
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
%    Output, real VALUE, the Bessel function I of order 1 of X.
%
  persistent bi1cs
  persistent nti1
  persistent xmax
  persistent xmin
  persistent xsml

  if ( isempty ( nti1 ) )

    bi1cs = [ ...
      -0.19717132610998597316138503218149E-02, ...
      +0.40734887667546480608155393652014, ...
      +0.34838994299959455866245037783787E-01, ...
      +0.15453945563001236038598401058489E-02, ...
      +0.41888521098377784129458832004120E-04, ...
      +0.76490267648362114741959703966069E-06, ...
      +0.10042493924741178689179808037238E-07, ...
      +0.99322077919238106481371298054863E-10, ...
      +0.76638017918447637275200171681349E-12, ...
      +0.47414189238167394980388091948160E-14, ...
      +0.24041144040745181799863172032000E-16, ...
      +0.10171505007093713649121100799999E-18, ...
      +0.36450935657866949458491733333333E-21, ...
      +0.11205749502562039344810666666666E-23, ...
      +0.29875441934468088832000000000000E-26, ...
      +0.69732310939194709333333333333333E-29, ...
      +0.14367948220620800000000000000000E-31 ]';

    nti1 = r8_inits ( bi1cs, 17, 0.1 * r8_mach ( 3 ) );
    xmin = 2.0 * r8_mach ( 1 );
    xsml = sqrt ( 8.0 * r8_mach ( 3 ) );
    xmax = log ( r8_mach ( 2 ) );

  end

  y = abs ( x );

  if ( y <= xmin )
    value = 0.0;
  elseif ( y <= xsml )
    value = 0.5 * x;
  elseif ( y <= 3.0 )
    value = x * ( 0.875 + r8_csevl ( y * y / 4.5 - 1.0, bi1cs, nti1 ) );
  elseif ( y <= xmax )
    value = exp ( y ) * r8_besi1e ( x );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_BESI1 - Fatal error!\n' );
    fprintf ( 1, '  Result overflows.\n' );
    error ( 'R8_BESI1 - Fatal error!' )
  end

  return
end
