function cdf = von_mises_cdf ( x, a, b )

%*****************************************************************************80
%
%% VON_MISES_CDF evaluates the von Mises CDF.
%
%  Discussion:
%
%    Thanks to Cameron Huddleston-Holmes for pointing out a discrepancy
%    in the MATLAB version of this routine, caused by overlooking an
%    implicit conversion to integer arithmetic in the original FORTRAN,
%    JVB, 21 September 2005.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 November 2006
%
%  Author:
%
%    Geoffrey Hill
%
%    MATLAB translation by John Burkardt.
%
%  Reference:
%
%    Geoffrey Hill,
%    ACM TOMS Algorithm 518,
%    Incomplete Bessel Function I0: The von Mises Distribution,
%    ACM Transactions on Mathematical Software,
%    Volume 3, Number 3, September 1977, pages 279-284.
%
%    Kanti Mardia, Peter Jupp,
%    Directional Statistics,
%    Wiley, 2000, QA276.M335
%
%  Parameters:
%
%    Input, real X, the argument of the CDF.
%    A - PI <= X <= A + PI.
%
%    Input, real A, B, the parameters of the PDF.
%    -PI <= A <= PI,
%    0.0 < B.
%
%    Output, real CDF, the value of the CDF.
%
  a1 = 12.0;
  a2 = 0.8;
  a3 = 8.0;
  a4 = 1.0;
  c1 = 56.0;
  ck = 10.5;
%
%  We expect -PI <= X - A <= PI.
%
  if ( x - a <= -pi )
    cdf = 0.0;
    return
  end

  if ( pi <= x - a )
    cdf = 1.0;
    return
  end
%
%  Convert the angle (X - A) modulo 2 PI to the range ( 0, 2 * PI ).
%
  z = b;

  u = mod ( x - a + pi, 2.0 * pi );

  if ( u < 0.0 )
    u = u + 2.0 * pi;
  end

  y = u - pi;
%
%  For small B, sum IP terms by backwards recursion.
%
  if ( z <= ck )

    v = 0.0;

    if ( 0.0 < z )

      ip = floor ( z * a2 - a3 / ( z + a4 ) + a1 );
      p = ip;
      s = sin ( y );
      c = cos ( y );
      y = p * y;
      sn = sin ( y );
      cn = cos ( y );
      r = 0.0;
      z = 2.0 / z;

      for n = 2 : ip
        p = p - 1.0;
        y = sn;
        sn = sn * c - cn * s;
        cn = cn * c + y * s;
        r = 1.0 / ( p * z + r );
        v = ( sn / p + v ) * r;
      end

    end

    cdf = ( u * 0.5 + v ) / pi;
%
%  For large B, compute the normal approximation and left tail.
%
  else

    c = 24.0 * z;
    v = c - c1;
    r = sqrt ( ( 54.0 / ( 347.0 / v + 26.0 - c ) - 6.0 + c ) / 12.0 );
    z = sin ( 0.5 * y ) * r;
    s = 2.0 * z * z;
    v = v - s + 3.0;
    y = ( c - s - s - 16.0 ) / 3.0;
    y = ( ( s + 1.75 ) * s + 83.5 ) / v - y;
    arg = z * ( 1.0 - s / y^2 );
    erfx = error_f ( arg );
    cdf = 0.5 * erfx + 0.5;

  end

  cdf = max ( cdf, 0.0 );
  cdf = min ( cdf, 1.0 );

  return
end
