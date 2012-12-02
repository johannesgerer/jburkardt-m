function value = r8_psi ( xx )

%*****************************************************************************80
%
%% R8_PSI evaluates the function Psi(X).
%
%  Discussion:
%
%    This routine evaluates the logarithmic derivative of the
%    Gamma function,
%
%      PSI(X) = d/dX ( GAMMA(X) ) / GAMMA(X)
%             = d/dX LN ( GAMMA(X) )
%
%    for real X, where either
%
%      - XMAX1 < X < - XMIN, and X is not a negative integer,
%
%    or
%
%      XMIN < X.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 February 2008
%
%  Author:
%
%    Original FORTRAN77 version by William Cody.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    William Cody, Anthony Strecok, Henry Thacher,
%    Chebyshev Approximations for the Psi Function,
%    Mathematics of Computation,
%    Volume 27, Number 121, January 1973, pages 123-127.
%
%  Parameters:
%
%    Input, real XX, the argument of the function.
%
%    Output, real VALUE, the value of the function.
%
  four = 4.0;
  fourth = 0.25;
  half = 0.5;
  one = 1.0;
  p1(1:9) = [ ...
   4.5104681245762934160E-03, ...
   5.4932855833000385356, ...
   3.7646693175929276856E+02, ...
   7.9525490849151998065E+03, ...
   7.1451595818951933210E+04, ...
   3.0655976301987365674E+05, ...
   6.3606997788964458797E+05, ...
   5.8041312783537569993E+05, ...
   1.6585695029761022321E+05 ];
  p2(1:7) = [ ...
  -2.7103228277757834192, ...
  -1.5166271776896121383E+01, ...
  -1.9784554148719218667E+01, ...
  -8.8100958828312219821, ...
  -1.4479614616899842986, ...
  -7.3689600332394549911E-02, ...
  -6.5135387732718171306E-21 ];
  piov4 = 0.78539816339744830962;
  q1(1:8) = [ ...
   9.6141654774222358525E+01, ...
   2.6287715790581193330E+03, ...
   2.9862497022250277920E+04, ...
   1.6206566091533671639E+05, ...
   4.3487880712768329037E+05, ...
   5.4256384537269993733E+05, ...
   2.4242185002017985252E+05, ...
   6.4155223783576225996E-08 ];
  q2(1:6) = [ ...
   4.4992760373789365846E+01, ...
   2.0240955312679931159E+02, ...
   2.4736979003315290057E+02, ...
   1.0742543875702278326E+02, ...
   1.7463965060678569906E+01, ...
   8.8427520398873480342E-01 ];
  three = 3.0;
  x01 = 187.0;
  x01d = 128.0;
  x02 = 6.9464496836234126266E-04;
  xinf = 1.70E+38;
  xlarge = 2.04E+15;
  xmax1 = 3.60E+16;
  xmin1 = 5.89E-39;
  xsmall = 2.05E-09;
  zero = 0.0;

  x = xx;
  w = abs ( x );
  aug = zero;
%
%  Check for valid arguments, then branch to appropriate algorithm.
%
  if ( xmax1 <= - x || w < xmin1 )

    if ( zero < x )
      value = - xinf;
    else
      value = xinf;
    end

    return
  end

  if ( x < half )
%
%  X < 0.5, use reflection formula: psi(1-x) = psi(x) + pi * cot(pi*x)
%  Use 1/X for PI*COTAN(PI*X)  when  XMIN1 < |X| <= XSMALL.
%
    if ( w <= xsmall )

      aug = - one / x;
%
%  Argument reduction for cotangent.
%
    else

      if ( x < zero )
        sgn = piov4;
      else
        sgn = - piov4;
      end

      w = w - floor ( w );
      nq = floor ( w * four );
      w = four * ( w - nq * fourth );
%
%  W is now related to the fractional part of 4.0 * X.
%  Adjust argument to correspond to values in the first
%  quadrant and determine the sign.
%
      n = floor ( nq / 2 );

      if ( n + n ~= nq )
        w = one - w;
      end

      z = piov4 * w;

      if ( mod ( n, 2 ) ~= 0 )
        sgn = - sgn;
      end
%
%  Determine the final value for  -pi * cotan(pi*x).
%
      n = floor ( ( nq + 1 ) / 2 );
      if ( mod ( n, 2 ) == 0 )
%
%  Check for singularity.
%
        if ( z == zero )

          if ( zero < x )
            value = -xinf;
          else
            value = xinf;
          end

          return
        end

        aug = sgn * ( four / tan ( z ) );

      else

        aug = sgn * ( four * tan ( z ) );

      end

    end

    x = one - x;

  end
%
%  0.5 <= X <= 3.0.
%
  if ( x <= three )

    den = x;
    upper = p1(1) * x;
    for i = 1 : 7
      den = ( den + q1(i) ) * x;
      upper = ( upper + p1(i+1) ) * x;
    end
    den = ( upper + p1(9) ) / ( den + q1(8) );
    x = ( x - x01 / x01d ) - x02;
    value = den * x + aug;
    return

  end
%
%  3.0 < X.
%
  if ( x < xlarge )
    w = one / ( x * x );
    den = w;
    upper = p2(1) * w;
    for i = 1 : 5
      den = ( den + q2(i) ) * w;
      upper = ( upper + p2(i+1) ) * w;
    end
    aug = ( upper + p2(7) ) / ( den + q2(6) ) - half / x + aug;
  end

  value = aug + log ( x );

  return
end
