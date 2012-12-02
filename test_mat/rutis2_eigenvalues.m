function lambda = rutis2_eigenvalues ( )

%*****************************************************************************80
%
%% RUTIS2_EIGENVALUES returns the eigenvalues of the RUTIS2 matrix.
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
  lambda(1:4) = [
    10.0, ...
     5.0, ...
     2.0, ...
     1.0 ];

  return
end
