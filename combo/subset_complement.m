function b = subset_complement ( n, a )

%*****************************************************************************80
%
%% SUBSET_COMPLEMENT computes the complement of a set.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 August 2011
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
%    Input, integer N, the order of the master set, of which A is
%    a subset.  N must be positive.
%
%    Input, integer A(N), a subset of the master set.
%    A(I) = 0 if the I-th element is in the subset A, and is
%    1 otherwise.
%
%    Output, integer B(N), the complement of A.
%

%
%  Check.
%
  subset_check ( n, a );

  b(1:n) = 1 - a(1:n);

  return
end
