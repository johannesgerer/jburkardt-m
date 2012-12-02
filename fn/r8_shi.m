function value = r8_shi ( x )

%*****************************************************************************80
%
%% R8_SHI evaluates the hyperbolic sine integral Shi of an R8 argument.
%
%  Discussion:
%
%    Shi ( x ) = Integral ( 0 <= t <= x ) sinh ( t ) dt / t
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
%    Output, real VALUE, the hyperbolic sine integral
%    Shi evaluated at X.
%
  persistent nshi
  persistent shics
  persistent xsml

  if ( isempty ( nshi ) )

    shics = [ ...
      0.0078372685688900950695200984317332, ...
      0.0039227664934234563972697574427225, ...
      0.0000041346787887617266746747908275, ...
      0.0000000024707480372882742135145302, ...
      0.0000000000009379295590763630457157, ...
      0.0000000000000002451817019520867353, ...
      0.0000000000000000000467416155257592, ...
      0.0000000000000000000000067803072389, ...
      0.0000000000000000000000000007731289, ...
      0.0000000000000000000000000000000711 ]';

    nshi = r8_inits ( shics, 10, 0.1 * r8_mach ( 3 ) );
    xsml = sqrt ( r8_mach ( 3 ) );

  end

  absx = abs ( x );

  if ( absx <= xsml )
    value = x;
  elseif ( absx <= 0.375 )
    value = x * ( 1.0 + r8_csevl ( 128.0 * x * x / 9.0 - 1.0, shics, nshi ) );
  else
    value = 0.5 * ( r8_ei ( x ) + r8_e1 ( x ) );
  end

  return
end
