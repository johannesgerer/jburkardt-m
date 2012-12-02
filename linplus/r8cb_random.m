function [ a, seed ] = r8cb_random ( n, ml, mu, seed )

%*****************************************************************************80
%
%% R8CB_RANDOM randomizes a R8CB matrix.
%
%  Discussion:
%
%    The R8CB storage format is appropriate for a compact banded matrix.
%    It is assumed that the matrix has lower and upper bandwidths ML and MU,
%    respectively.  The matrix is stored in a way similar to that used
%    by LINPACK and LAPACK for a general banded matrix, except that in
%    this mode, no extra rows are set aside for possible fillin during pivoting.
%    Thus, this storage mode is suitable if you do not intend to factor
%    the matrix, or if you can guarantee that the matrix can be factored
%    without pivoting.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    16 February 2005
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
%    Input, integer ML, MU, the lower and upper bandwidths.
%    ML and MU must be nonnegative, and no greater than N-1.
%
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real A(ML+MU+1,N), the R8CB matrix.
%
%    Output, integer SEED, an updated seed for the random number generator.
%

%
%  Set the entries that correspond to matrix elements.
%
  for j = 1 : n

    ilo = max ( 1, j - mu );
    ihi = min ( n, j + ml );

    for i = j - mu : 0
      a(i-j+mu+1,j) = 0.0;
    end

    for i = ilo : ihi
      [ a(i-j+mu+1,j), seed ] = r8_uniform_01 ( seed );
    end

    for i = n + 1 : j + ml
      a(i-j+mu+1,j) = 0.0;
    end

  end

  return
end
