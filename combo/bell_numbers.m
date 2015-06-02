function b = bell_numbers ( m )

%*****************************************************************************80
%
%% BELL_NUMBERS computes the Bell numbers.
%
%  Discussion:
%
%    There are B(M) restricted growth functions of length M.
%
%    There are B(M) partitions of a set of M objects.
%
%    B(M) is the sum of the Stirling numbers of the second kind,
%    S(M,N), for N = 0 to M.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 January 2011
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Donald Kreher, Douglas Simpson,
%    Combinatorial Algorithms,
%    CRC Press, 1998,
%    ISBN: 0-8493-3988-X,
%    LC: QA164.K73.
%
%  Parameters:
%
%    Input, integer M, indicates how many Bell numbers are to
%    compute.  M must be nonnegative.
%
%    Output, integer B(1:M+1), the first M+1 Bell numbers.
%
  b = zeros ( m + 1, 1 );

  offset = 1;

  b(0+offset) = 1;
  for j = 1 : m
    b(j+offset) = 0;
    for i = 0 : j - 1
      b(j+offset) = b(j+offset) + i4_choose ( j - 1, i ) * b(i+offset);
    end
  end

  return
end
