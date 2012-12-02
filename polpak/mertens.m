function value = mertens ( n )

%*****************************************************************************80
%
%% MERTENS evaluates the Mertens function.
%
%  Discussion:
%
%    The Mertens function M(N) is the sum from 1 to N of the Moebius
%    function MU.  That is,
%
%    M(N) = sum ( 1 <= I <= N ) MU(I)
%
%        N   M(N)
%        --  ----
%         1     1
%         2     0
%         3    -1
%         4    -1
%         5    -2
%         6    -1
%         7    -2
%         8    -2
%         9    -2
%        10    -1
%        11    -2
%        12    -2
%       100     1
%      1000     2
%     10000   -23
%    100000   -48
%
%    The determinant of the Redheffer matrix of order N is equal
%    to the Mertens function M(N).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    M Deleglise, J Rivat,
%    Computing the Summation of the Moebius Function,
%    Experimental Mathematics,
%    Volume 5, 1996, pages 291-295.
%
%    Eric Weisstein,
%    CRC Concise Encyclopedia of Mathematics,
%    CRC Press, 2002,
%    Second edition,
%    ISBN: 1584883472,
%    LC: QA5.W45
%
%  Parameters:
%
%    Input, integer N, the argument.
%
%    Output, integer VALUE, the value.
%
  value = 0;

  for i = 1 : n
    value = value + moebius ( i );
  end

  return
end
