function check = uniform_discrete_check ( a, b )

%*****************************************************************************80
%
%% UNIFORM_DISCRETE_CHECK checks the parameters of the Uniform discrete CDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    22 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer A, B, the parameters of the PDF.
%    A <= B.
%
%    Output, logical CHECK, is true if the parameters are legal.
%
  if ( b < a )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'UNIFORM_DISCRETE_CHECK - Fatal error!\n' );
    fprintf ( 1, '  B < A.\n' );
    check = 0;
  end

  check = 1;

  return
end
