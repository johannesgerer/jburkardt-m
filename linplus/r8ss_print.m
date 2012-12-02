function r8ss_print ( n, na, diag, a, title )

%*****************************************************************************80
%
%% R8SS_PRINT prints a R8SS matrix.
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
%    07 April 2006
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
%
%    Input, integer DIAG(N), the indices in A of the N diagonal elements.
%
%    Input, real A(NA), the R8SS matrix.
%
%    Input, string TITLE, a title to be printed.
%
  r8ss_print_some ( n, na, diag, a, 1, 1, n, n, title );

  return
end
