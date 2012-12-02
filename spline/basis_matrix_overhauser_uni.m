function mbasis = basis_matrix_overhauser_uni ( )

%*****************************************************************************80
%
%% BASIS_MATRIX_OVERHAUSER_UNI sets up the uniform Overhauser spline basis matrix.
%
%  Discussion:
%
%    This basis matrix assumes that the data points P1, P2, P3 and
%    P4 are uniformly spaced in T, and that P2 corresponds to T = 0,
%    and P3 to T = 1.
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
%  Reference:
%
%    Foley, van Dam, Feiner, Hughes,
%    Computer Graphics: Principles and Practice,
%    page 505.
%
%  Parameters:
%
%    Output, real MBASIS(4,4), the basis matrix.
%
  mbasis(1,1) = - 1.0 / 2.0;
  mbasis(1,2) =   3.0 / 2.0;
  mbasis(1,3) = - 3.0 / 2.0;
  mbasis(1,4) =   1.0 / 2.0;

  mbasis(2,1) =   2.0 / 2.0;
  mbasis(2,2) = - 5.0 / 2.0;
  mbasis(2,3) =   4.0 / 2.0;
  mbasis(2,4) = - 1.0 / 2.0;

  mbasis(3,1) = - 1.0 / 2.0;
  mbasis(3,2) =   0.0;
  mbasis(3,3) =   1.0 / 2.0;
  mbasis(3,4) =   0.0;

  mbasis(4,1) =   0.0;
  mbasis(4,2) =   2.0 / 2.0;
  mbasis(4,3) =   0.0;
  mbasis(4,4) =   0.0;

  return
end
