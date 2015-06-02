function lambda = rosser1_eigenvalues ( )

%*****************************************************************************80
%
%% ROSSER1_EIGENVALUES returns the eigenvalues of the ROSSER1 matrix.
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
%    Output, real LAMBDA(8,1), the eigenvalues.
%
  n = 8;
  lambda = zeros ( n, 1 );

  a = sqrt ( 10405.0 );
  b = sqrt ( 26.0 );

  lambda(1:8,1) = [ ...
     -10.0 * a, ...
       0.0, ...
     510.0 - 100.0 * b, ...
    1000.0, ...
    1000.0, ...
     510.0 + 100.0 * b, ...
    1020.0, ...
    10.0 * a ];

  return
end
