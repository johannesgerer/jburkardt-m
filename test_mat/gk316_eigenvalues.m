function lambda = gk316_eigenvalues ( n )

%*****************************************************************************80
%
%% GK316_EIGENVALUES returns the eigenvalues of GK316.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    09 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of A.
%
%    Output, real LAMBDA(N), the eigenvalues.
%
  if ( n == 1 )

    lambda(1) = 1.0;

  else

    lambda(1:n-2) = 1.0;

    a = 1.0;
    b = - ( n + 1 );
    c = - ( n * ( n + 1 ) * ( 2 * n - 5 ) ) / 6.0;

    lambda(n-1) = ( - b + sqrt ( b * b - 4.0 * a * c ) ) / ( 2.0 * a );
    lambda(n) =   ( - b - sqrt ( b * b - 4.0 * a * c ) ) / ( 2.0 * a );

  end

  return
end
