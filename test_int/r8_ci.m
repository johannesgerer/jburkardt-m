function value = r8_ci ( x )

%*****************************************************************************80
%
%% R8_CI computes an approximation to the value of the cosine integral.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 November 2009
%
%  Author:
%
%    Original FORTRAN77 version by Wayne Fullerton, Los Alamos National Laboratory.
%    MATLAB version by John Burkardt.
%
%  Parameters:
%
%    Input, real X, the argument of the cosine integral.
%
%    Output, real VALUE, the value of the cosine integral.
%
  persistent nci

  ncics = 13;

  cics = [ ...
  -0.34004281856055363156, -1.03302166401177456807, ...
   0.19388222659917082877, -0.01918260436019865894, ...
   0.00110789252584784967, -0.00004157234558247209, ...
   0.00000109278524300229, -0.00000002123285954183, ...
   0.00000000031733482164, -0.00000000000376141548, ...
   0.00000000000003622653, -0.00000000000000028912, ...
   0.00000000000000000194 ];

  if ( isempty ( nci ) )
    nci = inits ( cics, ncics, 0.1 * eps );
  end

  if ( x <= 0.0 )

    value = - Inf;

  elseif ( x <= sqrt ( eps ) )

    y = -1.0;
    value = log ( x ) - 0.5 + csevl ( y, cics, nci );

  elseif ( x <= 4.0 )

    y = ( x.^2 - 8.0 ) * 0.125;
    value = log ( x ) - 0.5 + csevl ( y, cics, nci );

  else

    [ f, g ] = r89sifg ( x );
    value = f * sin ( x ) - g * cos ( x );

  end

  return
end
