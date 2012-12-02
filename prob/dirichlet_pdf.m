function pdf = dirichlet_pdf ( x, n, a )

%*****************************************************************************80
%
%% DIRICHLET_PDF evaluates the Dirichlet PDF.
%
%  Discussion:
%
%    PDF(X)(N,A) = Product ( 1 <= I <= N ) X(I)**( A(I) - 1 )
%      * Gamma ( A_SUM ) / A_PROD
%
%    where
%
%      0 < A(I) for all I;
%      0 <= X(I) for all I;
%      Sum ( 1 <= I <= N ) X(I) = 1;
%      A_SUM = Sum ( 1 <= I <= N ) A(I).
%      A_PROD = Product ( 1 <= I <= N ) Gamma ( A(I) )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real X(N), the argument of the PDF.  Each X(I) should
%    be greater than 0.0, and the X(I)'s must add up to 1.0.
%
%    Input, integer N, the number of components.
%
%    Input, real A(N), the probabilities for each component.
%    Each A(I) should be positive.
%
%    Output, real PDF, the value of the PDF.
%
  tol = 0.0001;

  for i = 1 : n
    if ( x(i) <= 0.0 )
      fprintf ( 1, '\n' );
      fprintf ( 1,  'DIRICHLET_PDF - Fatal error!\n' );
      fprintf ( 1,  '  X(I) <= 0.\n' );
    end
  end

  x_sum = sum ( x(1:n) );

  if ( tol < abs ( x_sum - 1.0 ) )
    fprintf ( 1, '\n' );
    fprintf ( 1,  'DIRICHLET_PDF - Fatal error!\n' );
    fprintf ( 1,  '  SUM X(I) =/= 1.\n' );
  end

  a_sum = sum ( a(1:n) );

  a_prod = 1.0;
  for i = 1 : n
    a_prod = a_prod * gamma ( a(i) );
  end

  pdf = gamma ( a_sum ) / a_prod;
  for i = 1 : n
    pdf = pdf * x(i)^( a(i) - 1.0 );
  end

  return
end
