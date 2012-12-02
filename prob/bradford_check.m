function check = bradford_check ( a, b, c )

%*****************************************************************************80
%
%% BRADFORD_CHECK checks the parameters of the Bradford PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, C, the parameters of the PDF.
%    A < B,
%    0.0 < C.
%
%    Output, logical CHECK, is TRUE if the parameters are legal.
%
  if ( b <= a )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'BRADFORD_CHECK - Fatal error!\n' );
    fprintf ( 1, '  B <= A.\n' );
    check = 0;
  end

  if ( c <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'BRADFORD_CHECK - Fatal error!\n' );
    fprintf ( 1, '  C <= 0.\n' );
    check = 0;
  end

  check = 1;

  return
end
