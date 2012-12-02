function [ na, diag, a, seed ] = r8ss_random ( n, seed )

%*****************************************************************************80
%
%% R8SS_RANDOM randomizes a R8SS matrix.
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
%    27 August 2006
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
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, integer NA, the dimension of the array A.
%    NA will be at least N and no greater than ( N * ( N + 1 ) ) / 2.
%
%    Output, integer DIAG(N), the indices in A of the N diagonal elements.
%
%    Output, real A((N*(N+1))/2), the R8SS matrix.
%
%    Output, integer SEED, a seed for the random number generator.
%

%
%  Set the values of DIAG.
%
  diag(1) = 1;
  na = 1;
  for i = 2 : n
    [ k, seed ] = i4_uniform ( 1, i, seed );
    diag(i) = diag(i-1) + k;
    na = na + k;
  end
%
%  Now set the values of A.
%
  diagold = 0;
  k = 0;

  for j = 1 : n

    ilo = j + 1 + diagold - diag(j);

    for i = ilo : j
      k = k + 1;
      [ a(k), seed ] = r8_uniform_01 ( seed );
    end

    diagold = diag(j);

  end

  return
end
