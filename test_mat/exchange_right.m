function x = exchange_right ( n )

%*****************************************************************************80
%
%% EXCHANGE_RIGHT returns the right eigenvectors of the EXCHANGE matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 July 2011
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Output, real X(N,N), the eigenvector matrix.
%
  x(1:n,1:n) = 0.0;

  n2 = floor ( n / 2 );

  for j = 1 : n2

    i = n + 1 - j;

    x(j,j) =  1.0;
    x(i,j) = -1.0;

    x(j,i) =  1.0;
    x(i,i) =  1.0;

  end

  if ( mod ( n, 2 ) == 1 )
    x(n2+1,n2+1) = 1.0;
  end

  return
end
