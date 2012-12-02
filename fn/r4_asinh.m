function value = r4_asinh ( x )

%*****************************************************************************80
%
%% R4_ASINH evaluates the arc-sine of an R4 argument.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 September 2011
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
%    Output, real VALUE, the arc-hyperbolic sine of X.
%
  persistent aln2
  persistent asnhcs
  persistent nterms
  persistent sqeps
  persistent xmax

  if ( isempty ( nterms ) )
    asnhcs = [ ...
      -0.12820039911738186, ...
      -0.058811761189951768, ...
       0.004727465432212481, ...
      -0.000493836316265361, ...
       0.000058506207058557, ...
      -0.000007466998328931, ...
       0.000001001169358355, ...
      -0.000000139035438587, ...
       0.000000019823169483, ...
      -0.000000002884746841, ...
       0.000000000426729654, ...
      -0.000000000063976084, ...
       0.000000000009699168, ...
      -0.000000000001484427, ...
       0.000000000000229037, ...
      -0.000000000000035588, ...
       0.000000000000005563, ...
      -0.000000000000000874, ...
       0.000000000000000138, ...
      -0.000000000000000021 ]';
    nterms = r4_inits ( asnhcs, 20, 0.1 * r4_mach ( 3 ) );
    aln2 = 0.69314718055994530942;
    sqeps = sqrt ( r4_mach ( 3 ) );
    xmax = 1.0 / sqeps;
  end

  y = abs ( x );

  if ( y <= 1.0 )

    value = x;
    if ( sqeps < y )
      value = x * ( 1.0 + r4_csevl ( 2.0 * x * x - 1.0, asnhcs, nterms ) );
    end

  else

    if ( y < xmax )
      value = log ( y + sqrt ( y * y + 1.0 ) );
    else
      value = aln2 + log ( y );
    end

    if ( x < 0.0 )
      value = - value;
    end

  end

  return
end
