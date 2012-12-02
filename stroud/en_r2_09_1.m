function [ o, x, w ] = en_r2_09_1 ( n, option )

%*****************************************************************************80
%
%% EN_R2_09_1 implements the Stroud rule 9.1 for region EN_R2.
%
%  Discussion:
%
%    The rule has order O = ( 2 * N^4 - 4 * N^3 + 22 * N^2 - 8 * N + 3 ) / 3.
%
%    The rule has precision P = 9.
%
%    EN_R2 is the entire N-dimensional space with weight function
%
%      w(x) = exp ( - x1^2 - x2^2 ... - xn^2 ) 
%
%    There are two versions of each rule, chosen by setting the 
%    OPTION variable to 1 or 2.
%
%    The rule as tabulated by Stenger is available for N = 2 through 20.
%    This function accepts N = 3 through 6.
%
%     N    O
%    __  ___
%     3   77
%     4  193
%     5  421
%     6  825
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    21 January 2010
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
%    3 <= N <= 6.
%
%    Input, integer OPTION, chooses rule option 1 or 2.
%
%    Output, integer O, the order.
%
%    Output, real X(N,O), the abscissas.
%
%    Output, real W(O), the weights.
%
  if ( n < 3 | 6 < n )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'EN_R2_09_1 - Fatal error!\n' );
    fprintf ( 1, '  3 <= N <= 6 required.\n' );
    error ( 'EN_R2_09_1 - Fatal error!' )
  end

  if ( nargin < 2 )
    option = 1;
  end

  if ( option < 1 | 2 < option )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'EN_R2_09_1 - Fatal error!\n' );
    fprintf ( 1, '  1 <= OPTION <= 2 required.\n' );
    error ( 'EN_R2_09_1 - Fatal error!' )
  end

  o = ( 2 * n^4 - 4 * n^3 + 22 * n^2 - 8 * n + 3 ) / 3;
  volume = sqrt ( pi^n );

  if ( n == 3 )
    u =    0.202018287045609E+01;
    v =    0.958572464613819E+00;
    b0 =   0.676448734429924E+00;
    b1 =   0.511989106291551E-02;
    b2 =   0.448595723493744E+00;
    b3 =   0.235223454595606E-03;
    b4 =   0.915390713080005E-01;
    b5 =   0.139208199920793E-01;
    b6 =   0.235223454595606E-03;
    b7 =   0.915390713080008E-01;
    b8 =   0.000000000000000E+00;
  elseif ( n == 4 & option == 1 )
    u =    0.202018287045609E+01;
    v =    0.958572464613819E+00;
    b0 = - 0.860452945007048E+00;
    b1 = - 0.405511998533795E-01;
    b2 =   0.107026475449715E+01;
    b3 =   0.138974239307092E-03;
    b4 = - 0.162248779448181E+00;
    b5 =   0.246740110027234E-01;
    b6 =   0.138974239307094E-03;
    b7 =   0.162248779448181E+00;
    b8 =   0.138974239307094E-03;
  elseif ( n == 4 & option == 2 )
    u =    0.958572464613819E+00;
    v =    0.202018287045609E+01;
    b0 =   0.265029088766810E-02;
    b1 =   0.637601342635332E+00;
    b2 = - 0.394394059389228E-01;
    b3 =   0.540829264827264E-01;
    b4 = - 0.416922717921281E-03;
    b5 =   0.246740110027234E-01;
    b6 =   0.540829264827270E-01;
    b7 =   0.416922717921281E-03;
    b8 =   0.540829264827269E-01;
  elseif ( n == 5 & option == 1 )
    u =    0.202018287045609E+01;
    v =    0.958572464613819E+00;
    b0 = - 0.827347006200826E+01;
    b1 = - 0.160820174530905E+00;
    b2 =   0.353499863758467E+01;
    b3 =   0.738976276909564E-03;
    b4 = - 0.862735421812943E+00;
    b5 =   0.437335458190621E-01;
    b6 = - 0.246325425636523E-03;
    b7 =   0.287578473937648E+00;
    b8 =   0.246325425636523E-03;
  elseif ( n == 5 & option == 2 )
    u =    0.958572464613819E+00;
    v =    0.202018287045609E+01;
    b0 = - 0.624416791055272E+00;
    b1 =   0.467494915583104E+00;
    b2 = - 0.152937760910536E+00;
    b3 =   0.287578473937646E+00;
    b4 = - 0.221692883072871E-02;
    b5 =   0.437335458190621E-01;
    b6 = - 0.958594913125490E-01;
    b7 =   0.738976276909568E-03;
    b8 =   0.958594913125492E-01;
  elseif ( n == 6 & option == 1 )
    u =    0.202018287045609E+01;
    v =    0.958572464613819E+00;
    b0 = - 0.361840434143098E+02;
    b1 = - 0.447936529138517E+00;
    b2 =   0.112077863004144E+02;
    b3 =   0.392940404320855E-02;
    b4 = - 0.254859786784158E+01;
    b5 =   0.775156917007496E-01;
    b6 = - 0.130980134773619E-02;
    b7 =   0.509719573568315E+00;
    b8 =   0.436600449245395E-03;
  elseif ( n == 6 & option == 2 )
    u =    0.958572464613819E+00;
    v =    0.202018287045609E+01;
    b0 =   0.448873836333650E+01;
    b1 = - 0.238473566140736E+01;
    b2 = - 0.413008493198885E+00;
    b3 =   0.152915872070494E+01;
    b4 = - 0.654900673868093E-02;
    b5 =   0.775156917007496E-01;
    b6 = - 0.509719573568314E+00;
    b7 =   0.130980134773618E-02;
    b8 =   0.169906524522772E+00;
  end

  x = zeros(n,o);
  w = zeros(o,1);

  k = 0;
%
%  1 point.
%
  k = k + 1;
% x(1:n,k) = 0.0;
  w(k) = b0;
%
%  2 * N points.
%
  for i = 1 : n
    k = k + 1;
    x(i,k) = - u;
    w(k) = b1;
    k = k + 1;
    x(i,k) = + u;
    w(k) = b1;
  end
%
%  2 * N points.
%
  for i = 1 : n
    k = k + 1;
    x(i,k) = - v;
    w(k) = b2;
    k = k + 1;
    x(i,k) = + v;
    w(k) = b2;
  end
%
%  4 * ( N * ( N - 1 ) / 2 ) points.
%
  for i = 1 : n - 1
    for j = i + 1 : n
      k = k + 1;
      x(i,k) = - u;
      x(j,k) = - u;
      w(k) = b3;
      k = k + 1;
      x(i,k) = - u;
      x(j,k) = + u;
      w(k) = b3;
      k = k + 1;
      x(i,k) = + u;
      x(j,k) = - u;
      w(k) = b3;
      k = k + 1;
      x(i,k) = + u;
      x(j,k) = + u;
      w(k) = b3;
    end
  end
%
%  4 * ( N * ( N - 1 ) / 2 ) points.
%
  for i = 1 : n - 1
    for j = i + 1 : n
      k = k + 1;
      x(i,k) = - v;
      x(j,k) = - v;
      w(k) = b4;
      k = k + 1;
      x(i,k) = - v;
      x(j,k) = + v;
      w(k) = b4;
      k = k + 1;
      x(i,k) = + v;
      x(j,k) = - v;
      w(k) = b4;
      k = k + 1;
      x(i,k) = + v;
      x(j,k) = + v;
      w(k) = b4;
    end
  end
%
%  4 * ( N * ( N - 1 ) ) points.
%
  for i = 1 : n - 1
    for j = i + 1 : n
      k = k + 1;
      x(i,k) = - u;
      x(j,k) = - v;
      w(k) = b5;
      k = k + 1;
      x(i,k) = - u;
      x(j,k) = + v;
      w(k) = b5;
      k = k + 1;
      x(i,k) = + u;
      x(j,k) = - v;
      w(k) = b5;
      k = k + 1;
      x(i,k) = + u;
      x(j,k) = + v;
      w(k) = b5;
      k = k + 1;
      x(i,k) = - v;
      x(j,k) = - u;
      w(k) = b5;
      k = k + 1;
      x(i,k) = - v;
      x(j,k) = + u;
      w(k) = b5;
      k = k + 1;
      x(i,k) = + v;
      x(j,k) = - u;
      w(k) = b5;
      k = k + 1;
      x(i,k) = + v;
      x(j,k) = + u;
      w(k) = b5;
    end
  end
%
%  8 * ( N * ( N - 1 ) * ( N - 2 ) / 6 ) points.
%
  for i = 1 : n - 2
    for j = i + 1 : n - 1
      for l = j + 1 : n
        k = k + 1;
        x(i,k) = - u;
        x(j,k) = - u;
        x(l,k) = - u;
        w(k) = b6;
        k = k + 1;
        x(i,k) = - u;
        x(j,k) = - u;
        x(l,k) = + u;
        w(k) = b6;
        k = k + 1;
        x(i,k) = - u;
        x(j,k) = + u;
        x(l,k) = - u;
        w(k) = b6;
        k = k + 1;
        x(i,k) = - u;
        x(j,k) = + u;
        x(l,k) = + u;
        w(k) = b6;
        k = k + 1;
        x(i,k) = + u;
        x(j,k) = - u;
        x(l,k) = - u;
        w(k) = b6;
        k = k + 1;
        x(i,k) = + u;
        x(j,k) = - u;
        x(l,k) = + u;
        w(k) = b6;
        k = k + 1;
        x(i,k) = + u;
        x(j,k) = + u;
        x(l,k) = - u;
        w(k) = b6;
        k = k + 1;
        x(i,k) = + u;
        x(j,k) = + u;
        x(l,k) = + u;
        w(k) = b6;
      end
    end
  end
%
%  8 * ( N * ( N - 1 ) * ( N - 2 ) / 6 ) points.
%
  for i = 1 : n - 2
    for j = i + 1 : n - 1
      for l = j + 1 : n
        k = k + 1;
        x(i,k) = - v;
        x(j,k) = - v;
        x(l,k) = - v;
        w(k) = b7;
        k = k + 1;
        x(i,k) = - v;
        x(j,k) = - v;
        x(l,k) = + v;
        w(k) = b7;
        k = k + 1;
        x(i,k) = - v;
        x(j,k) = + v;
        x(l,k) = - v;
        w(k) = b7;
        k = k + 1;
        x(i,k) = - v;
        x(j,k) = + v;
        x(l,k) = + v;
        w(k) = b7;
        k = k + 1;
        x(i,k) = + v;
        x(j,k) = - v;
        x(l,k) = - v;
        w(k) = b7;
        k = k + 1;
        x(i,k) = + v;
        x(j,k) = - v;
        x(l,k) = + v;
        w(k) = b7;
        k = k + 1;
        x(i,k) = + v;
        x(j,k) = + v;
        x(l,k) = - v;
        w(k) = b7;
        k = k + 1;
        x(i,k) = + v;
        x(j,k) = + v;
        x(l,k) = + v;
        w(k) = b7;
      end
    end
  end
%
%  16 * ( N * ( N - 1 ) * ( N - 2 ) * ( N - 3 ) / 24 ) points.
%
  for i = 1 : n - 3
    for j = i + 1 : n - 2
      for l = j + 1 : n - 1
        for m = l + 1 : n
          k = k + 1;
          x(i,k) = - u;
          x(j,k) = - u;
          x(l,k) = - u;
          x(m,k) = - u;
          w(k) = b8;
          k = k + 1;
          x(i,k) = - u;
          x(j,k) = - u;
          x(l,k) = - u;
          x(m,k) = + u;
          w(k) = b8;
          k = k + 1;
          x(i,k) = - u;
          x(j,k) = - u;
          x(l,k) = + u;
          x(m,k) = - u;
          w(k) = b8;
          k = k + 1;
          x(i,k) = - u;
          x(j,k) = - u;
          x(l,k) = + u;
          x(m,k) = + u;
          w(k) = b8;
          k = k + 1;
          x(i,k) = - u;
          x(j,k) = + u;
          x(l,k) = - u;
          x(m,k) = - u;
          w(k) = b8;
          k = k + 1;
          x(i,k) = - u;
          x(j,k) = + u;
          x(l,k) = - u;
          x(m,k) = + u;
          w(k) = b8;
          k = k + 1;
          x(i,k) = - u;
          x(j,k) = + u;
          x(l,k) = + u;
          x(m,k) = - u;
          w(k) = b8;
          k = k + 1;
          x(i,k) = - u;
          x(j,k) = + u;
          x(l,k) = + u;
          x(m,k) = + u;
          w(k) = b8;
          k = k + 1;
          x(i,k) = + u;
          x(j,k) = - u;
          x(l,k) = - u;
          x(m,k) = - u;
          w(k) = b8;
          k = k + 1;
          x(i,k) = + u;
          x(j,k) = - u;
          x(l,k) = - u;
          x(m,k) = + u;
          w(k) = b8;
          k = k + 1;
          x(i,k) = + u;
          x(j,k) = - u;
          x(l,k) = + u;
          x(m,k) = - u;
          w(k) = b8;
          k = k + 1;
          x(i,k) = + u;
          x(j,k) = - u;
          x(l,k) = + u;
          x(m,k) = + u;
          w(k) = b8;
          k = k + 1;
          x(i,k) = + u;
          x(j,k) = + u;
          x(l,k) = - u;
          x(m,k) = - u;
          w(k) = b8;
          k = k + 1;
          x(i,k) = + u;
          x(j,k) = + u;
          x(l,k) = - u;
          x(m,k) = + u;
          w(k) = b8;
          k = k + 1;
          x(i,k) = + u;
          x(j,k) = + u;
          x(l,k) = + u;
          x(m,k) = - u;
          w(k) = b8;
          k = k + 1;
          x(i,k) = + u;
          x(j,k) = + u;
          x(l,k) = + u;
          x(m,k) = + u;
          w(k) = b8;
        end
      end
    end
  end

  return
end
