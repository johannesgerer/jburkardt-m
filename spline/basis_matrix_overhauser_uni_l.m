function mbasis = basis_matrix_overhauser_uni_l ( )

%*****************************************************************************80
%
%% BASIS_MATRIX_OVERHAUSER_UNI_L sets up the left uniform Overhauser spline basis matrix.
%
%  Discussion:
%
%    This basis matrix assumes that the data points P1, P2, and P3
%    are not uniformly spaced in T, and that P1 corresponds to T = 0,
%    and P2 to T = 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 February 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Output, real MBASIS(3,3), the basis matrix.
%
  mbasis(1,1) =   2.0;
  mbasis(1,2) = - 4.0;
  mbasis(1,3) =   2.0;

  mbasis(2,1) = - 3.0;
  mbasis(2,2) =   4.0;
  mbasis(2,3) = - 1.0;

  mbasis(3,1) =   1.0;
  mbasis(3,2) =   0.0;
  mbasis(3,3) =   0.0;

  return
end
