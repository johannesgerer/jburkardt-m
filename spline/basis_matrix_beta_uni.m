function mbasis = basis_matrix_beta_uni ( beta1, beta2 )

%*****************************************************************************80
%
%% BASIS_MATRIX_BETA_UNI sets up the uniform beta spline basis matrix.
%
%  Discussion:
%
%    If BETA1 = 1 and BETA2 = 0, then the beta spline reduces to
%    the B spline.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    12 February 2004
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
%    Input, real BETA1, the skew or bias parameter.
%    BETA1 = 1 for no skew or bias.
%
%    Input, real BETA2, the tension parameter.
%    BETA2 = 0 for no tension.
%
%    Output, real MBASIS(4,4), the basis matrix.
%
  mbasis = zeros(4,4);

  mbasis(1,1) = - 2.0 * beta1 * beta1 * beta1;
  mbasis(1,2) =   2.0 * beta2 ...
    + 2.0 * beta1 * ( beta1 * beta1 + beta1 + 1.0 );
  mbasis(1,3) = - 2.0 * ( beta2 + beta1 * beta1 + beta1 + 1.0 );
  mbasis(1,4) =   2.0;

  mbasis(2,1) =   6.0 * beta1 * beta1 * beta1;
  mbasis(2,2) = - 3.0 * beta2 ...
    - 6.0 * beta1 * beta1 * ( beta1 + 1.0 );
  mbasis(2,3) =   3.0 * beta2 + 6.0 * beta1 * beta1;
  mbasis(2,4) =   0.0;

  mbasis(3,1) = - 6.0 * beta1 * beta1 * beta1;
  mbasis(3,2) =   6.0 * beta1 * ( beta1 - 1.0 ) * ( beta1 + 1.0 );
  mbasis(3,3) =   6.0 * beta1;
  mbasis(3,4) =   0.0;

  mbasis(4,1) =   2.0 * beta1 * beta1 * beta1;
  mbasis(4,2) =   4.0 * beta1 * ( beta1 + 1.0 ) + beta2;
  mbasis(4,3) =   2.0;
  mbasis(4,4) =   0.0;

  delta = ( ( 2.0   ...
    * beta1 + 4.0 ) ...
    * beta1 + 4.0 ) ...
    * beta1 + 2.0 + beta2;

  mbasis(1:4,1:4) = mbasis(1:4,1:4) / delta;

  return
end
