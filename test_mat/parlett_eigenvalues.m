function lambda = parlett_eigenvalues ( )

%*****************************************************************************80
%
%% PARLETT_EIGENVALUES returns the eigenvalues of the PARLETT matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    17 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real LAMBDA(100,1), the eigenvalues.
%
  n = 100;
  lambda = zeros ( n, 1 );

  for i = 1 : n
    lambda(i,1) = i;
  end

  return
end
