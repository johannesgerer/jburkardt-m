function check = deranged_check ( a )

%*****************************************************************************80
%
%% DERANGED_CHECK checks the parameter of the Deranged PDF.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    07 September 2004
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer A, the total number of items.
%    1 <= A.
%
%    Output, logical CHECK, is true if the parameters are legal.
%
  if ( a < 1 )
    fprintf ( 1, '\n' );
    fprintf ( 1, 'DERANGED_CHECK - Fatal error!\n' );
    fprintf ( 1, '  A < 1.\n' );
    check = 0;
    return
  end

  check = 1;

  return
end
