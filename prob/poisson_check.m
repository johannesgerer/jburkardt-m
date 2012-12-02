function check = poisson_check ( a )

%*****************************************************************************80
%
%% POISSON_CHECK checks the parameter of the Poisson PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    19 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, real A, the parameter of the PDF.
%    0.0 < A.
%
  if ( a <= 0.0 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'POISSON_CHECK - Fatal error!\n' );
    fprintf ( 1, '  A <= 0.\n' );
    check = 0;
    return
  end

  check = 1;

  return
end
