function lambda = rutis5_eigenvalues ( )

%*****************************************************************************80
%
%% RUTIS5_EIGENVALUES returns the eigenvalues of the RUTIS5 matrix.
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
%    Output, real LAMBDA(4,1), the eigenvalues.
%
  n = 4;
  lambda = zeros ( n, 1 );

  lambda(1:4,1) = [ ...
    19.122479087555860; ...
    10.882816916492464; ...
     8.994169735037230; ...
     0.000534260914449 ];

  return
end
