function lambda = wilson_eigenvalues ( )

%*****************************************************************************80
%
%% WILSON_EIGENVALUES returns the eigenvalues of the WILSON matrix.
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
%    Output, real X(4), the eigenvalues..
%
  lambda(1:4) = [ ...
    30.288685345802129, ...
     3.858057455944950, ...
     0.843107149855033, ...
     0.010150048397892 ];

  return
end
