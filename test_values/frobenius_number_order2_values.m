function [ n_data, c1, c2, f ] = frobenius_number_order2_values ( n_data )

%*****************************************************************************80
%
%% FROBENIUS_NUMBER_ORDER2_VALUES returns values of the order 2 Frobenius number.
%
%  Discussion:
%
%    The Frobenius number of order N is the solution of the Frobenius
%    coin sum problem for N coin denominations.
%
%    The Frobenius coin sum problem assumes the existence of
%    N coin denominations, and asks for the largest value that cannot
%    be formed by any combination of coins of these denominations.
%
%    The coin denominations are assumed to be distinct positive integers.
%
%    For general N, this problem is fairly difficult to handle.
%
%    For N = 2, it is known that:
%
%    * if C1 and C2 are not relatively prime, then
%      there are infinitely large values that cannot be formed.
%
%    * otherwise, the largest value that cannot be formed is
%      C1 * C2 - C1 - C2, and that exactly half the values between
%      1 and C1 * C2 - C1 - C2 + 1 cannot be represented.
%
%    As a simple example, if C1 = 2 and C2 = 7, then the largest
%    unrepresentable value is 5, and there are (5+1)/2 = 3
%    unrepresentable values, namely 1, 3, and 5.
%
%    For a general N, and a set of coin denominations C1, C2, ..., CN,
%    the Frobenius number F(N, C(1:N) ) is defined as the largest value
%    B for which the equation
%
%      C1*X1 + C2*X2 + ... + CN*XN = B
%
%    has no nonnegative integer solution X(1:N).
%
%    In Mathematica, the Frobenius number can be determined by
%
%      FrobeniusNumber[ {C1,...,CN} ]
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 November 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Gerard Cornuejols, Regina Urbaniak, Robert Weismantel, Laurence Wolsey,
%    Decomposition of Integer Programs and of Generating Sets,
%    in Algorithms - ESA '97,
%    Lecture Notes in Computer Science 1284,
%    edited by Rainer Burkard, G Woeginger,
%    Springer, 1997, pages 92-103,
%    LC: QA76.9.A43.E83.
%
%    Robert Owens,
%    An Algorithm to Solve the Frobenius Problem,
%    Mathematics Magazine,
%    Volume 76, Number 4, October 2003, 264-275.
%
%    James Sylvester,
%    Question 7382,
%    Mathematical Questions with their Solutions,
%    Educational Times,
%    Volume 41, page 21, 1884.
%
%    Stephen Wolfram,
%    The Mathematica Book,
%    Fourth Edition,
%    Cambridge University Press, 1999,
%    ISBN: 0-521-64314-7,
%    LC: QA76.95.W65.
%
%  Parameters:
%
%    Input/output, integer N_DATA.  The user sets N_DATA to 0 before the
%    first call.  On each call, the routine increments N_DATA by 1, and
%    returns the corresponding data; when there is no more data, the
%    output value of N_DATA will be 0 again.
%
%    Output, integer C1, C2, the parameters of the function.
%
%    Output, integer F, the value of the function.
%
  n_max = 6;

  c1_vec = [ ...
     2, ...
     3, ...
     4, ...
     5, ...
    12, ...
    99 ];
  c2_vec = [ ...
      5, ...
     17, ...
     19, ...
     13, ...
     11, ...
    100 ];
  f_vec = [ ...
       3, ...
      31, ...
      53, ...
      47, ...
     109, ...
    9701 ];

  if ( n_data < 0 )
    n_data = 0;
  end

  n_data = n_data + 1;

  if ( n_max < n_data )
    n_data = 0;
    c1 = 0;
    c2 = 0;
    f = 0;
  else
    c1 = c1_vec(n_data);
    c2 = c2_vec(n_data);
    f = f_vec(n_data);
  end

  return
end

