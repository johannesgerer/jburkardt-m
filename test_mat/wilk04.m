function a = wilk04 ( )

%*****************************************************************************80
%
%% WILK04 returns the WILK04 matrix.
%
%  Formula:
%
%    0.9143D-04  0.0     0.0     0.0
%    0.8762      0.7156D-04  0.0     0.0
%    0.7943      0.8143      0.9504D-04  0.0
%    0.8017      0.6123      0.7165      0.7123D-04
%
%  Properties:
%
%    A is lower triangular.
%
%    LAMBDA = ( 0.9143D-04, 0.7156D-04, 0.9504D-04, 0.7123D-04 ).
%
%  Discussion:
%
%    Since the matrix is already in lower triangular form, errors can
%    occur only in the backsubstitution.  However, even a double
%    precision calculation will show a significant degradation in the
%    solution.  It is also instructive to compare the actual error in
%    the solution to the residual error, A*x-b.
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
%    James Wilkinson,
%    Rounding Errors in Algebraic Processes,
%    Prentice Hall, 1963, page 105.
%
%  Parameters:
%
%    Output, real A(4,4), the matrix.
%
  a(1:4,1:4) = [ 0.9143E-04, 0.8762,     0.7943,     0.8017; ...
                 0.0000,     0.7156E-04, 0.8143,     0.6123; ...
                 0.0000,     0.0000,     0.9504E-04, 0.7165; ...
                 0.0000,     0.0000,     0.0000,     0.7123E-04 ];

  return
end
