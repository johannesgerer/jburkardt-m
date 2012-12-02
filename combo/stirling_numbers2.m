function s = stirling_numbers2 ( m, n )

%*****************************************************************************80
%
%% STIRLING_NUMBERS2 computes Stirling numbers of the second kind.
%
%  Discussion:
%
%    The reference has a typographical error, referring to
%    S(I-J,J-1) instead of S(I-1,J-1).
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 July 2011
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
%    Input, integer M, the maximum row to compute.
%    M must be nonnegative.
%
%    Input, integer N, the maximum column to compute.
%    N must be nonnegative.
%
%    Output, integer S(1:M+1,1:N+1), the first M+1 rows and N+1 columns
%    of the table of Stirling numbers of the second kind.
%
  s = zeros(m+1,n+1);

  s(1,1) = 1;

  for i = 1 : m
    for j = 1 : n
      if ( j <= i )
        s(i+1,j+1) = j * s(i,j+1) + s(i,j);
      end
    end
  end

  return
end
