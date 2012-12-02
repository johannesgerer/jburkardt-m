function [ a, seed ] = r8pp_random ( n, seed )

%*****************************************************************************80
%
%% R8PP_RANDOM randomizes a R8PP matrix.
%
%  Discussion:
%
%    The R8PP storage format is appropriate for a symmetric positive
%    definite matrix.  Only the upper triangle of the matrix is stored,
%    by successive partial columns, in an array of length (N*(N+1))/2,
%    which contains (A11,A12,A22,A13,A23,A33,A14,...,ANN)  
%
%    The matrix is computed by setting a "random" upper triangular
%    Cholesky factor R, and then computing A = R'*R.
%    The randomness is limited by the fact that all the entries of
%    R will be between 0 and 1.  A truly random R is only required
%    to have positive entries on the diagonal.
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
%    Input, integer SEED, a seed for the random number generator.
%
%    Output, real A((N*(N+1))/2), the R8PP matrix.
%
%    Output, integer SEED, an updated seed for the random number generator.
%
  a(1:(n*(n+1))/2) = 0.0;

  for i = n : -1 : 1
%
%  Set row I of R.
%
    for j = i : n
      ij = i + ( j * ( j - 1 ) ) / 2;
      [ a(ij), seed ] = r8_uniform_01 ( seed );
    end
%
%  Consider element J of row I, last to first.
%
    for j = n : -1 : i
%
%  Add multiples of row I to lower elements of column J.
%
      ij = i + ( j * ( j - 1 ) ) / 2;

      for k = i+1 : j
        kj = k + ( j * ( j - 1 ) ) / 2;
        ik = i + ( k * ( k - 1 ) ) / 2;
        a(kj) = a(kj) + a(ik) * a(ij);
      end
%
%  Reset element J.
%
      ii = i + ( i * ( i - 1 ) ) / 2;
      a(ij) = a(ii) * a(ij);

    end
  end

  return
end
