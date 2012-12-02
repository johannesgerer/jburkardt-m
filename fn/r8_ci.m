function value = r8_ci ( x )

%*****************************************************************************80
%
%% R8_CI evaluates the cosine integral Ci of an R8 argument.
%
%  Discussion:
%
%    The cosine integral is defined by
%
%      CI(X) = - integral ( X <= T < Infinity ) ( cos ( T ) ) / T  dT
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
%    Output, real VALUE, the cosine integral Ci evaluated at X.
%
  persistent cics
  persistent nci
  persistent xsml

  if ( isempty ( nci ) )

    cics = [ ...
      -0.34004281856055363156281076633129873, ...
      -1.03302166401177456807159271040163751, ...
       0.19388222659917082876715874606081709, ...
      -0.01918260436019865893946346270175301, ...
       0.00110789252584784967184098099266118, ...
      -0.00004157234558247208803840231814601, ...
       0.00000109278524300228715295578966285, ...
      -0.00000002123285954183465219601280329, ...
       0.00000000031733482164348544865129873, ...
      -0.00000000000376141547987683699381798, ...
       0.00000000000003622653488483964336956, ...
      -0.00000000000000028911528493651852433, ...
       0.00000000000000000194327860676494420, ...
      -0.00000000000000000001115183182650184, ...
       0.00000000000000000000005527858887706, ...
      -0.00000000000000000000000023907013943, ...
       0.00000000000000000000000000091001612, ...
      -0.00000000000000000000000000000307233, ...
       0.00000000000000000000000000000000926 ]';

    nci = r8_inits ( cics, 19, 0.1 * r8_mach ( 3 ) );
    xsml = sqrt ( r8_mach ( 3 ) );

  end

  if ( x <= 0.0 )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_CI - Fatal error!\n' );
    fprintf ( 1, '  X <= 0.0.\n' );
    error ( 'R8_CI - Fatal error!' )

  elseif ( x <= xsml )
    y = - 1.0;
    value = log ( x ) - 0.5 + r8_csevl ( y, cics, nci );
  elseif ( x <= 4.0 )
    y = ( x * x - 8.0 ) * 0.125;
    value = log ( x ) - 0.5 + r8_csevl ( y, cics, nci );
  else
    [ f, g ] = r8_sifg ( x );
    sinx = sin ( x );
    value = f * sinx - g * cos ( x );
  end

  return
end
