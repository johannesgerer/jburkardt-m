function mbasis = basis_matrix_overhauser_uni_r ( )

%*****************************************************************************80
%
%% BASIS_MATRIX_OVERHAUSER_UNI_R sets up the right uniform Overhauser spline basis matrix.
%
%  Discussion:
%
%    This basis matrix assumes that the data points P(N-2), P(N-1),
%    and P(N) are uniformly spaced in T, and that P(N-1) corresponds to
%    T = 0, and P(N) to T = 1.
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
