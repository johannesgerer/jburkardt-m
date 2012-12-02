function ft = f00_title ( fi )

%*****************************************************************************80
%
%% F00_TITLE returns the title for any function.
%
%  Licensing:
%
%    This code is distributed under the GNU LGPL license.
%
%  Modified:
%
%    01 August 2012
%
%  Author:
%
%    John Burkardt
%
%  Parameters:
%
%    Input, integer FI, the index of the function.
%
%    Output, string FT, the function title.
%
  if ( fi == 1 )
    ft = f01_title ( );
  elseif ( fi == 2 )
    ft = f02_title ( );
  elseif ( fi == 3 )
    ft = f03_title ( );
  elseif ( fi == 4 )
    ft = f04_title ( );
  elseif ( fi == 5 )
    ft = f05_title ( );
  elseif ( fi == 6 )
    ft = f06_title ( );
  elseif ( fi == 7 )
    ft = f07_title ( );
  elseif ( fi == 8 )
    ft = f08_title ( );
  elseif ( fi == 9 )
    ft = f09_title ( );
  elseif ( fi == 10 )
    ft = f10_title ( );
  elseif ( fi == 11 )
    ft = f11_title ( );
  elseif ( fi == 12 )
    ft = f12_title ( );
  elseif ( fi == 13 )
    ft = f13_title ( );
  else
    fprintf ( 1, '\n' );
    fprintf ( 1, 'F00_TITLE - Fatal error!\n' );
    fprintf ( 1, '  Illegal function index FI = %d\n', fi );
    error ( 'F00_TITLE - Fatal error!' );
  end

  return
end
