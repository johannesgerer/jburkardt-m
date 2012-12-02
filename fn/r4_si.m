function value = r4_si ( x )

%*****************************************************************************80
%
%% R4_SI evaluates the sine integral Si of an R4 argument.
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
%    Output, real VASLUE, the sine integral Si evaluated at X.
%
  persistent nsi
  persistent sics
  persistent xsml

  if ( isempty ( nsi ) )

    sics = [ ...
      -0.1315646598184841929, ...
      -0.2776578526973601892, ...
       0.0354414054866659180, ...
      -0.0025631631447933978, ...
       0.0001162365390497009, ...
      -0.0000035904327241606, ...
       0.0000000802342123706, ...
      -0.0000000013562997693, ...
       0.0000000000179440722, ...
      -0.0000000000001908387, ...
       0.0000000000000016670, ...
      -0.0000000000000000122 ]';

    nsi = r4_inits ( sics, 12, 0.1 * r4_mach ( 3 ) );
    xsml = sqrt ( eps );

  end

  absx = abs ( x );

  if ( absx < xsml )

    value = x;

  elseif ( absx <= 4.0 )

    value = x * ( 0.75 + r4_csevl ( ( x * x - 8.0 ) * 0.125, sics, nsi ) );

  else

    [ f, g ] = r4_sifg ( absx );
    cosx = cos ( absx );

    if ( x < 0.0 )
      value = - 0.5 * pi + f * cosx + g * sin ( x );
    else
      value = 0.5 * pi - f * cosx - g * sin ( x );
    end

  end

  return
end
