function lam = sylvester_kac_eigenvalues ( n )

%*****************************************************************************80
%
%% SYLVESTER_KAC_EIGENVALUES: eigenvalues of the SYLVESTER_KAC matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 April 2015
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer N, the order of the matrix.
%
%    Output, real LAM(N,1), the eigenvalues.
%
  lam = zeros ( n, 1 );

  lam(1:n) = (- n + 1 ) : 2 : ( n - 1 );
 
% i = 1
% for j = - n + 1 : 2 : n - 1
%   lam(i) = j;
%   i = i + 1;
% end

  return
end
