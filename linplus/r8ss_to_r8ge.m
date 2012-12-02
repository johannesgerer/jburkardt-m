function b = r8ss_to_r8ge ( n, na, diag, a  )

%*****************************************************************************80
%
%% R8SS_TO_R8GE copies a R8SS matrix to a R8GE matrix.
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
%  Example:
%
%    11   0  13  0 15
%     0  22  23  0  0
%    31  32  33 34  0
%     0   0  43 44  0
%    51   0   0  0 55
%
%    A = ( 11 | 22 | 13, 23, 33 | 34, 44 | 15, 0, 0, 0, 55 )
%    NA = 12
%    DIAG = ( 1, 2, 5, 7, 12 )
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
%    Output, real B(N,N), the R8GE matrix.
%
  diagold = 0;
  k = 0;

  for j = 1 : n

    ilo = j + 1 + diagold - diag(j);

    b(1:ilo-1,j) = 0.0E+00;
    b(j,1:ilo-1) = 0.0E+00;

    for i = ilo : j-1
      k = k + 1;
      b(i,j) = a(k);
      b(j,i) = a(k);
    end

    k = k + 1;
    b(j,j) = a(k);

    diagold = diag(j);

  end

  return
end
