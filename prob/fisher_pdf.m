function pdf = fisher_pdf ( x, kappa, mu )

%*****************************************************************************80
%
%% FISHER_PDF evaluates the Fisher PDF.
%
%  Discussion:
%
%    The formulat for the PDF is:
%
%      PDF(KAPPA,MU;X) = C(KAPPA) * exp ( KAPPA * MU' * X )
%
%    where:
%
%      0 <= KAPPA is the concentration parameter,
%      MU is a point on the unit sphere, the mean direction,
%      X is any point on the unit sphere,
%      and C(KAPPA) is a normalization factor:
%
%      C(KAPPA) = sqrt ( KAPPA ) / ( ( 2 * pi )**(3/2) * I(0.5,KAPPA) )
%
%    where
%
%      I(nu,X) is the Bessel function of order NU and argument X.
%
%    For a fixed value of MU, the value of KAPPA determines the
%    tendency of sample points to tend to be near MU.  In particular,
%    KAPPA = 0 corresponds to a uniform distribution of points on the
%    sphere, but as KAPPA increases, the sample points will tend to
%    cluster more closely to MU.
%
%    The Fisher distribution for points on the unit sphere is
%    analogous to the normal distribution of points on a line,
%    and, more precisely, to the von Mises distribution on a circle.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 September 2008
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Kanti Mardia, Peter Jupp,
%    Directional Statistics,
%    Wiley, 2000,
%    LC: QA276.M335
%
%  Parameters:
%
%    Input, real X(3), the argument of the PDF.
%    X should have unit Euclidean norm, but this routine will
%    automatically work with a normalized version of X.
%
%    Input, real KAPPA, the concentration parameter.
%    0 <= KAPPA is required.
%
%    Input, real MU(3), the mean direction.
%    MU should have unit Euclidean norm, but this routine will
%    automatically work with a normalized version of MU.
%
%    Output, real PDF, the value of the PDF.
%

%
%  Force column-vector shape.
%
  x = x ( : );
  mu = mu ( : );

  nb = 1;

  if ( kappa < 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'FISHER_PDF - Fatal error!\n' );
    fprintf ( 1, '  KAPPA must be nonnegative.\n' );
    fprintf ( 1, '  Input KAPPA = %f\n', kappa );
    error ( 'FISHER_PDF - Fatal error!' );
  end

  if ( kappa == 0.0 )
    pdf = 1.0 / ( 4.0 * pi );
    return;
  end

  alpha = 0.5;
  ize = 1;

  [ b, ncalc ] = ribesl ( kappa, alpha, nb, ize );

  cf = sqrt ( kappa ) / ( sqrt ( ( 2.0 * pi )^3 ) * b(1) );

  mu_norm = norm ( mu );

  if ( mu_norm == 0.0 )
    pdf = cf;
    return
  end

  x_norm = norm ( x );

  if ( x_norm == 0.0 )
    pdf = cf;
    return
  end

  arg = kappa * ( x(1:3)' * mu(1:3) ) / ( x_norm * mu_norm );

  pdf = cf * exp ( arg );

  return
end
