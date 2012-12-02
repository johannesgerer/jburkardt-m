function check = erlang_check ( a, b, c )

%*****************************************************************************80
%
%% ERLANG_CHECK checks the parameters of the Erlang PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    08 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, integer C, the parameters of the PDF.
%    0.0 < B.
%    0 < C.
%
%    Output, logical CHECK, is true if the parameters are legal.
%
  if ( b <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'ERLANG_CHECK - Fatal error!\n' );
    fprintf ( 1, '  B <= 0.0\n' );
    check = 0;
    return
  end

  if ( c <= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'ERLANG_CHECK - Fatal error!\n' );
    fprintf ( 1, '  C <= 0.\n' );
    check = 0;
    return
  end

  check = 1;

  return
end
