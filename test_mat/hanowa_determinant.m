function determ = hanowa_determinant ( alpha, n )

%*****************************************************************************80
%
%% HANOWA_DETERMINANT returns the determinant of the HANOWA matrix.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 October 2007
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real ALPHA, the scalar defining the Hanowa matrix.  A
%    typical value is -1.0.
%
%    Input, integer N, the order of A.  N must be even.
%
%    Output, real DETERM, the determinant.
%
  if ( mod ( n, 2 ) ~= 0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'HANOWA_DETERMINANT - Fatal error!\n' );
    fprintf ( 1, '  Input N = %d\n', n );
    fprintf ( 1, '  but N must be a multiple of 2.\n' );
    error ( 'HANOWA_DETERMINANT - Fatal error!' );
  end

  determ = 1.0;

  for i = 1 : floor ( n / 2 )
    determ = determ * ( alpha * alpha + i * i );
  end

  return
end
