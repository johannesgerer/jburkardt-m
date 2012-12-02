function pdf = arcsin_pdf ( x, a )

%*****************************************************************************80
%
%% ARCSIN_PDF evaluates the Arcsin PDF.
%
%  Discussion:
%
%    The LOGISTIC EQUATION has the form:
%
%      X(N+1) = 4.0D+00 * LAMBDA * ( 1.0D+00 - X(N) ).
%
%    where 0 < LAMBDA <= 1.  This nonlinear difference equation maps
%    the unit interval into itself, and is a simple example of a system
%    exhibiting chaotic behavior.  Ulam and von Neumann studied the
%    logistic equation with LAMBDA = 1, and showed that iterates of the
%    function generated a sequence of pseudorandom numbers with
%    the Arcsin probability density function.
%
%    The derived sequence
%
%      Y(N) = ( 2 / PI ) * Arcsin ( SQRT ( X(N) ) )
%
%    is a pseudorandom sequence with the uniform probability density
%    function on [0,1].  For certain starting values, such as X(0) = 0, 0.75,
%    or 1.0D+00, the sequence degenerates into a constant sequence, and for
%    values very near these, the sequence takes a while before becoming
%    chaotic.
%
%    PDF(X) = 1 / ( PI * Sqrt ( A**2 - X**2 ) )
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Reference:
%
%    Daniel Zwillinger and Stephen Kokoska,
%    CRC Standard Probability and Statistics Tables and Formulae,
%    Chapman and Hall/CRC, 2000, pages 114-115.
%
%  Parameters:
%
%    Input, real X, the argument of the PDF.
%    -A < X < A.
%
%    Input, real A, the parameter of the CDF.
%    A must be positive.
%
%    Output, real PDF, the value of the PDF.
%
  if ( a <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'ARCSIN_PDF - Fatal error!\n' );
    fprintf ( 1, '  Parameter A must be positive.\n' );
    error ( 'ARCSIN_PDF - Fatal error!' );
  end

  if ( x <= -a | a <= x )
    pdf = 0.0;
  else
    pdf = 1.0 / ( pi * sqrt ( a * a - x * x ) );
  end

  return
end
