function mbasis = basis_matrix_overhauser_nur ( beta )

%*****************************************************************************80
%
%% BASIS_MATRIX_OVERHAUSER_NUR sets up the nonuniform right Overhauser spline basis matrix.
%
%  Discussion:
%
%    This basis matrix assumes that the data points PN-2, PN-1, and
%    PN are not uniformly spaced in T, and that PN-1 corresponds to T = 0,
%    and PN to T = 1. (???)
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
%    Input, real BETA.
%    BETA = || P(N) - P(N-1) || / ( || P(N) - P(N-1) || + || P(N-1) - P(N-2) || )
%
%    Output, real MBASIS(3,3), the basis matrix.
%
  mbasis(1,1) =   1.0 / beta;
  mbasis(1,2) = - 1.0 / ( beta * ( 1.0 - beta ) );
  mbasis(1,3) =   1.0 / ( 1.0 - beta );

  mbasis(2,1) = - ( 1.0 + beta ) / beta;
  mbasis(2,2) =   1.0 / ( beta * ( 1.0 - beta ) );
  mbasis(2,3) = - beta / ( 1.0 - beta );

  mbasis(3,1) =   1.0;
  mbasis(3,2) =   0.0;
  mbasis(3,3) =   0.0;

  return
end
