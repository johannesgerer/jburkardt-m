function check = f_noncentral_check ( m, n )

%*****************************************************************************80
%
%% F_NONCENTRAL_CHECK checks the parameters of the F noncentral PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    30 October 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, a parameter of the PDF.
%    0 < A.
%
%    Input, integer M, N, the parameters of the PDF.
%    0 < M
%    0 < N
%
%    Output, logical CHECK, is TRUE if the parameters are legal.
%
  if ( a <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'F_NONCENTRAL_CHECK - Fatal error!\n' );
    fprintf ( 1, '  A <= 0.\n' );
    check = 0;
  end

  if ( m < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'F_NONCENTRAL_CHECK - Fatal error!\n' );
    fprintf ( 1, '  M < 1.\n' );
    check = 0;
  end

  if ( n < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'F_NONCENTRAL_CHECK - Fatal error!\n' );
    fprintf ( 1, '  N < 1.\n' );
    check = 0;
  end

  check = 1;

  return
end
