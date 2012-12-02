function nvar = p13_nvar ( option )

%*****************************************************************************80
%
%% P13_NVAR sets the number of variables for problem 13.
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
%    Output, integer NVAR, the number of variables.
%
  if ( option == 1 )
    m = 8;
  elseif ( option == 2 )
    m = 8;
  elseif ( option == 3 )
    m = 12;
  elseif ( option == 4 )
    m = 12;
  elseif ( option == 5 )
    m = 16;
  elseif ( option == 6 )
    m = 16;
  end

  nvar = m * m + 1;

  return
end
