function x = p03_start ( option, nvar )

%*****************************************************************************80
%
%% P03_START returns a starting point for problem 3.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    03 September 2008
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

  if ( option == 1 )
    x(1:3) = [ 3.0, 6.0, 0.0 ]';
  elseif ( option == 2 )
    x(1:3) = [ 5.0, 4.0, 0.0 ]';
  elseif ( option == 3 )
    x(1:3) = [ 6.0, 3.0, 0.0 ]';
  elseif ( option == 4 )
    x(1:3) = [ 1.0, 1.0, 0.0 ]';
  end

  return
end
