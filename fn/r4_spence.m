function value = r4_spence ( x )

%*****************************************************************************80
%
%% R4_SPENCE evaluates a form of Spence's function for an R4 argument.
%
%  Discussion:
%
%    This function evaluates a form of Spence's function defined by
%
%      f(x) = Integral ( 0 <= y <= x ) - log ( abs ( 1 - y ) ) / y dy
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    27 September 2011
%
%  Author:
%
%    Original FORTRAN77 version by Wayne Fullerton.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Milton Abramowitz, Irene Stegun,
%    Handbook of Mathematical Functions, page 1004,
%    National Bureau of Standards, 1964,
%    ISBN: 0-486-61272-4,
%    LC: QA47.A34.
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
%    K Mitchell,
%    Tables of the function Integral ( 0 < y < x ) - log | 1 - y | dy / y
%    with an account of some properties of this and related functions,
%    Philosophical Magazine,
%    Volume 40, pages 351-368, 1949.
%
%  Parameters:
%
%    Input, real X, the argument.
%
%    Output, real VALUE, Spence's function evaluated at X.
%
  persistent nspenc
  persistent pi26
  persistent spencs
  persistent xbig

  pi26 = 1.644934066848226;

  if ( isempty ( nspenc ) )

    spencs = [ ...
      0.1527365598892406, ...
      0.08169658058051014, ...
      0.00581415714077873, ...
      0.00053716198145415, ...
      0.00005724704675185, ...
      0.00000667454612164, ...
      0.00000082764673397, ...
      0.00000010733156730, ...
      0.00000001440077294, ...
      0.00000000198444202, ...
      0.00000000027940058, ...
      0.00000000004003991, ...
      0.00000000000582346, ...
      0.00000000000085767, ...
      0.00000000000012768, ...
      0.00000000000001918, ...
      0.00000000000000290, ...
      0.00000000000000044, ...
      0.00000000000000006 ]';

    nspenc = r4_inits ( spencs, 19, 0.1 * r4_mach ( 3 ) );
    xbig = 1.0 / r4_mach ( 3 );

  end

  if ( x <= - xbig )

    aln = log ( 1.0 - x );
    value = - pi26 - 0.5 * aln * ( 2.0 * log ( - x ) - aln );

  elseif ( x <= - 1.0 )

    aln = log ( 1.0 - x );

    value = - pi26 - 0.5 * aln * ( 2.0 ...
      * log ( - x ) - aln ) + ( 1.0 + r4_csevl ( ...
      4.0 / ( 1.0 - x ) - 1.0, spencs, nspenc ) ) ...
      / ( 1.0 - x );

  elseif ( x <= 0.0 )

    value = - 0.5 * log ( 1.0 - x ) ...
      * log ( 1.0 - x ) - x * ( 1.0 + r4_csevl ( ...
      4.0 * x / ( x - 1.0 ) - 1.0, spencs, nspenc ) ) ...
      / ( x - 1.0 );

  elseif ( x <= 0.5 )

    value = x * ( 1.0 + r4_csevl ( 4.0 * x - 1.0, spencs, nspenc ) );

  elseif ( x < 1.0 )

    value = pi26 - log ( x ) * log ( 1.0 - x ) ...
      - ( 1.0 - x ) * ( 1.0 + r4_csevl ( 4.0 ...
      * ( 1.0 - x ) - 1.0, spencs, nspenc ) );

  elseif ( x == 1.0 )

    value = pi26;

  elseif ( x <= 2.0 )

    value = pi26 - 0.5 * log ( x ) ...
      * log ( ( x - 1.0 ) * ( x - 1.0 ) / x ) ...
      + ( x - 1.0 ) * ( 1.0 + r4_csevl ( 4.0 ...
      * ( x - 1.0 ) / x - 1.0, spencs, nspenc ) ) / x;

  elseif ( x < xbig )

    value = 2.0 * pi26 - 0.5 * log ( x ) * log ( x ) ...
      - ( 1.0 + r4_csevl ( 4.0 / x - 1.0, spencs, ...
      nspenc ) ) / x;

  else

    value = 2.0 * pi26 - 0.5 * log ( x ) * log ( x );

  end

  return
end
