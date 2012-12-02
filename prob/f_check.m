function check = f_check ( m, n )

%*****************************************************************************80
%
%% F_CHECK checks the parameters of the F PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 August 2006
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer M, N, the parameters of the PDF.
%    0 < M
%    0 < N
%
%    Output, logical CHECK, is TRUE if the parameters are legal.
%
  if ( m ~= round ( m ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'F_CHECK - Fatal error!\n' );
    fprintf ( 1, '  M is not an integer.\n' );
    check = 0;
  end

  if ( m <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'F_CHECK - Fatal error!\n' );
    fprintf ( 1, '  M <= 0.\n' );
    check = 0;
  end

  if ( n ~= round ( n ) )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'F_CHECK - Fatal error!\n' );
    fprintf ( 1, '  N is not an integer.\n' );
    check = 0;
  end

  if ( n <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'F_CHECK - Fatal error!\n' );
    fprintf ( 1, '  N <= 0.\n' );
    check = 0;
  end

  check = 1;

  return
end
