function pdf = von_mises_pdf ( x, a, b )

%*****************************************************************************80
%
%% VON_MISES_PDF evaluates the von Mises PDF.
%
%  Formula:
%
%    PDF(X)(A,B) = EXP ( B * COS ( X - A ) ) / ( 2 * PI * I0(B) )
%
%    where:
%
%      I0(*) is the modified Bessel function of the first
%      kind of order 0.
%
%    The von Mises distribution for points on the unit circle is
%    analogous to the normal distribution of points on a line.
%    The variable X is interpreted as a deviation from the angle A,
%    with B controlling the amount of dispersion.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    28 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Jerry Banks, editor,
%    Handbook of Simulation,
%    Engineering and Management Press Books, 1998, page 160.
%
%    D J Best and N I Fisher,
%    Efficient Simulation of the von Mises Distribution,
%    Applied Statistics,
%    Volume 28, Number 2, pages 152-157.
%
%    Kanti Mardia and Peter Jupp,
%    Directional Statistics,
%    Wiley, 2000, QA276.M335
%
%  Parameters:
%
%    Input, real X, the argument of the PDF.
%    A - PI <= X <= A + PI.
%
%    Input, real A, B, the parameters of the PDF.
%    -PI <= A <= PI,
%    0.0 < B.
%
%    Output, real PDF, the value of the PDF.
%
  if ( x < a - pi )
    pdf = 0.0;
  elseif ( x <= a + pi )
    pdf = exp ( b * cos ( x - a ) ) / ( 2.0 * pi * bessel_i0 ( b ) );
  else
    pdf = 0.0;
  end

  return
end
