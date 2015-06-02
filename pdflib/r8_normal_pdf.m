function value = r8_normal_pdf ( av, sd, rval )

%*****************************************************************************80
%
%% R8_NORMAL_PDF evaluates the PDF of a normal distribution.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    25 June 2013
%
%  Author:
%
%    Original FORTRAN90 version by Guannan Zhang.
%    MATLAB version by John Burkardt.
%
%  Parameters:
%
%    Input, real AV, the mean value.
%
%    Input, real SD, the standard deviation.
%    0.0 < SD.
%
%    Input, real RVAL, the point where the PDF is evaluated.
%
%    Output, real VALUE, the value of the PDF at RVAL.
%
  if ( sd <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_NORMAL_PDF - Fatal error!\n' );
    fprintf ( 1, '  Standard deviation must be positive.\n' );
    error ( 'R8_NORMAL_PDF - Fatal error!' );
  end

  rtemp = ( rval - av ) * ( rval - av ) * 0.5 / ( sd * sd );

  value = exp ( - rtemp ) / sd / sqrt ( 2.0 * pi );

  return
end
