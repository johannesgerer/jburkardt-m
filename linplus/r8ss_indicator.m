function [ na, diag, a ] = r8ss_indicator ( n )

%*****************************************************************************80
%
%% R8SS_INDICATOR sets up a R8SS indicator matrix.
%
%  Discussion:
%
%    The R8SS storage format is used for real symmetric skyline matrices.
%    This storage is appropriate when the nonzero entries of the
%    matrix are generally close to the diagonal, but the number
%    of nonzeroes above each diagonal varies in an irregular fashion.
%
%    In this case, the strategy is essentially to assign column J
%    its own bandwidth, and store the strips of nonzeros one after
%    another.   Note that what's important is the location of the
%    furthest nonzero from the diagonal.  A slot will be set up for
%    every entry between that and the diagonal, whether or not
%    those entries are zero.
%
%    A skyline matrix can be Gauss-eliminated without disrupting
%    the storage scheme, as long as no pivoting is required.
%
%    The user must set aside ( N * ( N + 1 ) ) / 2 entries for the array,
%    although the actual storage needed will generally be about half of
%    that.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 March 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%    N must be positive.
%
%    Output, integer NA, the dimension of the array A, which for this
%    special case will be the maximum, ( N * ( N + 1 ) ) / 2
%
%    Output, integer DIAG(N), the indices in A of the N diagonal elements.
%
%    Output, real A((N*(N+1))/2), the R8SS matrix.
%
  fac = 10^( i4_log_10 ( n ) + 1 );

  na = 0;

  for j = 1 : n

    for i = 1 : j
      na = na + 1;
      a(na) = fac * i + j;
    end

    diag(j) = na;

  end

  return
end
