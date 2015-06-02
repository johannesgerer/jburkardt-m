function a = wilson_inverse ( )

%*****************************************************************************80
%
%% WILSON_INVERSE returns the inverse of the WILSON matrix.
%
%  Formula:
%
%     68 -41 -17  10
%    -41  25  10  -6
%    -17  10   5  -3
%     10  -6  -3   2
%
%  Properties:
%
%    A is symmetric: A' = A.
%
%    Because A is symmetric, it is normal.
%
%    Because A is normal, it is diagonalizable.
%
%    A is integral, therefore det ( A ) is integral, and 
%    det ( A ) * inverse ( A ) is integral.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 October 2007
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
  a(1:4,1:4) =  [ 68.0, -41.0, -17.0,  10.0; ...
                 -41.0,  25.0,  10.0,  -6.0; ...
                 -17.0,  10.0,   5.0,  -3.0; ...
                  10.0,  -6.0,  -3.0,   2.0 ];

  return
end
