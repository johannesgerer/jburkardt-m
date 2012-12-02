function a = rutis1_inverse ( )

%*****************************************************************************80
%
%% RUTIS1_INVERSE returns the inverse of the RUTIS1 matrix.
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
%  Reference:
%
%    Joan Westlake,
%    A Handbook of Numerical Matrix Inversion and Solution of 
%    Linear Equations,
%    John Wiley, 1968,
%    ISBN13: 978-0471936756,
%    LC: QA263.W47.
%
%  Parameters:
%
%    Output, real A(4,4), the matrix.
%
  a(1:4,1:4) = [ ...
    -2.0,  4.0,  4.0, -5.0; ...
     4.0, -2.0, -5.0,  4.0; ...
     4.0, -5.0, -2.0,  4.0; ...
    -5.0,  4.0,  4.0, -2.0 ]';

  a(1:4,1:4) = a(1:4,1:4) / 15.0;

  return
end
