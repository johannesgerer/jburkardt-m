function lambda = rutis1_eigenvalues ( )

%*****************************************************************************80
%
%% RUTIS1_EIGENVALUES returns the eigenvalues of the RUTIS1 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    20 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real LAMBDA(4), the eigenvalues.
%
  lambda(1:4) = [ ...
    15.0, ...
     5.0, ...
     5.0, ...
    -1.0 ];

  return
end
