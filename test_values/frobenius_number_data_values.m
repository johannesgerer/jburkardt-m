function [ c, f ] = frobenius_number_data_values ( n_data, order )

%*****************************************************************************80
%
%% FROBENIUS_NUMBER_DATA_VALUES returns data for the Frobenius problem.
%
%  Discussion:
%
%    The user should first call FROBENIUS_NUMBER_ORDER_VALUES to get the
%    order or size of the "C" vector that will be returned by this routine.
%
%    The Frobenius number of order N and data C is the solution of the
%    Frobenius coin sum problem for N coin denominations C(1) through C(N).
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
%    Springer, 1997, pages 92-103.
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
%    Input, integer N_DATA.  Unlike most other routines in this
%    library, this routine assumes that N_DATA has already been processed by a call
%    to FROBENIUS_NUMBER_ORDER_VALUE.  Therefore, this routine will return the
%    next set of data as long as N_DATA is in the expected range.
%
%    Input, integer ORDER, the order of the problem.
%
%    Output, integer C(ORDER), the denominations of the problem.
%
%    Output, integer F, the value of the function.
%
  cvec_max = 77;
  n_max = 19;
  c_vec = [ ...
        2,     5, ...
        3,    17, ...
        4,    19, ...
        5,    13, ...
       12,    11, ...
       99,   100, ...
        6,     9,    20, ...
        5,    17,    23, ...
      137,   251,   256, ...
       31,    41,    47,    61, ...
      271,   277,   281,   283, ...
       10,    18,    26,    33,    35, ...
       34,    37,    38,    40,    43, ...
    12223, 12224, 36674, 61119, 85569, ...
     1000,  1476,  3764,  4864,  4871,  7773, ...
    12228, 36679, 36682, 46908, 61139, 73365, ...
    12137, 36405, 24269, 36407, 84545, 60683, ...
    13211, 13212, 39638, 66060, 52864, 79268, 92482, ...
    13429, 26850, 26855, 40280, 40281, 53711, 53714, 67141 ...
  ];
  f_vec = [ ...
          3, ...
         31, ...
         53, ...
         47, ...
        109, ...
       9701, ...
         43, ...
         41, ...
       4948, ...
        240, ...
      13022, ...
         67, ...
        175, ...
   89643481, ...
      47350, ...
   89716838, ...
   58925134, ...
  104723595, ...
   45094583 ];

  persistent v_data;

  if ( isempty ( v_data ) )
    v_data = 0;
  end

  if ( n_data < 1 | n_max < n_data )
    n_data = 0;
    v_data = 0;
    c(1:order) = 0;
    f = 0;
  else
    c(1:order) = c_vec(v_data+1:v_data+order);
    v_data = v_data + order;
    if ( n_data == n_max )
      v_data = 0;
    end
    f = f_vec(n_data);
  end

  return
end
