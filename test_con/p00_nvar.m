function nvar = p00_nvar ( problem, option )

%*****************************************************************************80
%
%% P00_NVAR sets the number of variables for any problem.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    14 October 2008
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer PROBLEM, the problem index.
%
%    Input, integer OPTION, the option index.
%
%    Output, integer NVAR, the number of variables.
%
  if (  problem == 1 )
    nvar = p01_nvar ( option );
  elseif ( problem == 2 )
    nvar = p02_nvar ( option );
  elseif ( problem == 3 )
    nvar = p03_nvar ( option );
  elseif ( problem == 4 )
    nvar = p04_nvar ( option );
  elseif ( problem == 5 )
    nvar = p05_nvar ( option );
  elseif ( problem == 6 )
    nvar = p06_nvar ( option );
  elseif ( problem == 7 )
    nvar = p07_nvar ( option );
  elseif ( problem == 8 )
    nvar = p08_nvar ( option );
  elseif ( problem == 9 )
    nvar = p09_nvar ( option );
  elseif ( problem == 10 )
    nvar = p10_nvar ( option );
  elseif ( problem == 11 )
    nvar = p11_nvar ( option );
  elseif ( problem == 12 )
    nvar = p12_nvar ( option );
  elseif ( problem == 13 )
    nvar = p13_nvar ( option );
  elseif ( problem == 14 )
    nvar = p14_nvar ( option );
  elseif ( problem == 15 )
    nvar = p15_nvar ( option );
  elseif ( problem == 16 )
    nvar = p16_nvar ( option );
  elseif ( problem == 17 )
    nvar = p17_nvar ( option );
  elseif ( problem == 18 )
    nvar = p18_nvar ( option );
  elseif ( problem == 19 )
    nvar = p19_nvar ( option );
  elseif ( problem == 20 )
    nvar = p20_nvar ( option );
  else
    printf ( 1, '\n' );
    printf ( 1, 'P00_NVAR - Fatal error!\n' );
    printf ( 1, '  Unrecognized problem number = %d\n', problem );
    error ( 'P00_NVAR - Fatal error!' );
  end

  return
end
