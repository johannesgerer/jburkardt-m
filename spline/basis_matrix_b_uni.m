function mbasis = basis_matrix_b_uni ( )

%*****************************************************************************80
%
%% BASIS_MATRIX_B_UNI sets up the uniform B spline basis matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    11 February 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Foley, van Dam, Feiner, Hughes,
%    Computer Graphics: Principles and Practice,
%    page 493.
%
%  Parameters:
%
%    Output, real MBASIS(4,4), the basis matrix.
%
  mbasis = [ 
    -1.0 / 6.0,   3.0 / 6.0, -3.0 / 6.0, 1.0 / 6.0; ...
     3.0 / 6.0, - 6.0 / 6.0,  3.0 / 6.0, 0.0; ...
   - 3.0 / 6.0,   0.0,        3.0 / 6.0, 0.0; ...
     1.0 / 6.0,   4.0 / 6.0,  1.0 / 6.0, 0.0 ];

  return
end
