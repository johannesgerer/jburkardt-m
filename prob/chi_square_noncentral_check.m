function check = chi_square_noncentral_check ( a, b )

%*****************************************************************************80
%
%% CHI_SQUARE_NONCENTRAL_CHECK checks the parameters of the noncentral Chi Squared PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    06 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer A, the parameter of the PDF.
%    1.0 <= A.
%
%    Input, real B, the noncentrality parameter of the PDF.
%    0.0 <= B.
%
  if ( a < 1.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CHI_SQUARE_NONCENTRAL_CHECK - Fatal error!\n' );
    fprintf ( 1, '  A < 1.\n' );
    check = 0;
    error ( 'CHI_SQUARE_NONCENTRAL_CHECK - Fatal error!' );
  end

  if ( b < 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CHI_SQUARE_NONCENTRAL_CHECK - Fatal error!\n' );
    fprintf ( 1, '  B < 0.\n' );
    check = 0;
    error ( 'CHI_SQUARE_NONCENTRAL_CHECK - Fatal error!' );
  end

  check = 1;

  return
end
