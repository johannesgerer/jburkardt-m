function lambda = parlett_eigenvalues ( )

%*****************************************************************************80
%
%% PARLETT_EIGENVALUES returns the eigenvalues of the Parlett matrix.
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
%    Output, real LAMBDA(100), the eigenvalues.
%
  for i = 1 : 100
    lambda(i) = i;
  end

  return
end
