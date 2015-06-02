function a = rutis3_inverse ( )

%*****************************************************************************80
%
%% RUTIS3_INVERSE returns the inverse of the RUTIS3 matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 November 2007
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
     103.0,  125.0,   -5.0,  79.0; ...
       5.0,  103.0,  -79.0, 125.0; ...
    -125.0,  -79.0,  103.0,  -5.0; ...
      79.0,    5.0, -125.0, 103.0 ];

  a(1:4,1:4) = a(1:4,1:4) / 624.0;

  return
end
