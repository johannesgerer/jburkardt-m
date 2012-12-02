function [ n_data, n, c ] = bernoulli_number_values ( n_data )

%*****************************************************************************80
%
%% BERNOULLI_NUMBER_VALUES returns some values of the Bernoulli numbers.
%
%  Discussion:
%
%    The Bernoulli numbers are rational.
%
%    If we define the sum of the M-th powers of the first N integers as:
%
%      SIGMA(M,N) = sum ( 0 <= I <= N ) I**M
%
%    and let C(I,J) be the combinatorial coefficient:
%
%      C(I,J) = I! / ( ( I - J )! * J! )
%
%    then the Bernoulli numbers B(J) satisfy:
%
%      SIGMA(M,N) = 1/(M+1) * sum ( 0 <= J <= M ) C(M+1,J) B(J) * (N+1)**(M+1-J)
%
%    In Mathematica, the function can be evaluated by:
%
%      BernoulliB[n]
%
%  First values:
%
%   B0  1                   =         1.00000000000
%   B1 -1/2                 =        -0.50000000000
%   B2  1/6                 =         1.66666666666
%   B3  0                   =         0
%   B4 -1/30                =        -0.03333333333
%   B5  0                   =         0
%   B6  1/42                =         0.02380952380
%   B7  0                   =         0
%   B8 -1/30                =        -0.03333333333
%   B9  0                   =         0
%  B10  5/66                =         0.07575757575
%  B11  0                   =         0
%  B12 -691/2730            =        -0.25311355311
%  B13  0                   =         0
%  B14  7/6                 =         1.16666666666
%  B15  0                   =         0
%  B16 -3617/510            =        -7.09215686274
%  B17  0                   =         0
%  B18  43867/798           =        54.97117794486
%  B19  0                   =         0
%  B20 -174611/330          =      -529.12424242424
%  B21  0                   =         0
%  B22  854,513/138         =      6192.123
%  B23  0                   =         0
%  B24 -236364091/2730      =    -86580.257
%  B25  0                   =         0
%  B26  8553103/6           =   1425517.16666
%  B27  0                   =         0
%  B28 -23749461029/870     = -27298231.0678
%  B29  0                   =         0
%  B30  8615841276005/14322 = 601580873.901
%
%  Recursion:
%
%    With C(N+1,K) denoting the standard binomial coefficient,
%
%    B(0) = 1.0
%    B(N) = - ( sum ( 0 <= K < N ) C(N+1,K) * B(K) ) / C(N+1,N)
%
%  Special Values:
%
%    Except for B(1), all Bernoulli numbers of odd index are 0.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Milton Abramowitz and Irene Stegun,
%    Handbook of Mathematical Functions,
%    US Department of Commerce, 1964.
%
%    Stephen Wolfram,
%    The Mathematica Book,
%    Fourth Edition,
%    Wolfram Media / Cambridge University Press, 1999.
%
%  Parameters:
%
%    Input/output, integer N_DATA.  The user sets N_DATA to 0 before the
%    first call.  On each call, the routine increments N_DATA by 1, and
%    returns the corresponding data; when there is no more data, the
%    output value of N_DATA will be 0 again.
%
%    Output, integer N, the order of the Bernoulli number.
%
%    Output, real C, the value of the Bernoulli number.
%
  n_max = 10;

  c_vec = [ ...
      0.1000000000000000E+01, ...
     -0.5000000000000000E+00, ...
      0.1666666666666667E+00, ...
      0.0000000000000000E+00, ...
     -0.3333333333333333E-01, ...
     -0.2380952380952380E-01, ...
     -0.3333333333333333E-01, ...
      0.7575757575757575E-01, ...
     -0.5291242424242424E+03, ...
      0.6015808739006424E+09 ];

  n_vec = [ ...
     0,  1,  2,  3,  4, 6,  8, 10, 20, 30 ];

  if ( n_data < 0 )
    n_data = 0;
  end

  n_data = n_data + 1;

  if ( n_max < n_data )
    n_data = 0;
    n = 0;
    c = 0.0;
  else
    n = n_vec(n_data);
    c = c_vec(n_data);
  end

  return
end
