function x = p01_start ( option, nvar )

%*****************************************************************************80
%
%% P01_START returns a starting point for problem 1.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    02 September 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer OPTION, the option index.
%
%    Input, integer NVAR, the number of variables.
%
%    Output, real X(NVAR), the starting point.
%
  x = zeros ( nvar, 1 );

  if ( option == 1 | option == 2 | option == 3 )
    x(1:3) = [ 15.0, -2.0, 0.0 ]';
  elseif ( option == 4 | option == 5 | option == 6 )
    x(1:3) = [ 4.0, 3.0, 0.0 ]';
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'P01_START - Fatal error!\n' );
    fprintf ( 1, '  Unrecognized option  = %d\n', option );
    error ( 'P01_START - Fatal error!' );
  end

  return
end
