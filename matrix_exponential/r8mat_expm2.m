function E = r8mat_expm2 ( A )

%*****************************************************************************80
%
%% R8MAT_EXPM2 uses the Taylor series for the matrix exponential.
%
%  Discussion:
%
%    Formally,
%
%      exp ( A ) = I + A + 1/2 A^2 + 1/3! A^3 + ...
%
%    This function sums the series until a tolerance is satisfied.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    18 March 2011
%
%  Author:
%
%    Cleve Moler, Charles Van Loan
%
%  Reference:
%
%    Cleve Moler, Charles VanLoan,
%    Nineteen Dubious Ways to Compute the Exponential of a Matrix,
%    Twenty-Five Years Later,
%    SIAM Review,
%    Volume 45, Number 1, March 2003, pages 3-49.
%
%  Parameters:
%
%    Input, real A(N,N), the matrix.
%
%    Output, real E(N,N), the estimate for exp(A).
%
  E = zeros ( size ( A ) );
  F = eye ( size ( A ) );
  k = 1;

  while ( 0 < norm ( E + F - E, 1 ) )
    E = E + F;
    F = A * F / k;
    k = k + 1;
  end

  return
end
