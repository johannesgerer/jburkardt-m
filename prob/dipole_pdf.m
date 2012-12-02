function pdf = dipole_pdf ( x, a, b )

%*****************************************************************************80
%
%% DIPOLE_PDF evaluates the Dipole PDF.
%
%  Discussion:
%
%    PDF(X)(A,B) =
%        1 / ( PI * ( 1 + X**2 ) )
%      + B**2 * ( ( 1 - X**2 ) * cos ( 2 * A ) + 2.0D+00 * X * sin ( 2 * A ) )
%      / ( PI * ( 1 + X )**2 )
%
%    Densities of this kind commonly occur in the analysis of resonant
%    scattering of elementary particles.
%
%    DIPOLE_PDF(X)(A,0) = CAUCHY_PDF(X)(A)
%    A = 0, B = 1 yields the single channel dipole distribution.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Robert Knop,
%    Algorithm 441,
%    ACM Transactions on Mathematical Software.
%
%  Parameters:
%
%    Input, real X, the argument of the PDF.
%
%    Input, real A, B, the parameters of the PDF.
%    A is arbitrary, but represents an angle, so only 0 <= A <= 2 * PI
%      is interesting,
%    and -1.0D+00 <= B <= 1.0.
%
%    Output, real PDF, the value of the PDF.
%
  pdf = 1.0 / ( pi * ( 1.0 + x * x ) ) ...
    + b * b * ( ( 1.0 - x * x ) * cos ( 2.0 * a ) ...
    + 2.0 * x * sin ( 2.0 * x ) ) / ( pi * ( 1.0 + x * x ) * ( 1.0 + x * x ) );

  return
end
