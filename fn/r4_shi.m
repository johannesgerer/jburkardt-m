function value = r4_shi ( x )

%*****************************************************************************80
%
%% R4_SHI evaluates the hyperbolic sine integral Shi of an R4 argument.
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
%    Output, real VALUE, the hyperbolic sine integral Shi
%    evaluated at X.
%
  persistent nshi
  persistent shics
  persistent xsml

  if ( isempty ( nshi ) )

    shics = [ ...
      0.0078372685688900950695, ...
      0.0039227664934234563973, ...
      0.0000041346787887617267, ...
      0.0000000024707480372883, ...
      0.0000000000009379295591, ...
      0.0000000000000002451817, ...
      0.0000000000000000000467 ]';

    nshi = r4_inits ( shics, 7, 0.1 * r4_mach ( 3 ) );
    xsml = sqrt ( r4_mach ( 3 ) );

  end

  absx = abs ( x );

  if ( absx <= xsml )
    value = x;
  elseif ( absx <= 0.375 )
    value = x * ( 1.0 + r4_csevl ( 128.0 * x * x / 9.0 - 1.0, shics, nshi ) );
  else
    value = 0.5 * ( r4_ei ( x ) + r4_e1 ( x ) );
  end

  return
end
