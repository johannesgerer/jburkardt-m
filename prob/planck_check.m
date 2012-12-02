function check = planck_check ( a, b )

%*****************************************************************************80
%
%% PLANCK_CHECK checks the parameters of the Planck PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    26 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, B, the parameters of the PDF.
%    0.0D+00 < A,
%    0.0D+00 < B.
%
%    Output, logical CHECK, is TRUE if the parameters are legal.
%
  if ( a <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PLANCK_CHECK - Fatal error!\n' );
    fprintf ( 1, '  A <= 0.\n' );
    check = 0;
    stop
  end

  if ( b <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'PLANCK_CHECK - Fatal error!\n' );
    fprintf ( 1, '  B <= 0.\n' );
    check = 0;
    stop
  end

  check = 1;

  return
end
