function [ o, x, w ] = en_her_07_3 ( n, option )

%*****************************************************************************80
%
%% EN_HER_07_3 implements the Stroud rule 7.3 for region EN_HER.
%
%  Discussion:
%
%    The rule has order O = ( 4 * N^3 + 8 * N + 3 ) / 3.
%
%    The rule has precision P = 7.
%
%    EN_HER is the entire N-dimensional space with weight function
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
%     3   45
%     4   97
%     5  181
%     6  305
%
%    The reference has a typographical error for N = 5, OPTION 1, B4:
%
%      -(1)0.736330882774831
%
%    should read
%
%      (-1)0.736330882774831
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
  if ( n < 3 || 6 < n )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'EN_HER_07_3 - Fatal error!\n' );
    fprintf ( 1, '  3 <= N <= 6 required.\n' );
    error ( 'EN_HER_07_3 - Fatal error!' )
  end

  if ( nargin < 2 )
    option = 1;
  end

  if ( option < 1 || 2 < option )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'EN_HER_07_3 - Fatal error!\n' );
    fprintf ( 1, '  1 <= OPTION <= 2 required.\n' );
    error ( 'EN_HER_07_3 - Fatal error!' )
  end

  o = ( 4 * n^3 + 8 * n + 3 ) / 3;

  if ( n == 3 && option == 1 )
    u =    0.524647623275290E+00;
    v =    0.165068012388578E+01;
    b0 = - 0.166705761599566E+02;
    b1 =   0.100296981655678E+02;
    b2 =   0.161699246687754E+00;
    b3 = - 0.604719151221535E+01;
    b4 =   0.234381399489666E-01;
    b5 =   0.417194501880647E+01;
  elseif ( n == 3 && option == 2 )
    u =    0.165068012388578E+01;
    v =    0.524647623275290E+00;
    b0 =   0.166705761599566E+02;
    b1 =   0.178903161957074E+00;
    b2 = - 0.665808190965810E+01;
    b3 =   0.148361823143070E-01;
    b4 =   0.229669852539758E+01;
    b5 =   0.430097881732984E-02;
  elseif ( n == 4 && option == 1 )
    u  =   0.524647623275290E+00;
    v  =   0.165068012388578E+01;
    b0 = - 0.167539329651562E+03;
    b1 =   0.687922329603575E+02;
    b2 =   0.203518409659014E+00;
    b3 = - 0.255075279116885E+02;
    b4 =   0.415430214106084E-01;
    b5 =   0.739458001434961E+01;
  elseif ( n == 4 && option == 2 )
    u =    0.165068012388578E+01;
    v =    0.524647623275290E+00;
    b0 =   0.688432856406677E+02;
    b1 =   0.294997847268286E+00;
    b2 = - 0.199427272118378E+02;
    b3 =   0.110498755408511E-01;
    b4 =   0.407079214570997E+01;
    b5 =   0.762328646743931E-02;
  elseif ( n == 5 && option == 1 )
    u  =   0.524647623275290E+00;
    v  =   0.165068012388578E+01;
    b0 = - 0.826940846964452E+03;
    b1 =   0.264779097660331E+03;
    b2 =   0.213460812375320E+00;
    b3 = - 0.714240197186780E+02;
    b4 =   0.736330882774831E-01;
    b5 =   0.131065518222629E+02;
  elseif ( n == 5 && option == 2 )
    u =    0.165068012388578E+01;
    v =    0.524647623275290E+00;
    b0 =   0.220502344940121E+03;
    b1 =   0.537746975313769E+00;
    b2 = - 0.497781460739792E+02;
    b3 = - 0.743845245712926E-02;
    b4 =   0.721529121489956E+01;
    b5 =   0.135119234557687E-01;
  elseif ( n == 6 && option == 1 )
    u  =   0.524647623275290E+00;
    v  =   0.165068012388578E+01;
    b0 = - 0.309679578630802E+04;
    b1 =   0.815423321880237E+03;
    b2 =   0.117326937169073E+00;
    b3 = - 0.173057295296448E+03;
    b4 =   0.130511250871491E+00;
    b5 =   0.232307582494626E+02;
  elseif ( n == 6 && option == 2 )
    u =    0.165068012388578E+01;
    v =    0.524647623275290E+00;
    b0 =   0.616293651884027E+03;
    b1 =   0.107529736766179E+01;
    b2 = - 0.113807008098269E+03;
    b3 = - 0.610828352270520E-01;
    b4 =   0.127887706992535E+02;
    b5 =   0.239492607623178E-01;
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
%  8 * ( N * ( N - 1 ) * ( N - 2 ) / 6 ) points.
%
  for i = 1 : n - 2
    for j = i + 1 : n - 1
      for l = j + 1 : n
        k = k + 1;
        x(i,k) = - u;
        x(j,k) = - u;
        x(l,k) = - u;
        w(k) = b5;
        k = k + 1;
        x(i,k) = - u;
        x(j,k) = - u;
        x(l,k) = + u;
        w(k) = b5;
        k = k + 1;
        x(i,k) = - u;
        x(j,k) = + u;
        x(l,k) = - u;
        w(k) = b5;
        k = k + 1;
        x(i,k) = - u;
        x(j,k) = + u;
        x(l,k) = + u;
        w(k) = b5;
        k = k + 1;
        x(i,k) = + u;
        x(j,k) = - u;
        x(l,k) = - u;
        w(k) = b5;
        k = k + 1;
        x(i,k) = + u;
        x(j,k) = - u;
        x(l,k) = + u;
        w(k) = b5;
        k = k + 1;
        x(i,k) = + u;
        x(j,k) = + u;
        x(l,k) = - u;
        w(k) = b5;
        k = k + 1;
        x(i,k) = + u;
        x(j,k) = + u;
        x(l,k) = + u;
        w(k) = b5;
      end
    end
  end

  return
end
