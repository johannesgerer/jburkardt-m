function check = chi_square_check ( a )

%*****************************************************************************80
%
%% CHI_SQUARE_CHECK checks the parameter of the central Chi squared PDF.
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
%    Input, real A, the parameter of the distribution.
%    1 <= A.
%
%    Output, logical CHECK, is true if the parameters are legal.
%
  if ( a < 1.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'CHI_SQUARE_CHECK - Fatal error!\n' );
    fprintf ( 1, '  A < 1.0.\n' );
    error ( 'CHI_SQUARE_CHECK - Fatal error!'\n' );
    check = 0;
    return
  end

  check = 1;

  return
end
