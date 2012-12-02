function check = log_uniform_check ( a, b )

%*****************************************************************************80
%
%% LOG_UNIFORM_CHECK checks the parameters of the Log Uniform CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, the parameters of the PDF.
%    1.0 < A < B.
%
%    Output, logical LOG_UNIFORM_CHECK, is true if the parameters are legal.
%
  if ( a <= 1.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'LOG_UNIFORM_CHECK - Fatal error!\n' );
    fprintf ( 1, '  A <= 1.\n' );
    check = 0;
    return
  end

  if ( b <= a ) then
    fprintf ( 1,  '\n' );
    fprintf ( 1, 'LOG_UNIFORM_CHECK - Fatal error!\n' );
    fprintf ( 1, '  B <= A.\n' );
    check = 0;
    return
  end

  check = 1;

  return
end
