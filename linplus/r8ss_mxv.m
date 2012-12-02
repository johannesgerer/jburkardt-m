function b = r8ss_mxv ( n, na, diag, a, x )

%*****************************************************************************80
%
%% R8SS_MXV multiplies a R8SS matrix times a vector.
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
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    15 February 2004
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
%    Input, integer NA, the dimension of the array A.
%    NA must be at least N.
%
%    Input, integer DIAG(N), the indices in A of the N diagonal elements.
%
%    Input, real A(NA), the R8SS matrix.
%
%    Input, real X(N), the vector to be multiplied by A.
%
%    Output, real B(N), the product A*x.
%
  b(1:n) = 0.0E+00;

  diagold = 0;
  k = 0;

  for j = 1 : n

    ilo = j + 1 + diagold - diag(j);

    for i = ilo : j-1
      k = k + 1;
      b(i) = b(i) + a(k) * x(j);
      b(j) = b(j) + a(k) * x(i);
    end

    k = k + 1;
    b(j) = b(j) + a(k) * x(j);

    diagold = diag(j);

  end

  return
end
