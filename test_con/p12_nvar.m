function nvar = p12_nvar ( option )

%*****************************************************************************80
%
%% P12_NVAR sets the number of variables for problem 12.
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
    npolys = 2;
    nderiv = 1;
  elseif ( option == 2 )
    npolys = 4;
    nderiv = 1;
  elseif ( option == 3 )
    npolys = 4;
    nderiv = 2;
  elseif ( option == 4 )
    npolys = 6;
    nderiv = 1;
  elseif ( option == 5 )
    npolys = 6;
    nderiv = 2;
  elseif ( option == 6 )
    npolys = 6;
    nderiv = 3;
  end

  nint = 8;
  nvary = nint * npolys;
  nbcz = 1;
  nbco = 1;
  nvarz = nbcz + ( nint - 1 ) * nderiv + nbco;
  nvar = nvary + nvarz + 1;

  return
end
