function mbasis = basis_matrix_overhauser_nonuni ( alpha, beta )

%*****************************************************************************80
%
%% BASIS_MATRIX_OVERHAUSER_NONUNI sets up the nonuniform Overhauser spline basis matrix.
%
%  Discussion:
%
%    This basis matrix assumes that the data points P1, P2, P3 and
%    P4 are not uniformly spaced in T, and that P2 corresponds to T = 0,
%    and P3 to T = 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    23 February 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real ALPHA, BETA.
%    ALPHA = || P2 - P1 || / ( || P3 - P2 || + || P2 - P1 || )
%    BETA  = || P3 - P2 || / ( || P4 - P3 || + || P3 - P2 || ).
%
%    Output, real MBASIS(4,4), the basis matrix.
%
  mbasis(1,1) = - ( 1.0 - alpha ) * ( 1.0 - alpha ) / alpha;
  mbasis(1,2) =   beta + ( 1.0 - alpha ) / alpha;
  mbasis(1,3) =   alpha - 1.0 / ( 1.0 - beta );
  mbasis(1,4) =   beta * beta / ( 1.0 - beta );

  mbasis(2,1) =   2.0 * ( 1.0 - alpha ) * ( 1.0 - alpha ) / alpha;
  mbasis(2,2) = ( - 2.0 * ( 1.0 - alpha ) - alpha * beta ) / alpha;
  mbasis(2,3) = ( 2.0 * ( 1.0 - alpha ) ...
    - beta * ( 1.0 - 2.0 * alpha ) ) / ( 1.0 - beta );
  mbasis(2,4) = - beta * beta / ( 1.0 - beta );

  mbasis(3,1) = - ( 1.0 - alpha ) * ( 1.0 - alpha ) / alpha;
  mbasis(3,2) =   ( 1.0 - 2.0 * alpha ) / alpha;
  mbasis(3,3) =   alpha;
  mbasis(3,4) =   0.0;

  mbasis(4,1) =   0.0;
  mbasis(4,2) =   1.0;
  mbasis(4,3) =   0.0;
  mbasis(4,4) =   0.0;

  return
end
