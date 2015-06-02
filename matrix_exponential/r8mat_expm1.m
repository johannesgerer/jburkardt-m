function E = r8mat_expm1 ( A )

%*****************************************************************************80
%
%% R8MAT_EXPM1 is essentially MATLAB's built-in matrix exponential algorithm.
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
  [ f, e ] = log2 ( norm ( A, 'inf' ) );
  s = max ( 0, e + 1 );
  A = A / 2^s;

  X = A;
  c = 1 / 2;
  E = eye ( size ( A ) ) + c * A;
  D = eye ( size ( A ) ) - c * A;
  q = 6;
  p = 1;

  for k = 2 :  q
    c = c * ( q - k + 1 ) / ( k * ( 2 * q - k + 1 ) );
    X = A * X;
    cX = c * X;
    E = E + cX;
    if ( p )
      D = D + cX;
    else
      D = D - cX;
    end
    p = ~p;
  end

  E = D \ E;

  for k = 1 : s
    E = E * E;
  end

  return
end
