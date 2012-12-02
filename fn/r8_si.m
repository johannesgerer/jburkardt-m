function value = r8_si ( x )

%*****************************************************************************80
%
%% R8_SI evaluates the sine integral Si of an R8 argument.
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
%    Output, real VALUE, the sine integral Si evaluated at X.
%
  persistent nsi
  persistent sics
  persistent xsml

  if ( isempty ( nsi ) )

    sics = [ ...
      -0.1315646598184841928904275173000457, ...
      -0.2776578526973601892048287660157299, ...
       0.0354414054866659179749135464710086, ...
      -0.0025631631447933977658752788361530, ...
       0.0001162365390497009281264921482985, ...
      -0.0000035904327241606042670004347148, ...
       0.0000000802342123705710162308652976, ...
      -0.0000000013562997692540250649931846, ...
       0.0000000000179440721599736775567759, ...
      -0.0000000000001908387343087145490737, ...
       0.0000000000000016669989586824330853, ...
      -0.0000000000000000121730988368503042, ...
       0.0000000000000000000754181866993865, ...
      -0.0000000000000000000004014178842446, ...
       0.0000000000000000000000018553690716, ...
      -0.0000000000000000000000000075166966, ...
       0.0000000000000000000000000000269113, ...
      -0.0000000000000000000000000000000858 ]';

    nsi = r8_inits ( sics, 18, 0.1 * r8_mach ( 3 ) );
    xsml = sqrt ( r8_mach ( 3 ) );

  end

  absx = abs ( x );

  if ( absx < xsml )
    value = x;
  elseif ( absx <= 4.0 )
    value = x * ( 0.75 + r8_csevl ( ( x * x - 8.0 ) * 0.125, sics, nsi ) );
  else
    [ f, g ] = r8_sifg ( absx );
    cosx = cos ( absx );
    value = 0.5 * pi - f * cosx - g * sin ( x );
    if ( x < 0.0 )
      value = - value;
    end
  end

  return
end
