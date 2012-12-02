function check = log_series_check ( a )

%*****************************************************************************80
%
%% LOG_SERIES_CHECK checks the parameter of the Logarithmic Series PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 December 1999
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, the parameter of the PDF.
%    0.0 < A < 1.0.
%
%    Output, logical CHECK, is true if the parameters are legal.
%
  if ( a <= 0.0 | 1.0 <= a )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LOG_SERIES_CHECK - Fatal error!\n' );
    fprintf ( 1, '  A <= 0.0D+00 or 1.0D+00 <= A\n' );
    check = 0;
    return
  end

  check = 1;

  return
end
