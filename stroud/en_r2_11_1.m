function [ o, x, w ] = en_r2_11_1 ( n, option )

%*****************************************************************************80
%
%% EN_R2_11_1 implements the Stroud rule 11.1 for region EN_R2.
%
%  Discussion:
%
%    The rule has order 
%
%      O = ( 4 * N^5 - 20 * N^4 + 140 * N^3 - 130 * N^2 + 96 * N + 15 ) / 15.
%
%    The rule has precision P = 11.
%
%    EN_R2 is the entire N-dimensional space with weight function
%
%      w(x) = exp ( - x1^2 - x2^2 ... - xn^2 ) 
%
%    There are two versions of each rule, chosen by setting the
%    OPTION variable to 1 or 2.
%
%    The rule as tabulated by Stenger is available for N = 2 through 20.
%    This function accepts N = 3 through 5.
%
%     N    O
%    __  ___
%     3  151
%     4  417
%     5  983
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
%    3 <= N <= 5.
%
%    Input, integer OPTION, chooses rule option 1 or 2.
%
%    Output, integer O, the order.
%
%    Output, real X(N,O), the abscissas.
%
%    Output, real W(O), the weights.
%
  if ( n < 3 | 5 < n )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'EN_R2_11_1 - Fatal error!\n' );
    fprintf ( 1, '  3 <= N <= 5 required.\n' );
    error ( 'EN_R2_11_1 - Fatal error!' )
  end

  if ( nargin < 2 )
    option = 1;
  end

  if ( option < 1 | 2 < option )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'EN_R2_11_1 - Fatal error!\n' );
    fprintf ( 1, '  1 <= OPTION <= 2 required.\n' );
    error ( 'EN_R2_11_1 - Fatal error!' )
  end

  o = ( 4 * n^5 - 20 * n^4 + 140 * n^3 - 130 * n^2 + 96 * n + 15 ) / 15;
  volume = sqrt ( pi^n );

  if ( n == 3 & option == 1 )
    u =     0.235060497367449E+01;
    v =     0.436077411927617E+00;
    w2 =    0.133584907401370E+01;
    b0 =  - 0.881591029957858E+01;
    b1 =  - 0.751996143360650E-01;
    b2 =    0.621743189471515E+01;
    b3 =    0.241426451456494E+00;
    b4 =  - 0.120709739276065E-02;
    b5 =  - 0.427751221210138E+01;
    b6 =    0.550169924840163E-01;
    b7 =    0.237084999634707E-01;
    b8 =  - 0.169791992887741E-02;
    b9 =  - 0.252266276123350E-04;
    b10 =   0.326777873717691E+01;
    b11 =   0.968469949206802E-02;
    b12 =   0.789754514877422E-03;
    b13 =   0.000000000000000E+00;
    b14 =   0.000000000000000E+00;
    b15 =   0.000000000000000E+00;
  elseif ( n == 3 & option == 2 )
    u =     0.235060497367449E+01;
    v =     0.133584907401370E+01;
    w2 =    0.436077411927617E+00;
    b0 =  - 0.141214037032900E+02;
    b1 =  - 0.803730274707282E-01;
    b2 =    0.235546545595906E+00;
    b3 =    0.888123191556611E+01;
    b4 =    0.142467131155533E-03;
    b5 =    0.582993124006494E-01;
    b6 =  - 0.561099173155661E+01;
    b7 =  - 0.204028691521686E-02;
    b8 =    0.252880089932256E-01;
    b9 =  - 0.814378678627283E-04;
    b10 =   0.804353953375146E-02;
    b11 =   0.393451849690453E+01;
    b12 =   0.171183493169724E-03;
    b13 =   0.000000000000000E+00;
    b14 =   0.000000000000000E+00;
    b15 =   0.000000000000000E+00;
  elseif ( n == 4 & option == 1 )
    u =     0.235060497367449E+01;
    v =     0.436077411927617E+00;
    w2 =    0.133584907401370E+01;
    b0 =    0.241502736147339E+03;
    b1 =  - 0.196095938531478E+00;
    b2 =  - 0.128675737999280E+03;
    b3 =    0.307568784278696E+00;
    b4 =  - 0.480908422319460E-02;
    b5 =    0.698087019367085E+02;
    b6 =    0.631837143743771E-01;
    b7 =    0.392226151971179E-01;
    b8 =  - 0.300948471646799E-02;
    b9 =  - 0.650235306755170E-04;
    b10 = - 0.386951974646715E+02;
    b11 =   0.171656829095787E-01;
    b12 =   0.139980343116450E-02;
    b13 =   0.101552487093372E-04;
    b14 =   0.222435922356439E+02;
    b15 =   0.000000000000000E+00;
  elseif ( n == 4 & option == 2 )
    u =     0.235060497367449E+01;
    v =     0.133584907401370E+01;
    w2 =    0.436077411927617E+00;
    b0 =  - 0.151944464736584E+03;
    b1 =  - 0.223498438689039E+00;
    b2 =    0.243574919068010E+00;
    b3 =    0.634373877008693E+02;
    b4 =  - 0.782065187814018E-04;
    b5 =    0.911833754536616E-01;
    b6 =  - 0.238927288245914E+02;
    b7 =  - 0.422314408318853E-02;
    b8 =    0.448218289217760E-01;
    b9 =  - 0.138053374667391E-03;
    b10 =   0.607473265800655E-02;
    b11 =   0.697375246129742E+01;
    b12 =   0.303414841680135E-03;
    b13 = - 0.314574391771792E-05;
    b14 =   0.409103498175100E-02;
    b15 =   0.000000000000000E+00;
  elseif ( n == 5 & option == 1 )
    u =     0.235060497367449E+01;
    v =     0.436077411927617E+00;
    w2 =    0.133584907401370E+01;
    b0 =    0.255885269311763E+04;
    b1 =  - 0.439598677491526E+00;
    b2 =  - 0.106541406144610E+04;
    b3 =    0.453540909054264E+00;
    b4 =  - 0.132100905623778E-01;
    b5 =    0.418606568954203E+03;
    b6 =    0.511394563043680E-01;
    b7 =    0.645581013845604E-01;
    b8 =  - 0.533417277494500E-02;
    b9 =  - 0.137981626254496E-03;
    b10 = - 0.147436933189884E+03;
    b11 =   0.304253807765057E-01;
    b12 =   0.248108698207828E-02;
    b13 =   0.113652094546015E-04;
    b14 =   0.394257407160391E+02;
    b15 =   0.331725011358320E-05;
  elseif ( n == 5 & option == 2 )
    u =     0.235060497367449E+01;
    v =     0.133584907401370E+01;
    w2 =    0.436077411927617E+00;
    b0 =  - 0.761305347548192E+03;
    b1 =  - 0.536360805019297E+00;
    b2 =    0.110669832078736E+00;
    b3 =    0.246421088923968E+03;
    b4 =  - 0.773649327968607E-03;
    b5 =    0.169088641205970E+00;
    b6 =  - 0.670700680243651E+02;
    b7 =  - 0.856090560229205E-02;
    b8 =    0.794446232770302E-01;
    b9 =  - 0.220272863263544E-03;
    b10 = - 0.373515812228225E-02;
    b11 =   0.123606544052884E+02;
    b12 =   0.537788804557843E-03;
    b13 = - 0.122101861480881E-04;
    b14 =   0.725117070759373E-02;
    b15 =   0.331725011358320E-05;
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
%  2 * N points.
%
  for i = 1 : n
    k = k + 1;
    x(i,k) = - w2;
    w(k) = b3;
    k = k + 1;
    x(i,k) = + w2;
    w(k) = b3;
  end
%
%  4 * ( N * ( N - 1 ) / 2 ) points.
%
  for i = 1 : n - 1
    for j = i + 1 : n
      k = k + 1;
      x(i,k) = - u;
      x(j,k) = - u;
      w(k) = b4;
      k = k + 1;
      x(i,k) = - u;
      x(j,k) = + u;
      w(k) = b4;
      k = k + 1;
      x(i,k) = + u;
      x(j,k) = - u;
      w(k) = b4;
      k = k + 1;
      x(i,k) = + u;
      x(j,k) = + u;
      w(k) = b4;
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
      w(k) = b5;
      k = k + 1;
      x(i,k) = - v;
      x(j,k) = + v;
      w(k) = b5;
      k = k + 1;
      x(i,k) = + v;
      x(j,k) = - v;
      w(k) = b5;
      k = k + 1;
      x(i,k) = + v;
      x(j,k) = + v;
      w(k) = b5;
    end
  end
%
%  4 * ( N * ( N - 1 ) / 2 ) points.
%
  for i = 1 : n - 1
    for j = i + 1 : n
      k = k + 1;
      x(i,k) = - w2;
      x(j,k) = - w2;
      w(k) = b6;
      k = k + 1;
      x(i,k) = - w2;
      x(j,k) = + w2;
      w(k) = b6;
      k = k + 1;
      x(i,k) = + w2;
      x(j,k) = - w2;
      w(k) = b6;
      k = k + 1;
      x(i,k) = + w2;
      x(j,k) = + w2;
      w(k) = b6;
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
      w(k) = b7;
      k = k + 1;
      x(i,k) = - u;
      x(j,k) = + v;
      w(k) = b7;
      k = k + 1;
      x(i,k) = + u;
      x(j,k) = - v;
      w(k) = b7;
      k = k + 1;
      x(i,k) = + u;
      x(j,k) = + v;
      w(k) = b7;
      k = k + 1;
      x(i,k) = - v;
      x(j,k) = - u;
      w(k) = b7;
      k = k + 1;
      x(i,k) = - v;
      x(j,k) = + u;
      w(k) = b7;
      k = k + 1;
      x(i,k) = + v;
      x(j,k) = - u;
      w(k) = b7;
      k = k + 1;
      x(i,k) = + v;
      x(j,k) = + u;
      w(k) = b7;
    end
  end
%
%  4 * ( N * ( N - 1 ) ) points.
%
  for i = 1 : n - 1
    for j = i + 1 : n
      k = k + 1;
      x(i,k) = - u;
      x(j,k) = - w2;
      w(k) = b8;
      k = k + 1;
      x(i,k) = - u;
      x(j,k) = + w2;
      w(k) = b8;
      k = k + 1;
      x(i,k) = + u;
      x(j,k) = - w2;
      w(k) = b8;
      k = k + 1;
      x(i,k) = + u;
      x(j,k) = + w2;
      w(k) = b8;
      k = k + 1;
      x(i,k) = - w2;
      x(j,k) = - u;
      w(k) = b8;
      k = k + 1;
      x(i,k) = - w2;
      x(j,k) = + u;
      w(k) = b8;
      k = k + 1;
      x(i,k) = + w2;
      x(j,k) = - u;
      w(k) = b8;
      k = k + 1;
      x(i,k) = + w2;
      x(j,k) = + u;
      w(k) = b8;
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
        w(k) = b9;
        k = k + 1;
        x(i,k) = - u;
        x(j,k) = - u;
        x(l,k) = + u;
        w(k) = b9;
        k = k + 1;
        x(i,k) = - u;
        x(j,k) = + u;
        x(l,k) = - u;
        w(k) = b9;
        k = k + 1;
        x(i,k) = - u;
        x(j,k) = + u;
        x(l,k) = + u;
        w(k) = b9;
        k = k + 1;
        x(i,k) = + u;
        x(j,k) = - u;
        x(l,k) = - u;
        w(k) = b9;
        k = k + 1;
        x(i,k) = + u;
        x(j,k) = - u;
        x(l,k) = + u;
        w(k) = b9;
        k = k + 1;
        x(i,k) = + u;
        x(j,k) = + u;
        x(l,k) = - u;
        w(k) = b9;
        k = k + 1;
        x(i,k) = + u;
        x(j,k) = + u;
        x(l,k) = + u;
        w(k) = b9;
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
        w(k) = b10;
        k = k + 1;
        x(i,k) = - v;
        x(j,k) = - v;
        x(l,k) = + v;
        w(k) = b10;
        k = k + 1;
        x(i,k) = - v;
        x(j,k) = + v;
        x(l,k) = - v;
        w(k) = b10;
        k = k + 1;
        x(i,k) = - v;
        x(j,k) = + v;
        x(l,k) = + v;
        w(k) = b10;
        k = k + 1;
        x(i,k) = + v;
        x(j,k) = - v;
        x(l,k) = - v;
        w(k) = b10;
        k = k + 1;
        x(i,k) = + v;
        x(j,k) = - v;
        x(l,k) = + v;
        w(k) = b10;
        k = k + 1;
        x(i,k) = + v;
        x(j,k) = + v;
        x(l,k) = - v;
        w(k) = b10;
        k = k + 1;
        x(i,k) = + v;
        x(j,k) = + v;
        x(l,k) = + v;
        w(k) = b10;
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
        x(i,k) = - w2;
        x(j,k) = - w2;
        x(l,k) = - w2;
        w(k) = b11;
        k = k + 1;
        x(i,k) = - w2;
        x(j,k) = - w2;
        x(l,k) = + w2;
        w(k) = b11;
        k = k + 1;
        x(i,k) = - w2;
        x(j,k) = + w2;
        x(l,k) = - w2;
        w(k) = b11;
        k = k + 1;
        x(i,k) = - w2;
        x(j,k) = + w2;
        x(l,k) = + w2;
        w(k) = b11;
        k = k + 1;
        x(i,k) = + w2;
        x(j,k) = - w2;
        x(l,k) = - w2;
        w(k) = b11;
        k = k + 1;
        x(i,k) = + w2;
        x(j,k) = - w2;
        x(l,k) = + w2;
        w(k) = b11;
        k = k + 1;
        x(i,k) = + w2;
        x(j,k) = + w2;
        x(l,k) = - w2;
        w(k) = b11;
        k = k + 1;
        x(i,k) = + w2;
        x(j,k) = + w2;
        x(l,k) = + w2;
        w(k) = b11;
      end
    end
  end
%
%  8 * ( N * ( N - 1 ) * ( N - 2 ) / 2 ) points.
%
  for i = 1 : n - 2
    for j = i + 1 : n - 1
      for l = j + 1 : n
        k = k + 1;
        x(i,k) = - u;
        x(j,k) = - u;
        x(l,k) = - v;
        w(k) = b12;
        k = k + 1;
        x(i,k) = - u;
        x(j,k) = - u;
        x(l,k) = + v;
        w(k) = b12;
        k = k + 1;
        x(i,k) = - u;
        x(j,k) = + u;
        x(l,k) = - v;
        w(k) = b12;
        k = k + 1;
        x(i,k) = - u;
        x(j,k) = + u;
        x(l,k) = + v;
        w(k) = b12;
        k = k + 1;
        x(i,k) = + u;
        x(j,k) = - u;
        x(l,k) = - v;
        w(k) = b12;
        k = k + 1;
        x(i,k) = + u;
        x(j,k) = - u;
        x(l,k) = + v;
        w(k) = b12;
        k = k + 1;
        x(i,k) = + u;
        x(j,k) = + u;
        x(l,k) = - v;
        w(k) = b12;
        k = k + 1;
        x(i,k) = + u;
        x(j,k) = + u;
        x(l,k) = + v;
        w(k) = b12;
        k = k + 1;
        x(i,k) = - u;
        x(j,k) = - v;
        x(l,k) = - u;
        w(k) = b12;
        k = k + 1;
        x(i,k) = - u;
        x(j,k) = - v;
        x(l,k) = + u;
        w(k) = b12;
        k = k + 1;
        x(i,k) = - u;
        x(j,k) = + v;
        x(l,k) = - u;
        w(k) = b12;
        k = k + 1;
        x(i,k) = - u;
        x(j,k) = + v;
        x(l,k) = + u;
        w(k) = b12;
        k = k + 1;
        x(i,k) = + u;
        x(j,k) = - v;
        x(l,k) = - u;
        w(k) = b12;
        k = k + 1;
        x(i,k) = + u;
        x(j,k) = - v;
        x(l,k) = + u;
        w(k) = b12;
        k = k + 1;
        x(i,k) = + u;
        x(j,k) = + v;
        x(l,k) = - u;
        w(k) = b12;
        k = k + 1;
        x(i,k) = + u;
        x(j,k) = + v;
        x(l,k) = + u;
        w(k) = b12;
        k = k + 1;
        x(i,k) = - v;
        x(j,k) = - u;
        x(l,k) = - u;
        w(k) = b12;
        k = k + 1;
        x(i,k) = - v;
        x(j,k) = - u;
        x(l,k) = + u;
        w(k) = b12;
        k = k + 1;
        x(i,k) = - v;
        x(j,k) = + u;
        x(l,k) = - u;
        w(k) = b12;
        k = k + 1;
        x(i,k) = - v;
        x(j,k) = + u;
        x(l,k) = + u;
        w(k) = b12;
        k = k + 1;
        x(i,k) = + v;
        x(j,k) = - u;
        x(l,k) = - u;
        w(k) = b12;
        k = k + 1;
        x(i,k) = + v;
        x(j,k) = - u;
        x(l,k) = + u;
        w(k) = b12;
        k = k + 1;
        x(i,k) = + v;
        x(j,k) = + u;
        x(l,k) = - u;
        w(k) = b12;
        k = k + 1;
        x(i,k) = + v;
        x(j,k) = + u;
        x(l,k) = + u;
        w(k) = b12;
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
          w(k) = b13;
          k = k + 1;
          x(i,k) = - u;
          x(j,k) = - u;
          x(l,k) = - u;
          x(m,k) = + u;
          w(k) = b13;
          k = k + 1;
          x(i,k) = - u;
          x(j,k) = - u;
          x(l,k) = + u;
          x(m,k) = - u;
          w(k) = b13;
          k = k + 1;
          x(i,k) = - u;
          x(j,k) = - u;
          x(l,k) = + u;
          x(m,k) = + u;
          w(k) = b13;
          k = k + 1;
          x(i,k) = - u;
          x(j,k) = + u;
          x(l,k) = - u;
          x(m,k) = - u;
          w(k) = b13;
          k = k + 1;
          x(i,k) = - u;
          x(j,k) = + u;
          x(l,k) = - u;
          x(m,k) = + u;
          w(k) = b13;
          k = k + 1;
          x(i,k) = - u;
          x(j,k) = + u;
          x(l,k) = + u;
          x(m,k) = - u;
          w(k) = b13;
          k = k + 1;
          x(i,k) = - u;
          x(j,k) = + u;
          x(l,k) = + u;
          x(m,k) = + u;
          w(k) = b13;
          k = k + 1;
          x(i,k) = + u;
          x(j,k) = - u;
          x(l,k) = - u;
          x(m,k) = - u;
          w(k) = b13;
          k = k + 1;
          x(i,k) = + u;
          x(j,k) = - u;
          x(l,k) = - u;
          x(m,k) = + u;
          w(k) = b13;
          k = k + 1;
          x(i,k) = + u;
          x(j,k) = - u;
          x(l,k) = + u;
          x(m,k) = - u;
          w(k) = b13;
          k = k + 1;
          x(i,k) = + u;
          x(j,k) = - u;
          x(l,k) = + u;
          x(m,k) = + u;
          w(k) = b13;
          k = k + 1;
          x(i,k) = + u;
          x(j,k) = + u;
          x(l,k) = - u;
          x(m,k) = - u;
          w(k) = b13;
          k = k + 1;
          x(i,k) = + u;
          x(j,k) = + u;
          x(l,k) = - u;
          x(m,k) = + u;
          w(k) = b13;
          k = k + 1;
          x(i,k) = + u;
          x(j,k) = + u;
          x(l,k) = + u;
          x(m,k) = - u;
          w(k) = b13;
          k = k + 1;
          x(i,k) = + u;
          x(j,k) = + u;
          x(l,k) = + u;
          x(m,k) = + u;
          w(k) = b13;
        end
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
          x(i,k) = - v;
          x(j,k) = - v;
          x(l,k) = - v;
          x(m,k) = - v;
          w(k) = b14;
          k = k + 1;
          x(i,k) = - v;
          x(j,k) = - v;
          x(l,k) = - v;
          x(m,k) = + v;
          w(k) = b14;
          k = k + 1;
          x(i,k) = - v;
          x(j,k) = - v;
          x(l,k) = + v;
          x(m,k) = - v;
          w(k) = b14;
          k = k + 1;
          x(i,k) = - v;
          x(j,k) = - v;
          x(l,k) = + v;
          x(m,k) = + v;
          w(k) = b14;
          k = k + 1;
          x(i,k) = - v;
          x(j,k) = + v;
          x(l,k) = - v;
          x(m,k) = - v;
          w(k) = b14;
          k = k + 1;
          x(i,k) = - v;
          x(j,k) = + v;
          x(l,k) = - v;
          x(m,k) = + v;
          w(k) = b14;
          k = k + 1;
          x(i,k) = - v;
          x(j,k) = + v;
          x(l,k) = + v;
          x(m,k) = - v;
          w(k) = b14;
          k = k + 1;
          x(i,k) = - v;
          x(j,k) = + v;
          x(l,k) = + v;
          x(m,k) = + v;
          w(k) = b14;
          k = k + 1;
          x(i,k) = + v;
          x(j,k) = - v;
          x(l,k) = - v;
          x(m,k) = - v;
          w(k) = b14;
          k = k + 1;
          x(i,k) = + v;
          x(j,k) = - v;
          x(l,k) = - v;
          x(m,k) = + v;
          w(k) = b14;
          k = k + 1;
          x(i,k) = + v;
          x(j,k) = - v;
          x(l,k) = + v;
          x(m,k) = - v;
          w(k) = b14;
          k = k + 1;
          x(i,k) = + v;
          x(j,k) = - v;
          x(l,k) = + v;
          x(m,k) = + v;
          w(k) = b14;
          k = k + 1;
          x(i,k) = + v;
          x(j,k) = + v;
          x(l,k) = - v;
          x(m,k) = - v;
          w(k) = b14;
          k = k + 1;
          x(i,k) = + v;
          x(j,k) = + v;
          x(l,k) = - v;
          x(m,k) = + v;
          w(k) = b14;
          k = k + 1;
          x(i,k) = + v;
          x(j,k) = + v;
          x(l,k) = + v;
          x(m,k) = - v;
          w(k) = b14;
          k = k + 1;
          x(i,k) = + v;
          x(j,k) = + v;
          x(l,k) = + v;
          x(m,k) = + v;
          w(k) = b14;
        end
      end
    end
  end
%
%  All quintuples UUUUU with 32 sign combinations.
%
  for i1 = 1 : n - 4
    for i2 = i1 + 1 : n - 3
      for i3 = i2 + 1 : n - 2
        for i4 = i3 + 1 : n - 1
          for i5 = i4 + 1 : n
            k = k + 1;
            x(i1,k) = - u;
            x(i2,k) = - u;
            x(i3,k) = - u;
            x(i4,k) = - u;
            x(i5,k) = - u;
            w(k) = b15;
            k = k + 1;
            x(i1,k) = - u;
            x(i2,k) = - u;
            x(i3,k) = - u;
            x(i4,k) = - u;
            x(i5,k) = + u;
            w(k) = b15;
            k = k + 1;
            x(i1,k) = - u;
            x(i2,k) = - u;
            x(i3,k) = - u;
            x(i4,k) = + u;
            x(i5,k) = - u;
            w(k) = b15;
            k = k + 1;
            x(i1,k) = - u;
            x(i2,k) = - u;
            x(i3,k) = - u;
            x(i4,k) = + u;
            x(i5,k) = + u;
            w(k) = b15;
            k = k + 1;
            x(i1,k) = - u;
            x(i2,k) = - u;
            x(i3,k) = + u;
            x(i4,k) = - u;
            x(i5,k) = - u;
            w(k) = b15;
            k = k + 1;
            x(i1,k) = - u;
            x(i2,k) = - u;
            x(i3,k) = + u;
            x(i4,k) = - u;
            x(i5,k) = + u;
            w(k) = b15;
            k = k + 1;
            x(i1,k) = - u;
            x(i2,k) = - u;
            x(i3,k) = + u;
            x(i4,k) = + u;
            x(i5,k) = - u;
            w(k) = b15;
            k = k + 1;
            x(i1,k) = - u;
            x(i2,k) = - u;
            x(i3,k) = + u;
            x(i4,k) = + u;
            x(i5,k) = + u;
            w(k) = b15;
            k = k + 1;
            x(i1,k) = - u;
            x(i2,k) = + u;
            x(i3,k) = - u;
            x(i4,k) = - u;
            x(i5,k) = - u;
            w(k) = b15;
            k = k + 1;
            x(i1,k) = - u;
            x(i2,k) = + u;
            x(i3,k) = - u;
            x(i4,k) = - u;
            x(i5,k) = + u;
            w(k) = b15;
            k = k + 1;
            x(i1,k) = - u;
            x(i2,k) = + u;
            x(i3,k) = - u;
            x(i4,k) = + u;
            x(i5,k) = - u;
            w(k) = b15;
            k = k + 1;
            x(i1,k) = - u;
            x(i2,k) = + u;
            x(i3,k) = - u;
            x(i4,k) = + u;
            x(i5,k) = + u;
            w(k) = b15;
            k = k + 1;
            x(i1,k) = - u;
            x(i2,k) = + u;
            x(i3,k) = + u;
            x(i4,k) = - u;
            x(i5,k) = - u;
            w(k) = b15;
            k = k + 1;
            x(i1,k) = - u;
            x(i2,k) = + u;
            x(i3,k) = + u;
            x(i4,k) = - u;
            x(i5,k) = + u;
            w(k) = b15;
            k = k + 1;
            x(i1,k) = - u;
            x(i2,k) = + u;
            x(i3,k) = + u;
            x(i4,k) = + u;
            x(i5,k) = - u;
            w(k) = b15;
            k = k + 1;
            x(i1,k) = - u;
            x(i2,k) = + u;
            x(i3,k) = + u;
            x(i4,k) = + u;
            x(i5,k) = + u;
            w(k) = b15;
            k = k + 1;
            x(i1,k) = + u;
            x(i2,k) = - u;
            x(i3,k) = - u;
            x(i4,k) = - u;
            x(i5,k) = - u;
            w(k) = b15;
            k = k + 1;
            x(i1,k) = + u;
            x(i2,k) = - u;
            x(i3,k) = - u;
            x(i4,k) = - u;
            x(i5,k) = + u;
            w(k) = b15;
            k = k + 1;
            x(i1,k) = + u;
            x(i2,k) = - u;
            x(i3,k) = - u;
            x(i4,k) = + u;
            x(i5,k) = - u;
            w(k) = b15;
            k = k + 1;
            x(i1,k) = + u;
            x(i2,k) = - u;
            x(i3,k) = - u;
            x(i4,k) = + u;
            x(i5,k) = + u;
            w(k) = b15;
            k = k + 1;
            x(i1,k) = + u;
            x(i2,k) = - u;
            x(i3,k) = + u;
            x(i4,k) = - u;
            x(i5,k) = - u;
            w(k) = b15;
            k = k + 1;
            x(i1,k) = + u;
            x(i2,k) = - u;
            x(i3,k) = + u;
            x(i4,k) = - u;
            x(i5,k) = + u;
            w(k) = b15;
            k = k + 1;
            x(i1,k) = + u;
            x(i2,k) = - u;
            x(i3,k) = + u;
            x(i4,k) = + u;
            x(i5,k) = - u;
            w(k) = b15;
            k = k + 1;
            x(i1,k) = + u;
            x(i2,k) = - u;
            x(i3,k) = + u;
            x(i4,k) = + u;
            x(i5,k) = + u;
            w(k) = b15;
            k = k + 1;
            x(i1,k) = + u;
            x(i2,k) = + u;
            x(i3,k) = - u;
            x(i4,k) = - u;
            x(i5,k) = - u;
            w(k) = b15;
            k = k + 1;
            x(i1,k) = + u;
            x(i2,k) = + u;
            x(i3,k) = - u;
            x(i4,k) = - u;
            x(i5,k) = + u;
            w(k) = b15;
            k = k + 1;
            x(i1,k) = + u;
            x(i2,k) = + u;
            x(i3,k) = - u;
            x(i4,k) = + u;
            x(i5,k) = - u;
            w(k) = b15;
            k = k + 1;
            x(i1,k) = + u;
            x(i2,k) = + u;
            x(i3,k) = - u;
            x(i4,k) = + u;
            x(i5,k) = + u;
            w(k) = b15;
            k = k + 1;
            x(i1,k) = + u;
            x(i2,k) = + u;
            x(i3,k) = + u;
            x(i4,k) = - u;
            x(i5,k) = - u;
            w(k) = b15;
            k = k + 1;
            x(i1,k) = + u;
            x(i2,k) = + u;
            x(i3,k) = + u;
            x(i4,k) = - u;
            x(i5,k) = + u;
            w(k) = b15;
            k = k + 1;
            x(i1,k) = + u;
            x(i2,k) = + u;
            x(i3,k) = + u;
            x(i4,k) = + u;
            x(i5,k) = - u;
            w(k) = b15;
            k = k + 1;
            x(i1,k) = + u;
            x(i2,k) = + u;
            x(i3,k) = + u;
            x(i4,k) = + u;
            x(i5,k) = + u;
            w(k) = b15;
          end
        end
      end
    end
  end

  return
end
