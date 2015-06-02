function value = r8_uniform_pdf ( lower, upper, rval )

%*****************************************************************************80
%
%% R8_UNIFORM_PDF evaluates the PDF of a uniform distribution.
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
%    Input, real LOWER, UPPER, the lower and upper range limits.
%    LOWER < UPPER.
%
%    Input, real RVAL, the point where the PDF is evaluated.
%
%    Output, real VALUE, the value of the PDF at RVAL.
%
  if ( upper <= lower )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'R8_UNIFORM_PDF - Fatal error!\n' );
    fprintf ( 1, '  For uniform PDF, the lower limit must be \n' );
    fprintf ( 1, '  less than the upper limit.\n' );
    error ( 'R8_UNIFORM_PDF - Fatal error!' );
  end

  if ( rval < lower )
    value = 0.0;
  elseif ( rval <= upper )
    value = 1.0 / ( upper - lower );
  else
    value = 0.0;
  end

  return
end
