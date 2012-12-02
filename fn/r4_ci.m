function value = r4_ci ( x )

%*****************************************************************************80
%
%% R4_CI evaluates the cosine integral Ci of an R4 argument.
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
     -0.34004281856055363156, ...
     -1.03302166401177456807, ...
      0.19388222659917082877, ...
     -0.01918260436019865894, ...
      0.00110789252584784967, ...
     -0.00004157234558247209, ...
      0.00000109278524300229, ...
     -0.00000002123285954183, ...
      0.00000000031733482164, ...
     -0.00000000000376141548, ...
      0.00000000000003622653, ...
     -0.00000000000000028912, ...
      0.00000000000000000194 ]';

    nci = r4_inits ( cics, 13, 0.1 * r4_mach ( 3 ) );
    xsml = sqrt ( r4_mach ( 3 ) );

  end

  if ( x <= 0.0 )

    fprintf ( 1, '\n' );
    fprintf ( 1, 'R4_CI - Fatal error!\n' );
    fprintf ( 1, '  X <= 0.0.\n' );
    error ( 'R4_CI - Fatal error!' )

  elseif ( x <= xsml )

    y = - 1.0;
    value = log ( x ) - 0.5 + r4_csevl ( y, cics, nci );

  elseif ( x <= 4.0 )

    y = ( x * x - 8.0 ) * 0.125;
    value = log ( x ) - 0.5 + r4_csevl ( y, cics, nci );

  else

    [ f, g ] = r4_sifg ( x );
    sinx = sin ( x );
    value = f * sinx - g * cos ( x );

  end

  return
end
