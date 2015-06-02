function b = bernoulli_number2 ( n )

%*****************************************************************************80
%
%% BERNOULLI_NUMBER2 evaluates the Bernoulli numbers.
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
%    Note that the Bernoulli numbers grow rapidly.  Bernoulli number
%    62 is probably the last that can be computed on the VAX without
%    overflow.
%
%    A different method than that used in BERN is employed.
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
%    31 July 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the highest order Bernoulli number to compute.
%
%    Output, real B(1:N+1), the requested Bernoulli numbers B(0) through
%    B(N).
%
  kmax = 400;
  tol = 1.0E-06;

  if ( n < 0 )
    b = [];
    return
  end

  b(1) = 1.0;

  if ( n < 1 )
    return
  end

  b(2) = -0.5;

  if ( n < 2 )
    return
  end

  altpi = log ( 2.0 * pi );
%
%  Initial estimates for B(I), I = 2 to N
%
  b(3) = log ( 2.0 );
  for i = 3 : n
    if ( mod ( i, 2 ) == 1 )
      b(i+1) = 0.0;
    else
      b(i+1) = log ( i * ( i - 1 ) ) + b(i-1);
    end
  end

  b(3) = 1.0 / 6.0;

  if ( n <= 3 )
    return;
  end

  b(5) = - 1.0 / 30.0;

  sgn = -1.0;
 
  for i = 6 : 2 : n
 
    sgn = -sgn;
    t = 2.0 * sgn * exp ( b(i+1) - i * altpi );
 
    sum2 = 1.0;

    for k = 2 : kmax

      term = k^(-i);
      sum2 = sum2 + term;

      if ( term <= tol * sum2 )
        break
      end

    end
 
    b(i+1) = t * sum2;
 
  end

  return
end

