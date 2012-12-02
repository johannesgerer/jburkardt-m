function [ o, x, w ] = cn_leg_05_1 ( n, option )

%*****************************************************************************80
%
%% CN_LEG_05_1 implements the Stroud rule CN:5-1 for region CN_LEG.
%
%  Discussion:
%
%    The rule has order
%
%      O = N^2 + N + 2.
%
%    The rule has precision P = 5.
%
%    CN_LEG is the cube [-1,+1]^N with the Legendre weight function
%
%      w(x) = 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 March 2010
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Arthur Stroud,
%    Approximate Calculation of Multiple Integrals,
%    Prentice Hall, 1971,
%    ISBN: 0130438936,
%    LC: QA311.S85.
%
%  Parameters:
%
%    Input, integer N, the spatial dimension.
%    N must be 4, 5, or 6.
%
%    Input, integer OPTION, is only used in case N = 4 or 5.
%    In that case, OPTION should be 1 or 2 to select the
%    two available variants of the rule.
%
%    Output, integer O, the order.
%
%    Output, real X(N,O), the abscissas.
%
%    Output, real W(O), the weights.
%
  if ( n < 4 || 6 < n )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CN_LEG_05_1 - Fatal error!\n' );
    fprintf ( 1, '  The value of N must be 4, 5, or 6.\n' );
    error ( 'CN_LEG_05_1 - Fatal error!' );
  end

  if ( n == 4 || n == 5 )
    if ( option < 1 || 2 < option )
      fprintf ( 1, '\n' );
      fprintf ( 1, 'CN_LEG_05_1 - Fatal error!\n' );
      fprintf ( 1, '  When N = 4 or 5, OPTION must be 1 or 2.\n' );
      error ( 'CN_LEG_05_1 - Fatal error!' );
    end
  end

  o = n^2 + n + 2;

  w = zeros ( o, 1 );
  x = zeros ( n, o );

  expon = 0;
  volume = c1_leg_monomial_integral ( expon );
  volume = volume ^ n;

  if ( n == 4 && option == 1 )

    eta    =   0.778984505799815E+00;
    lambda =   1.284565137874656E+00;
    xsi =    - 0.713647298819253E+00;
    mu =     - 0.715669761974162E+00;
    gamma =    0.217089151000943E+00;
    a =        0.206186096875899E-01 * volume;
    b =        0.975705820221664E-02 * volume;
    c =        0.733921929172573E-01 * volume;

  elseif ( n == 4 && option == 2 )

    eta    =   0.546190755827425E+00;
    lambda =   0.745069130115661E+00;
    xsi =    - 0.413927294508700E+00;
    mu =     - 0.343989637454535E+00;
    gamma =    1.134017894600344E+00;
    a =        0.853094758323323E-01 * volume;
    b =        0.862099000096395E-01 * volume;
    c =        0.116418206881849E-01 * volume;

  elseif ( n == 5 && option == 1 )

    eta    =   0.522478547481276E+00;
    lambda =   0.936135175985774E+00;
    xsi =    - 0.246351362101519E+00;
    mu =     - 0.496308106093758E+00;
    gamma =    0.827180176822930E+00;
    a =        0.631976901960153E-01 * volume;
    b =        0.511464127430166E-01 * volume;
    c =        0.181070246088902E-01 * volume;

  elseif ( n == 5 && option == 2 )

    eta    =   0.798317301388741E+00;
    lambda =   0.637344273885728E+00;
    xsi =    - 0.455245909918377E+00;
    mu =     - 1.063446229997311E+00;
    gamma =    0.354482076665770E+00;
    a =        0.116952384292206E-01 * volume;
    b =        0.701731258612708E-01 * volume;
    c =        0.137439132264426E-01 * volume;

  elseif ( n == 6 )

    eta    =   0.660225291773525E+00;
    lambda =   1.064581294844754E+00;
    xsi =      0.000000000000000E+00;
    mu =     - 0.660225291773525E+00;
    gamma =    0.660225291773525E+00;
    a =        0.182742214532872E-01 * volume;
    b =        0.346020761245675E-01 * volume;
    c =        0.182742214532872E-01 * volume;

  end

  k = 0;

  k = k + 1;
  for i = 1 : n
    x(i,k) = eta;
  end
  w(k) = a;

  k = k + 1;
  for i = 1 : n
    x(i,k) = - eta;
  end
  w(k) = a;

  for i1 = 1 : n
    k = k + 1;
    for i = 1 : n
      x(i,k) = xsi;
    end
    x(i1,k) = lambda;
    w(k) = b;
  end

  for i1 = 1 : n
    k = k + 1;
    for i = 1 : n
      x(i,k) = - xsi;
    end
    x(i1,k) = - lambda;
    w(k) = b;
  end

  for i1 = 1 : n - 1
    for i2 = i1 + 1 : n
      k = k + 1;
      for i = 1 : n
        x(i,k) = gamma;
      end
      x(i1,k) = mu;
      x(i2,k) = mu;
      w(k) = c;
    end
  end

  for i1 = 1 : n - 1
    for i2 = i1 + 1 : n
      k = k + 1;
      for i = 1 : n
        x(i,k) = - gamma;
      end
      x(i1,k) = - mu;
      x(i2,k) = - mu;
      w(k) = c;
    end
  end

  return
end
