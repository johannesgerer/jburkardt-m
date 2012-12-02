function hf = r8_hyper_2f1 ( a, b, c, x )

%*****************************************************************************80
%
%% R8_HYPER_2F1 evaluates the hypergeometric function F(A,B,C,X).
%
%  Discussion:
%
%    A minor bug was corrected.  The HW variable, used in several places as
%    the "old" value of a quantity being iteratively improved, was not
%    being initialized.  JVB, 11 February 2008.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license. 
%
%  Modified:
%
%    11 February 2010
%
%  Author:
%
%    Original FORTRAN77 version by Shanjie Zhang, Jianming Jin.
%    MATLAB version by John Burkardt.
%
%    The F77 original version of this routine is copyrighted by
%    Shanjie Zhang and Jianming Jin.  However, they give permission to
%    incorporate this routine into a user program provided that the copyright
%    is acknowledged.
%
%  Reference:
%
%    Shanjie Zhang, Jianming Jin,
%    Computation of Special Functions,
%    Wiley, 1996,
%    ISBN: 0-471-11963-6,
%    LC: QA351.C45
%
%  Parameters:
%
%    Input, real A, B, C, X, the arguments of the function.
%    C must not be equal to a nonpositive integer.
%    X < 1.
%
%    Output, real HF, the value of the function.
%
  el = 0.5772156649015329;

  l0 = ( c == floor ( c ) ) && ( c < 0.0 );
  l1 = ( 1.0 - x < 1.0E-15 ) && ( c - a - b <= 0.0 );
  l2 = ( a == floor ( a ) ) && ( a < 0.0 );
  l3 = ( b == floor ( b ) ) && ( b < 0.0 );
  l4 = ( c - a == floor ( c - a ) ) && ( c - a <= 0.0 );
  l5 = ( c - b == floor ( c - b ) ) && ( c - b <= 0.0 );

  if ( l0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_HYPER_2F1 - Fatal error!\n' );
    fprintf ( 1, '  The hypergeometric series is divergent.\n' );
    fprintf ( 1, '  C is integral and negative.\n' );
    fprintf ( 1, '  C = %f\n', c );
    error ( 'R8_HYPER_F1 - Fatal error!' );
  end

  if ( l1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_HYPER_2F1 - Fatal error!\n' );
    fprintf ( 1, '  The hypergeometric series is divergent.\n' );
    fprintf ( 1, '  1 = X < 0, C - A - B <= 0.\n' );
    fprintf ( 1, '  A = %f\n', a );
    fprintf ( 1, '  B = %f\n', b );
    fprintf ( 1, '  C = %f\n', c );
    fprintf ( 1, '  X = %f\n', x );
    error ( 'R8_HYPER_F1 - Fatal error!' );
  end

  if ( 0.95 < x )
    eps = 1.0E-08;
  else
    eps = 1.0E-15;
  end

  if ( x == 0.0 || a == 0.0 || b == 0.0 )

    hf = 1.0;
    return

  elseif ( 1.0 - x == eps && 0.0 < c - a - b )

    gc = gamma ( c );
    gcab = gamma ( c - a - b );
    gca = gamma ( c - a );
    gcb = gamma ( c - b );
    hf = gc * gcab / ( gca * gcb );
    return

  elseif ( 1.0 + x <= eps && abs ( c - a + b - 1.0 ) <= eps )

    g0 = sqrt ( pi ) * 2.0^( - a );
    g1 = gamma ( c );
    g2 = gamma ( 1.0 + a / 2.0 - b );
    g3 = gamma ( 0.5 + 0.5 * a );
    hf = g0 * g1 / ( g2 * g3 );
    return

  elseif ( l2 || l3 )

    if ( l2 )
      nm = floor ( abs ( a ) );
    end

    if ( l3 )
      nm = floor ( abs ( b ) );
    end

    hf = 1.0;
    r = 1.0;

    for k = 1 : nm
      r = r * ( a + k - 1.0 ) * ( b + k - 1.0 ) ...
        / ( k * ( c + k - 1.0 ) ) * x;
      hf = hf + r;
    end

    return

  elseif ( l4 || l5 )

    if ( l4 )
      nm = floor ( abs ( c - a ) );
    end

    if ( l5 )
      nm = floor ( abs ( c - b ) );
    end

    hf = 1.0;
    r  = 1.0;
    for k = 1 : nm
      r = r * ( c - a + k - 1.0 ) * ( c - b + k - 1.0 ) ...
        / ( k * ( c + k - 1.0 ) ) * x;
      hf = hf + r;
    end
    hf = ( 1.0 - x )^( c - a - b ) * hf;
    return

  end

  aa = a;
  bb = b;
  x1 = x;

  if ( x < 0.0 )
    x = x / ( x - 1.0 );
    if ( a < c && b < a && 0.0 < b )
      a = bb;
      b = aa;
    end
    b = c - b;
  end

  if ( 0.75 <= x )

    gm = 0.0;

    if ( abs ( c - a - b - floor ( c - a - b ) ) < 1.0E-15 )

      m = floor ( c - a - b );
      ga = gamma ( a );
      gb = gamma ( b );
      gc = gamma ( c );
      gam = gamma ( a + m );
      gbm = gamma ( b + m );

      pa = r8_psi ( a );
      pb = r8_psi ( b );

      if ( m ~= 0 )
        gm = 1.0;
      end

      for j = 1 : abs ( m ) - 1
        gm = gm * j;
      end

      rm = 1.0;
      for j = 1 : abs ( m )
        rm = rm * j;
      end

      f0 = 1.0;
      r0 = 1.0;
      r1 = 1.0;
      sp0 = 0.0;
      sp = 0.0;

      if ( 0 <= m )

        c0 = gm * gc / ( gam * gbm );
        c1 = - gc * ( x - 1.0 )^m / ( ga * gb * rm );

        for k = 1 : m - 1
          r0 = r0 * ( a + k - 1.0 ) * ( b + k - 1.0 ) ...
            / ( k * ( k - m ) ) * ( 1.0 - x );
          f0 = f0 + r0;
        end

        for k = 1 : m
          sp0 = sp0 + 1.0 / ( a + k - 1.0 ) ...
            + 1.0 / ( b + k - 1.0 ) - 1.0 / k;
        end

        f1 = pa + pb + sp0 + 2.0 * el + log ( 1.0 - x );
        hw = f1;

        for k = 1 : 250

          sp = sp + ( 1.0 - a ) / ( k * ( a + k - 1.0 ) ) ...
            + ( 1.0 - b ) / ( k * ( b + k - 1.0 ) );

          sm = 0.0;
          for j = 1 : m
            sm = sm + ( 1.0 - a ) ...
              / ( ( j + k ) * ( a + j + k - 1.0 ) ) ...
              + 1.0 / ( b + j + k - 1.0 );
          end

          rp = pa + pb + 2.0 * el + sp + sm + log ( 1.0 - x );

          r1 = r1 * ( a + m + k - 1.0 ) * ( b + m + k - 1.0 ) ...
            / ( k * ( m + k ) ) * ( 1.0 - x );

          f1 = f1 + r1 * rp;

          if ( abs ( f1 - hw ) < abs ( f1 ) * eps )
            break
          end

          hw = f1;

        end

        hf = f0 * c0 + f1 * c1;

      elseif ( m < 0 )

        m = - m;
        c0 = gm * gc / ( ga * gb * ( 1.0 - x )^m );
        c1 = - ( - 1 )^m * gc / ( gam * gbm * rm );

        for k = 1 : m - 1
          r0 = r0 * ( a - m + k - 1.0 ) * ( b - m + k - 1.0 ) ...
            / ( k * ( k - m ) ) * ( 1.0 - x );
          f0 = f0 + r0;
        end

        for k = 1 : m
          sp0 = sp0 + 1.0 / k;
        end

        f1 = pa + pb - sp0 + 2.0 * el + log ( 1.0 - x );
        hw = f1;

        for k = 1 : 250

          sp = sp + ( 1.0 - a ) ...
            / ( k * ( a + k - 1.0 ) ) ...
            + ( 1.0 - b ) / ( k * ( b + k - 1.0 ) );

          sm = 0.0;
          for j = 1 : m
            sm = sm + 1.0 / ( j + k );
          end

          rp = pa + pb + 2.0 * el + sp - sm + log ( 1.0 - x );

          r1 = r1 * ( a + k - 1.0 ) * ( b + k - 1.0 ) ...
            / ( k * ( m + k ) ) * ( 1.0 - x );

          f1 = f1 + r1 * rp;

          if ( abs ( f1 - hw ) < abs ( f1 ) * eps )
            break
          end

          hw = f1;

        end

        hf = f0 * c0 + f1 * c1;

      end

    else

      ga = gamma ( a );
      gb = gamma ( b );
      gc = gamma ( c );
      gca = gamma ( c - a );
      gcb = gamma ( c - b );
      gcab = gamma ( c - a - b );
      gabc = gamma ( a + b - c );
      c0 = gc * gcab / ( gca * gcb );
      c1 = gc * gabc / ( ga * gb ) * ( 1.0 - x )^( c - a - b );
      hf = 0.0;
      hw = hf;
      r0 = c0;
      r1 = c1;

      for k = 1 : 250

        r0 = r0 * ( a + k - 1.0 ) * ( b + k - 1.0 ) ...
          / ( k * ( a + b - c + k ) ) * ( 1.0 - x );

        r1 = r1 * ( c - a + k - 1.0 ) * ( c - b + k - 1.0 ) ...
          / ( k * ( c - a - b + k ) ) * ( 1.0 - x );

        hf = hf + r0 + r1;

        if ( abs ( hf - hw ) < abs ( hf ) * eps )
          break
        end

        hw = hf;

      end

      hf = hf + c0 + c1;

    end

  else

    a0 = 1.0;

    if ( a < c && c < 2.0 * a && b < c && c < 2.0 * b )

      a0 = ( 1.0 - x )^( c - a - b );
      a = c - a;
      b = c - b;

    end

    hf = 1.0;
    hw = hf;
    r = 1.0;

    for k = 1 : 250

      r = r * ( a + k - 1.0 ) * ( b + k - 1.0 ) ...
        / ( k * ( c + k - 1.0 ) ) * x;

      hf = hf + r;

      if ( abs ( hf - hw ) <= abs ( hf ) * eps )
        break
      end

      hw = hf;

    end

    hf = a0 * hf;

  end

  if ( x1 < 0.0 )
    x = x1;
    c0 = 1.0 / ( 1.0 - x )^aa;
    hf = c0 * hf;
  end

  if ( 120 < k )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_HYPER_2F1 - Warning!\n' );
    fprintf ( 1, '  A large number of iterations were needed.\n' );
    fprintf ( 1, '  The accuracy of the results should be checked.\n' );
  end

  return
end
