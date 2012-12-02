function lambda = rutis3_eigenvalues ( )

%*****************************************************************************80
%
%% RUTIS3_EIGENVALUES returns the eigenvalues of the Rutishauser3 matrix.
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
%    Output, complex LAMBDA(4), the eigenvalues.
%
  i = sqrt ( -1.0 );

  lambda(1:4) = [ ...
     12.0, ...
      1.0 + 5.0 * i, ...
      1.0 - 5.0 * i, ...
      2.0 ];

  return
end
