function a = rutis2_inverse ( )

%*****************************************************************************80
%
%% RUTIS2_INVERSE returns the inverse of the RUTIS2 matrix.
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

%
%  Note that the matrix entries are listed by row.
%
  a(1:4,1:4) = [ ...
     28.0,  -22.0, -1.0, -1.0; ...
    -22.0,   28.0, -1.0, -1.0; ...
     -1.0,   -1.0, 17.0, -8.0; ...
     -1.0,   -1.0, -8.0, 17.0 ];

  a(1:4,1:4) = a(1:4,1:4) / 50.0;

  return
end
