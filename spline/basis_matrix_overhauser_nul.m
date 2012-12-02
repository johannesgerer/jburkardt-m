function mbasis = basis_matrix_overhauser_nul ( alpha )

%*****************************************************************************80
%
%% BASIS_MATRIX_OVERHAUSER_NUL sets up the nonuniform left Overhauser spline basis matrix.
%
%  Discussion:
%
%    This basis matrix assumes that the data points P1, P2, and
%    P3 are not uniformly spaced in T, and that P1 corresponds to T = 0,
%    and P2 to T = 1. (???)
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    13 February 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real ALPHA.
%    ALPHA = || P2 - P1 || / ( || P3 - P2 || + || P2 - P1 || )
%
%    Output, real MBASIS(3,3), the basis matrix.
%
  mbasis(1,1) =   1.0 / alpha;
  mbasis(1,2) = - 1.0 / ( alpha * ( 1.0 - alpha ) );
  mbasis(1,3) =   1.0 / ( 1.0 - alpha );

  mbasis(2,1) = - ( 1.0 + alpha ) / alpha;
  mbasis(2,2) =   1.0 / ( alpha * ( 1.0 - alpha ) );
  mbasis(2,3) = - alpha / ( 1.0 - alpha );

  mbasis(3,1) =   1.0;
  mbasis(3,2) =   0.0;
  mbasis(3,3) =   0.0;

  return
end
