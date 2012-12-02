function value = tfun ( h, a, ah )

%*****************************************************************************80
%
%% TFUN computes Owen's T function for a restricted range of parameters.
%
%  Discussion:
%
%    This routine computes Owen's T-function of H and A.
%
%    Originally called "TF", this function was renamed "TFUN" to avoid
%    a conflict with a built in MATLAB routine.
%
%    Thanks to Benjamin Sobotta for pointing out a missing factor of
%    0.5 that occurred where ZNORM1 was used, 15 December 2011.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 December 2011
%
%  Author:
%
%    Original FORTRAN77 version by Mike Patefield, David Tandy.
%    MATLAB version by John Burkardt.
%
%  Reference:
%
%    Mike Patefield, David Tandy,
%    Fast and Accurate Calculation of Owen's T Function,
%    Journal of Statistical Software,
%    Volume 5, Number 5, 2000, pages 1-25.
%
%  Parameters:
%
%    Input, real H, the H argument of the function.
%    0 <= H.
%
%    Input, real A, the A argument of the function.
%    0 <= A <= 1.
%
%    Input, real AH, the value of A*H.
%
%    Output, real VALUE, the value of Owen's T function.
%
  arange(1:7) = [ 0.025, 0.09, 0.15, 0.36, 0.5, 0.9, 0.99999 ];

  c2(1:21) = [ ...
                                   0.99999999999999987510, ...
     -0.99999999999988796462,      0.99999999998290743652, ...
     -0.99999999896282500134,      0.99999996660459362918, ...
     -0.99999933986272476760,      0.99999125611136965852, ...
     -0.99991777624463387686,      0.99942835555870132569, ...
     -0.99697311720723000295,      0.98751448037275303682, ...
     -0.95915857980572882813,      0.89246305511006708555, ...
     -0.76893425990463999675,      0.58893528468484693250, ...
     -0.38380345160440256652,      0.20317601701045299653, ...
     -0.82813631607004984866E-01,  0.24167984735759576523E-01, ...
     -0.44676566663971825242E-02,  0.39141169402373836468E-03 ];

  hrange(1:14) = [ ...
    0.02, 0.06, 0.09, 0.125, 0.26, ...
    0.4,  0.6,  1.6,  1.7,   2.33, ...
    2.4,  3.36, 3.4,  4.8 ];

  meth(1:18) = [ ...
    1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 3, 4, 4, 4, 4, 5, 6 ];

  ord(1:18) = [ ...
    2, 3, 4, 5, 7,10,12,18,10,20,30,20, 4, 7, 8,20,13, 0 ];

  pts(1:13) = [ ...
                                   0.35082039676451715489E-02, ...
      0.31279042338030753740E-01,  0.85266826283219451090E-01, ...
      0.16245071730812277011,      0.25851196049125434828, ...
      0.36807553840697533536,      0.48501092905604697475, ...
      0.60277514152618576821,      0.71477884217753226516, ...
      0.81475510988760098605,      0.89711029755948965867, ...
      0.95723808085944261843,      0.99178832974629703586 ];

  rroot2 = 0.70710678118654752440;
  rrtpi = 0.39894228040143267794;
  rtwopi = 0.15915494309189533577;

  select(1:15,1:8) = [...
    1, 1, 2,13,13,13,13,13,13,13,13,16,16,16, 9; ...
    1, 2, 2, 3, 3, 5, 5,14,14,15,15,16,16,16, 9; ...
    2, 2, 3, 3, 3, 5, 5,15,15,15,15,16,16,16,10; ...
    2, 2, 3, 5, 5, 5, 5, 7, 7,16,16,16,16,16,10; ...
    2, 3, 3, 5, 5, 6, 6, 8, 8,17,17,17,12,12,11; ...
    2, 3, 5, 5, 5, 6, 6, 8, 8,17,17,17,12,12,12; ...
    2, 3, 4, 4, 6, 6, 8, 8,17,17,17,17,17,12,12; ...
    2, 3, 4, 4, 6, 6,18,18,18,18,17,17,17,12,12 ]';

  wts(1:13) = [ ...
                                   0.18831438115323502887E-01, ...
      0.18567086243977649478E-01,  0.18042093461223385584E-01, ...
      0.17263829606398753364E-01,  0.16243219975989856730E-01, ...
      0.14994592034116704829E-01,  0.13535474469662088392E-01, ...
      0.11886351605820165233E-01,  0.10070377242777431897E-01, ...
      0.81130545742299586629E-02,  0.60419009528470238773E-02, ...
      0.38862217010742057883E-02,  0.16793031084546090448E-02 ];
%
%  Determine appropriate method from t1...t6
%
  ihint = 15;

  for i = 1 : 14
    if ( h <= hrange(i) )
      ihint = i;
      break
    end
  end

  iaint = 8;

  for i = 1 : 7
    if ( a <= arange(i) )
      iaint = i;
      break
    end
  end

  icode = select(ihint,iaint);
  m = ord(icode);
%
%  t1(h, a, m) ; m = 2, 3, 4, 5, 7, 10, 12 or 18
%  jj = 2j - 1 ; gj = exp(-h*h/2) * (-h*h/2)**j / j!
%  aj = a**(2j-1) / (2*pi)
%
  if ( meth(icode) == 1 )

    hs = - 0.5 * h * h;
    dhs = exp ( hs );
    as = a * a;
    j = 1;
    jj = 1;
    aj = rtwopi * a;
    value = rtwopi * atan ( a );
    dj = dhs - 1.0;
    gj = hs * dhs;

    while ( 1 )

      value = value + dj * aj / jj;

      if ( m <= j )
        return
      end

      j = j + 1;
      jj = jj + 2;
      aj = aj * as;
      dj = gj - dj;
      gj = gj * hs / j;

    end
%
%  t2(h, a, m) ; m = 10, 20 or 30
%  z = (-1)^(i-1) * zi ; ii = 2i - 1
%  vi = (-1)^(i-1) * a^(2i-1) * exp[-(a*h)^2/2] / sqrt(2*pi)
%
  elseif ( meth(icode) == 2 )

    maxii = m + m + 1;
    ii = 1;
    value = 0.0;
    hs = h * h;
    as = - a * a;
    vi = rrtpi * a * exp ( - 0.5 * ah * ah );
    z = znorm1 ( ah ) / h;
    y = 1.0 / hs;

    while ( 1 )

      value = value + z;

      if ( maxii <= ii )
        value = value * rrtpi * exp ( - 0.5 * hs );
        return
      end

      z = y * ( vi - ii * z );
      vi = as * vi;
      ii = ii + 2;

    end
%
%  t3(h, a, m) ; m = 20
%  ii = 2i - 1
%  vi = a**(2i-1) * exp[-(a*h)**2/2] / sqrt(2*pi)
%
  elseif ( meth(icode) == 3 )

    i = 1;
    ii = 1;
    value = 0.0;
    hs = h * h;
    as = a * a;
    vi = rrtpi * a * exp ( - 0.5 * ah * ah );
    zi = znorm1 ( ah ) / h;
    y = 1.0 / hs;

    while ( 1 )

      value = value + zi * c2(i);

      if ( m < i )
        value = value * rrtpi * exp ( - 0.5 * hs );
        return
      end

      zi = y  * ( ii * zi - vi );
      vi = as * vi;
      i = i + 1;
      ii = ii + 2;

    end
%
%  t4(h, a, m) ; m = 4, 7, 8 or 20;  ii = 2i + 1
%  ai = a * exp[-h*h*(1+a*a)/2] * (-a*a)^i / (2*pi)
%
  elseif ( meth(icode) == 4 )

    maxii = m + m + 1;
    ii = 1;
    hs = h * h;
    as = - a * a;
    value = 0.0;
    ai = rtwopi * a * exp ( - 0.5 * hs * ( 1.0 - as ) );
    yi = 1.0;

    while ( 1 )

      value = value + ai * yi;

      if ( maxii <= ii )
        return
      end

      ii = ii + 2;
      yi = ( 1.0 - hs * yi ) / ii;
      ai = ai * as;

    end
%
%  t5(h, a, m) ; m = 13
%  2m - point gaussian quadrature
%
  elseif ( meth(icode) == 5 )

    value = 0.0;
    as = a * a;
    hs = - 0.5 * h * h;
    for i = 1 : m
      r = 1.0 + as * pts(i);
      value = value + wts(i) * exp ( hs * r ) / r;
    end
    value = a * value;
%
%  t6(h, a);  approximation for a near 1, (a<=1)
%
  elseif ( meth(icode) == 6 )

    normh = znorm2 ( h );
    value = 0.5 * normh * ( 1.0 - normh );
    y = 1.0 - a;
    r = atan ( y / ( 1.0 + a ) );

    if ( r ~= 0.0 )
      value = value - rtwopi * r * exp ( - 0.5 * y * h * h / r );
    end

  end

  return
end
