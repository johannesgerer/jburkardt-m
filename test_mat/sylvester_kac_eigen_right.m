function v = sylvester_kac_eigen_right ( n )

%*****************************************************************************80
%
%% SYLVESTER_KAC_EIGEN_RIGHT: right eigenvectors of the SYLVESTER_KAC matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 April 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Output, real V(N,N), the right eigenvectors.
%
  b = 1 : n - 1;
  c = n - 1 : -1 : 1;

  v = zeros ( n, n );

  for j = 1 : n

    lam = - n - 1 + 2 * j;

    a = zeros ( n, 1 );
    a(1) = 1.0;
    a(2) = - lam;
    for i = 3 : n 
      a(i) = - lam * a(i-1) - b(i-2) * c(i-2) * a(i-2);
    end

    bot = 1.0;
    v(1,j) = 1.0;
    for i = 2 : n
      bot = bot * b(i-1);
      v(i,j) = r8_mop ( i - 1 ) * a(i) / bot;
    end

  end

  return
end
